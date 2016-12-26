local ScenarioFramework = import('/lua/scenarioframework.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')

TutorialManager = Class {
    -- This function just sets up variables local to the new TutorialManager Instance
    Create = function(self)
        self.Trash = TrashBag()

        self.AIBrain = false
        self.strArmy = false
        self.Initialized = false

        self.Orders = {
            ACU = {},
            Engineers = {},
            Factories = {},
            Units = {},
        }
        self.Expansions = {}

        self.Units = {
            ACU = nil,
            Engineers = {},
            Factories = {
                Land = {},
                Air = {},
                Naval = {},
                Gate = {},
            },
        }
        self.TriggerNumber = 1

        self.StringsFile = false
    end,

    -- Starts the build order
    -- Spawn ACU, assign orders. 
    -- Starts threads for monitoring built units
    Initialize = function(self, strArmy)
        if self.Initialized then
            error('*AI ERROR: TutorialManager has already been initialized', 2)
        end
        self.Initialized = true

        self.strArmy = strArmy
        self.AIBrain = GetArmyBrain(strArmy)
        self.AIBrain:PBMRemoveBuildLocation( false, 'MAIN' ) -- remove main since we dont use it in ops much

        self.Units.ACU = ScenarioFramework.SpawnCommander(strArmy, 'ACU', 'Warp', true) -- Spawn ACU
        self:ForkThread(self.AssignEngineerOrders, self.Units.ACU, nil, true) -- Orders for ACU

        self:ForkThread(self.NewFactoriesMonitor) -- Start the thread to manage newly built factories
        self:ForkThread(self.NewEngineersMonitor) -- tart the thread to manage newly built engineers
    end,

    -- Auto trashbags all threads on a base manager
    ForkThread = function(self, fn, ...)
        if fn then
            local thread = ForkThread(fn, self, unpack(arg))
            self.Trash:Add(thread)
            return thread
        else
            return nil
        end
    end,

    WaitThread = function(self, unit, data)
        local locked = true
        LOG('Wait thread ', repr(data))
        Unlock = function()
            LOG('WaitThread ended')
            locked = false
        end

        ScenarioFramework.CreateArmyStatTrigger(Unlock, self.AIBrain, 'Trigger' .. self.TriggerNumber, 
            {{StatType = data[1], CompareType = 'GreaterThanOrEqual', Value = data[2], Category = data[3]}})
        self.TriggerNumber = self.TriggerNumber + 1

        while locked do
            WaitSeconds(1)
        end
        IssueClearCommands({unit})
        IssueClearFactoryCommands({unit})
    end,

    SetVoiceOvers = function(self, file, data)
        self.StringsFile = file
    end,

    StartVoiceOvers = function(self)
    end,

    ------------
    -- Engineers
    ------------
    SetEngineerOrders = function(self, data)
        for units, tblOrders in data do
            self.Orders[units] = tblOrders
        end
        LOG('New Engineers orders set, ACU orders: ', repr(self.Orders.ACU), 'engie order: ', repr(self.Orders.Engineers))
    end,

    GetACU = function(self)
        return self.Units.ACU
    end,

    GetEnginner = function(self, number)
        return self.Units.Engineers[number]
    end,

    GetNumberOfEngineers = function(self)
        return table.getn(self.Units.Engineers)
    end,

    -- Main engineer thread, checks for newly built engineers, assign orders to them
    NewEngineersMonitor = function(self)
        LOG('Starting "NewFactoriesMonitor" thread.')
        while true do
            local units = self.AIBrain:GetListOfUnits(categories.ENGINEER - categories.COMMAND, false, true) -- NeedToBeIdle, NeedToBeBuilt

            for _, eng in units do
                if not eng.Used and eng:GetFractionComplete() == 1 then -- Need to check if unit is completed as well since the above ^^ doesn't work
                    -- Register the factory in the manager table
                    table.insert(self.Units.Engineers, eng)
                    local num = self:GetNumberOfEngineers()

                    LOG('Registering new Engineer: ' .. num)
                    eng:SetCustomName(num)

                    -- Assign orders
                    self:ForkThread(self.AssignEngineerOrders, eng, num)

                    eng.Used = true
                end
            end
            WaitSeconds(1)
        end
    end,

    AssignEngineerOrders = function(self, engineer, num, isACU)
        local tblOrders = {}
        if isACU then
            tblOrders = self.Orders.ACU
        else
            tblOrders = self.Orders.Engineers[num]
        end

        if not tblOrders then
            LOG('No oders for: Engineer ' .. num)
            return
        end

        if not isACU then
            LOG('Assigning orders for: Engineer ' .. num .. ', orders: ', repr(tblOrders))
        end

        for _, order in tblOrders do
            for action, data in order do
                if action == 'wait' then
                    self:WaitThread(engineer, data)
                elseif action == 'build' then
                    if type(data) == 'string' then
                        self:EngineerBuildGroup(engineer, data)
                    elseif type(data) == 'table' then
                        self:EngineerBuildUnit(engineer, unpack(data))
                    end
                elseif action == 'assist' then
                    self:EngineerAssist(engineer, data)
                elseif action == 'reclaim' then
                    self:EngineerReclaim(engineer, data)
                elseif action == 'move' then
                    self:EngineerMove(engineer, data)
                elseif action == 'attackmove' then
                    self:EngineerAttackMove(engineer)
                end
            end
        end
    end,

    EngineerWait = function(self, engineer)
    end,

    EngineerAssist = function(self, engineer, targetData)
        local target = nil
        local targetType = 'Engineers'
        if targetData[1] == 'Factory' then
            targetType = 'Factories'
        end

        while not target do
            target = self.Units[targetType][targetData[2]]
            WaitSeconds(1)
        end

        IssueGuard({engineer}, target)
    end,

    EngineerReclaim = function(self, engineer, area)
        LOG('reclaiming')
        if area then
            LOG(area)
            -- Move before reclaiming
            if Scenario.MasterChain._MASTERCHAIN_.Markers[area] then
                IssueMove({engineer}, Scenario.MasterChain._MASTERCHAIN_.Markers[area].position)
            end

            for k, prop in GetReclaimablesInRect(ScenarioUtils.AreaToRect(area)) do
                IssueReclaim({engineer}, prop)
            end
        end
    end,

    EngineerMove = function(self, engineer, position)
        IssueMove({engineer}, ScenarioUtils.MarkerToPosition(position))
    end,

    EngineerAttackMove = function(self, engineer)
    end,

    EngineerBuildUnit = function(self, engineer, ...)
        local aiBrain = self.AIBrain

        for k,v in arg do
            if k != 'n' then
                local unitData = ScenarioUtils.FindUnit(v, Scenario.Armies[self.strArmy].Units)
                if not unitData then
                    WARN('*WARNING: Invalid unit name ' .. v)
                end

                -- Move before building
                if Scenario.MasterChain._MASTERCHAIN_.Markers[v] then
                    IssueMove({engineer}, Scenario.MasterChain._MASTERCHAIN_.Markers[v].position)
                end
                IssueBuildMobile({engineer}, unitData.Position, unitData.type, {})
            end
        end
    end,

    EngineerBuildGroup = function(self, engineer, group)
        local aiBrain = self.AIBrain
        local tblData = ScenarioUtils.FindUnitGroup(group, Scenario.Armies[self.strArmy].Units)

        if not tblData then
            WARN('*WARNING: No groupd named: ' .. group)
        end

        units = {}
        for idx, unitData in tblData.Units do
            local _,_,num = string.find(idx, "^(%d+)")
            num = tonumber(num)
            units[num] = unitData

            -- Add move position
            if Scenario.MasterChain._MASTERCHAIN_.Markers[idx] then
                units[num].move = Scenario.MasterChain._MASTERCHAIN_.Markers[idx].position
            end
        end

        for _, unitData in units do
            if unitData.move then
                IssueMove({engineer}, unitData.move)
            end
            IssueBuildMobile({engineer}, unitData.Position, unitData.type, {})
        end
    end,

    ------------
    -- Factories
    ------------
    SetFactoriesQeue = function(self, data)
        self.Orders.Factories = data
    end,

    GetFactory = function(self, type, num)
        return self.Units.Factories[type][num]
    end,

    GetFactoryType = function(self, factory)
        local type = 'Air'
        if EntityCategoryContains(categories.LAND, factory) then
            type = 'Land' 
        elseif EntityCategoryContains(categories.NAVAL, factory) then
            type = 'Naval' 
        elseif EntityCategoryContains(categories.GATE, factory) then
            type = 'Gate' 
        end
        return type
    end,

    GetFactoryNumber = function(self, factory)
        local number = 0
        local type = self:GetFactoryType(factory)
        for num, fac in self.Units.Factories[type] do
            if fac == factory then
                number = num
                break
            end
        end
        return num
    end,

    GetNumOfFactories = function(self, type)
        return table.getn(self.Units.Factories[type])
    end,

    -- Main factory thread, checks for newly built factories, assign orders to them
    NewFactoriesMonitor = function(self)
        LOG('Starting "NewFactoriesMonitor" thread.')
        while true do
            local units = self.AIBrain:GetListOfUnits(categories.FACTORY * categories.STRUCTURE, true, true) -- NeedToBeIdle, includeUnfinished

            for _, fac in units do
                if not fac.Used then
                    -- Register the factory in the manager table
                    local type = self:GetFactoryType(fac)
                    table.insert(self.Units.Factories[type], fac)
                    local num = self:GetNumOfFactories(type)

                    LOG('Registering new factory: ' .. type .. ' Factory ' .. num)
                    fac:SetCustomName(type .. num)

                    -- Assign orders
                    self:ForkThread(self.AssignFactoryOrders, fac, type, num)

                    fac.Used = true
                end
            end
            WaitSeconds(1)
        end
    end,

    AssignFactoryOrders = function(self, factory, type, num)
        local tblOrders = self.Orders.Factories[type][num]
        local lastOrder = {}

        if not tblOrders then
            LOG('No orders for: ' .. type .. ' Factory ' .. num)
            return
        end

        WaitSeconds(3) -- Wait few seconds after factory is started, as player would do before setting build qeue

        IssueClearFactoryCommands({factory})
        for _, order in tblOrders do
            lastOrder = order
            LOG('Assigning order for: ' .. type .. ' Factory ' .. num .. ' ,orders: ', repr(lastOrder))
            for action, data in order do
                if action == 'wait' then -- First, check if we should wait until the previous order is done
                    self:SetFactoryWait(factory)
                elseif action == 'RallyPoint' then -- Second, check if rally point is changing
                    self:SetFactoryRallyPoint(factory, data)
                elseif action == 'build' then
                    self:SetFactoryBuildQeue(factory, data)
                elseif action == 'assist' then
                    self:SetFactoryAssist(factory, data)
                end
            end
        end
    end,

    -- Waiting for previous command to be done
    SetFactoryWait = function(self, factory)
        local locked = true

        while locked do
            WaitSeconds(1)
        end
    end,

    -- Factory Rally Point
    SetFactoryRallyPoint = function(self ,factory, rallyPoint)
        IssueFactoryRallyPoint({factory}, ScenarioUtils.MarkerToPosition(rallyPoint))
    end,

    -- Factory Build
    SetFactoryBuildQeue = function(self, factory, tblQeue)
        for _, data in tblQeue do
            IssueBuildFactory({factory}, data[1], data[2])
        end
    end,

    -- Factory Assist
    SetFactoryAssist = function(self, factory, num)
        local type = self:GetFactoryType(factory)

        local targetFactory = nil
        while not targetFactory do
            targetFactory = self:GetFactory(type, num)
            WaitSeconds(1)
        end

        IssueFactoryAssist({factory}, targetFactory)
    end,
}

function CreateTutorialManager()
    local tManager = TutorialManager()
    tManager:Create()
    
    LOG('Tutorial Manager Created')
    return tManager
end