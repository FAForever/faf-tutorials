-- ****************************************************************************
-- **
-- **  File     : /maps/FAF_TUT_Theta_BO/FAF_TUT_Theta_BO_script.lua
-- **  Author(s): speed2
-- **
-- **  Summary  : Main mission flow script for Theta Build Order Tutorial
-- **
-- ****************************************************************************
local Cinematics = import('/lua/cinematics.lua')
local OpStrings = import('/maps/FAF_TUT_Theta_BO/FAF_TUT_Theta_BO_strings.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')
local ScenarioPlatoonAI = import('/lua/ScenarioPlatoonAI.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local Utilities = import('/lua/Utilities.lua')

----------
-- Globals
----------
ScenarioInfo.Player = 1
ScenarioInfo.speed2_AI = 2
ScenarioInfo.ARMY_9 = 3
ScenarioInfo.NEUTRAL_CIVILIAN = 4

---------
-- Locals
---------
local Player = ScenarioInfo.Player
local speed2_AI = ScenarioInfo.speed2_AI
local ARMY_9 = ScenarioInfo.ARMY_9
local NEUTRAL_CIVILIAN = ScenarioInfo.NEUTRAL_CIVILIAN

-- Table to track down units were already used by script
local UsedUnits = {}

--------------
-- Debug only!
--------------
local Debug = false     -- Skipping initial cinematics

----------
-- Startup
----------
function OnPopulate(scenario)
	ScenarioUtils.InitializeScenarioArmies()

	-- Sets Army Colors
    ScenarioFramework.SetUEFPlayerColor(Player)
    ScenarioFramework.SetArmyColor(speed2_AI, 144, 20, 39)
end

function OnStart(self)
	-- SaveMap()

	-- Initial Camera
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Init'))

	if not Debug then
    	ForkThread(TutorialStart)
    else
    	StartBuildOrder()
    end
end

function TutorialStart()

	-- Vision to the map
	Utilities.UserConRequest('SallyShears')
	Utilities.UserConRequest('ren_IgnoreDecalLOD')

	Cinematics.EnterNISMode()

	--Utilities.UserConRequest('UI_RenResources') -- doesn't really work, might bee limited by engine

	WaitSeconds(3)
	ScenarioFramework.Dialogue(OpStrings.Intro, nil, true)

	-- Starting Position
	ScenarioFramework.Dialogue(OpStrings.StartPosition)
	WaitSeconds(10)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Starting_Position'), 3)
	WaitSeconds(5)

	-- Reclaim near base
	ScenarioFramework.Dialogue(OpStrings.ReclaimNearBase)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_ReclaimNearBase'), 2)
	WaitSeconds(5)

	-- Reclaim in middle
	ScenarioFramework.Dialogue(OpStrings.ReclaimMiddle)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Reclaim'), 3)
	WaitSeconds(6)

	-- Civ buildings
	ScenarioFramework.Dialogue(OpStrings.MiddleWrecks)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Civs'), 2)
	WaitSeconds(3)

	-- More info about middle pass
	ScenarioFramework.Dialogue(OpStrings.InfoAboutMiddle)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Middle_Pass'), 3)
	WaitSeconds(7)

	-- Bottom Pass
	ScenarioFramework.Dialogue(OpStrings.BottomPassage)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_South_Pass'), 3)
	WaitSeconds(9)

	-- North Area 
	ScenarioFramework.Dialogue(OpStrings.NorthPart)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Main'), 4)
	WaitSeconds(9)

	-- North Mexes
	ScenarioFramework.Dialogue(OpStrings.NorthPlateau)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Top_Expansion'), 2)
	WaitSeconds(7)

	-- Final words
	ScenarioFramework.Dialogue(OpStrings.NorthPlateau2)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Final'), 5)
	WaitSeconds(6)

	-- Move to Starting position
	ScenarioFramework.Dialogue(OpStrings.StartBuildOrder)
	Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_BO_Start'), 3)
	WaitSeconds(1)

	Utilities.UserConRequest('ren_IgnoreDecalLOD')
	-- Utilities.UserConRequest('UI_RenResources')

	Cinematics.ExitNISMode()
	StartBuildOrder()
end

----------------------
-- Example Build Order
----------------------
-- ACU Orders
function StartBuildOrder()
	-- Switch Army veiw
	Utilities.UserConRequest('SetFocusArmy 1')

	-- Spawn ACU
	ScenarioInfo.AI_ACU = ScenarioFramework.SpawnCommander('speed2_AI', 'Commander', 'Warp', true, true)

	-- Initial Build Order
	EngineerBuildUnit('speed2_AI', ScenarioInfo.AI_ACU, 'Fac1', 'Pgen1', 'Mex1')
	IssueMove({ScenarioInfo.AI_ACU}, ScenarioUtils.MarkerToPosition('ACU_Move_01'))
	EngineerBuildUnit('speed2_AI', ScenarioInfo.AI_ACU, 'Mex2')
	IssueMove({ScenarioInfo.AI_ACU}, ScenarioUtils.MarkerToPosition('ACU_Move_02'))
	EngineerBuildUnit('speed2_AI', ScenarioInfo.AI_ACU, 'Mex3')
	IssueMove({ScenarioInfo.AI_ACU}, ScenarioUtils.MarkerToPosition('ACU_Move_03'))
	EngineerBuildUnit('speed2_AI', ScenarioInfo.AI_ACU, 'Mex4')
	IssueMove({ScenarioInfo.AI_ACU}, ScenarioUtils.MarkerToPosition('ACU_Move_04'))

	-- Much test
	--EngineerBuildUnit('speed2_AI', ScenarioInfo.AI_ACU, 'North_Expansion')

	-- Trigger to assign orders in factory soon after it's started
	ScenarioFramework.CreateTimerTrigger(FirstFactoryBuilt, 5)
end

-- First Factory Orders
function FirstFactoryBuilt()
	-- Set up factory and it's rally point
	ScenarioInfo.Factory_1 = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.ueb0101)

	IssueClearFactoryCommands({ScenarioInfo.Factory_1})
	IssueFactoryRallyPoint({ScenarioInfo.Factory_1}, ScenarioUtils.MarkerToPosition('Fac_1_Rally'))
	--IssueAggressiveMove({ScenarioInfo.Factory_1}, ScenarioUtils.MarkerToPosition('Fac_1_Rally')) -- TODO: Find out how to make factory attack move

	-- Build queue
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0105', 3) -- T1 Engie
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0201', 2) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0101', 2) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0105', 2) -- T1 Engie
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0201', 2) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0105', 2) -- T1 Engie
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0201', 2) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_1}, 'uel0101', 1) -- T1 Scout
	
	loopFactoryBuildOrder(ScenarioInfo.Factory_1, 'uel0105')

	-- Triggers for units
	-- Engineer 1
	ScenarioFramework.CreateArmyStatTrigger(Engineer_1_Built, ArmyBrains[speed2_AI], 'Engineer_1_Built', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 1, Category = categories.uel0105}})
	-- Engineer 2
	ScenarioFramework.CreateArmyStatTrigger(NorthExpansion, ArmyBrains[speed2_AI], 'Engineer_2_Built', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 2, Category = categories.uel0105}})
	-- Engineer 3
	ScenarioFramework.CreateArmyStatTrigger(SouthExpansion, ArmyBrains[speed2_AI], 'Engineer_3_Built', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 3, Category = categories.uel0105}})
	-- Engineer 4
	ScenarioFramework.CreateArmyStatTrigger(Engineer_4_Built, ArmyBrains[speed2_AI], 'Engineer_4_Built', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 4, Category = categories.uel0105}})
	-- Engineer 5
	ScenarioFramework.CreateArmyStatTrigger(Engineer_5_Built, ArmyBrains[speed2_AI], 'Engineer_5_Built', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 5, Category = categories.uel0105}})
	-- Raiding group 1
	--ScenarioFramework.CreateArmyStatTrigger(Raid_1_Built, ArmyBrains[speed2_AI], 'Raid_1_Built', 
        --{{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 2, Category = categories.uel0201 + categories.uel0101}})

end

-- Engineer 1 Build order
function Engineer_1_Built()
	ScenarioInfo.Engie_1 = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.uel0105)
	IssueClearCommands({ScenarioInfo.Engie_1})

	IssueMove({ScenarioInfo.Engie_1}, ScenarioUtils.MarkerToPosition('Engie_1_Move_01'))

	EngineerBuildUnit('speed2_AI', ScenarioInfo.Engie_1, 'Hydro', 'Fac2', 'Fac3', 'Pgen2', 'Pgen3', 'Fac4', 'Fac5')

	IssueGuard({ScenarioInfo.AI_ACU}, ScenarioInfo.Engie_1)

	-- Second Factory trigger
	ScenarioFramework.CreateArmyStatTrigger(SecondFactory, ArmyBrains[speed2_AI], 'SecondFactory', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 2, Category = categories.ueb0101}})
end

-- Engineer 2 Build order
function NorthExpansion()
	ScenarioInfo.NorthEngie = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.uel0105)
	IssueClearCommands({ScenarioInfo.NorthEngie})

	-- Reclaim few rocks before going for mex
	-- TODO: Find a way to set order of this manual reclaim, close rocks right?
	--[[
	for k, prop in GetReclaimablesInRect(ScenarioUtils.AreaToRect('Reclaim_Area_1')) do
		IssueReclaim({ScenarioInfo.NorthEngie}, prop)
	end
	]]--
	IssueMove({ScenarioInfo.NorthEngie}, ScenarioUtils.MarkerToPosition('Engie_North_Attack_Move_1_1'))
	IssueAggressiveMove({ScenarioInfo.NorthEngie}, ScenarioUtils.MarkerToPosition('Engie_North_Attack_Move_1_2'))

	EngineerBuildUnit('speed2_AI', ScenarioInfo.NorthEngie, 'North_Mex_1', 'North_Mex_2')
	--IssueMove({ScenarioInfo.NorthEngie}, ScenarioUtils.MarkerToPosition('Engie_North_Attack_Move_2_1'))
	IssueAggressiveMove({ScenarioInfo.NorthEngie}, ScenarioUtils.MarkerToPosition('Engie_North_Attack_Move_2_2'))
	EngineerBuildUnit('speed2_AI', ScenarioInfo.NorthEngie, 'North_Mex_3',
															'North_Mex_4',
															'North_Mex_5',
															'Wall_01',
															'Wall_02',
															'Wall_03',
															'Wall_04',
															'Wall_05',
															'Wall_06',
															'Wall_07',
															'Wall_08',
															'Wall_09',
															'Wall_10',
															'Wall_11',
															'Wall_12',
															'Wall_13',
															'Wall_14',
															'PD_North',
															'Wall_PD_N_1',
															'Wall_PD_N_2',
															'Wall_PD_N_3',
															'Wall_PD_N_4',
															'Wall_PD_N_5',
															'Wall_PD_N_6',
															'Wall_PD_N_7',
															'Wall_PD_N_8',
															'Radar_North')
	IssueMove({ScenarioInfo.NorthEngie}, ScenarioUtils.MarkerToPosition('North_Engie_Hide'))
end

-- Engineer 3 Build order
function SouthExpansion()
	ScenarioInfo.SouthEngie = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.uel0105)
	IssueClearCommands({ScenarioInfo.SouthEngie})
	EngineerBuildUnit('speed2_AI', ScenarioInfo.SouthEngie, 'South_Mex_1',
															'South_Mex_2',
															'South_Mex_3',
															'PD_South',
															'Wall_PD_S_1',
															'Wall_PD_S_2',
															'Wall_PD_S_3',
															'Wall_PD_S_4',
															'Wall_PD_S_5',
															'Wall_PD_S_6',
															'Wall_PD_S_7',
															'Wall_PD_S_8',
															'Radar_South')
	IssueAggressiveMove({ScenarioInfo.SouthEngie}, ScenarioUtils.MarkerToPosition('South_Engie_Reclaim_1'))
	IssueAggressiveMove({ScenarioInfo.SouthEngie}, ScenarioUtils.MarkerToPosition('South_Engie_Reclaim_2'))
end

-- Second Factory orders, move ACU to mid once factory is built
function SecondFactory()
	-- Set up factory and it's rally point
	ScenarioInfo.Factory_2 = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.ueb0101)
	IssueClearFactoryCommands({ScenarioInfo.Factory_2})
	IssueFactoryRallyPoint({ScenarioInfo.Factory_2}, ScenarioUtils.MarkerToPosition('Fac_2_Rally'))

	-- Build queue
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0201', 5) -- T1 Tank
	IssueBuildFactory({ScenarioInfo.Factory_2}, 'uel0101', 1) -- T1 Scout
	--ScenarioInfo.Factory_1:ProcessInfo('SetRepeatQueue', true) -- TODO: Find out how to set repeat build

	-- Move ACU to mid for reclaim, build mex on the way
	IssueClearCommands({ScenarioInfo.AI_ACU})
	IssueMove({ScenarioInfo.AI_ACU}, ScenarioUtils.MarkerToPosition('ACU_Move_05'))
	EngineerBuildUnit('speed2_AI', ScenarioInfo.AI_ACU, 'Mex_Middle')
	IssueMove({ScenarioInfo.AI_ACU}, ScenarioUtils.MarkerToPosition('ACU_Move_06'))

	for k, prop in GetReclaimablesInRect(ScenarioUtils.AreaToRect('Reclaim_Middle')) do
		IssueReclaim({ScenarioInfo.AI_ACU}, prop)
	end
	
	-- Triggers for other factories
	ScenarioFramework.CreateArmyStatTrigger(Factory_3_Built, ArmyBrains[speed2_AI], 'Factory_3', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 3, Category = categories.ueb0101}})
	ScenarioFramework.CreateArmyStatTrigger(Factory_4_Built, ArmyBrains[speed2_AI], 'Factory_4', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 4, Category = categories.ueb0101}})
	ScenarioFramework.CreateArmyStatTrigger(Factory_5_Built, ArmyBrains[speed2_AI], 'Factory_5', 
        {{StatType = 'Units_Active', CompareType = 'GreaterThanOrEqual', Value = 5, Category = categories.ueb0101}})
end

-- Other factories will assist second factory which is producing units
function Factory_3_Built()
	ScenarioInfo.Factory_3 = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.ueb0101)
	IssueFactoryAssist({ScenarioInfo.Factory_3}, ScenarioInfo.Factory_2)
end

function Factory_4_Built()
	ScenarioInfo.Factory_4 = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.ueb0101)
	IssueFactoryAssist({ScenarioInfo.Factory_4}, ScenarioInfo.Factory_2)
end

function Factory_5_Built()
	ScenarioInfo.Factory_5 = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.ueb0101)
	IssueFactoryAssist({ScenarioInfo.Factory_5}, ScenarioInfo.Factory_2)
end

function Engineer_4_Built()
	ScenarioInfo.Engie_4 = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.uel0105)
	IssueClearCommands({ScenarioInfo.Engie_4})
	IssueGuard({ScenarioInfo.Engie_4}, ScenarioInfo.Engie_1)
end

function Engineer_5_Built()
	ScenarioInfo.Engie_5 = GetNextUnitOfCategory(ArmyBrains[speed2_AI], categories.uel0105)
	IssueClearCommands({ScenarioInfo.Engie_5})
	IssueGuard({ScenarioInfo.Engie_5}, ScenarioInfo.Engie_1)
end

-- TODO: once build order ends, swich back to player's army view and let him try the build order.
--------------------------------
-- Player's build order practise
--------------------------------
function SwitchBackToPlayerView()
	Utilities.UserConRequest('SetFocusArmy 0')
end

-------------------
-- Custom functions
-------------------
-- Currently having these functions with a map, but later it might need it's own mod as coop or having it direclty in FAF patch



-- Functions for resering reclaim on the map, TODO: 1) make ResetMap() work
--													2) ignore wreckages, those can be spawned easily
--													3) make some UI button to reset the map
-- Tables for reseting map
local InitialProps = {}
local InitialBuildings = {}

function SaveMap()
    for _, props in GetReclaimablesInRect(Rect(0,0,256,256)) do
        local ID = props:GetBlueprint().BlueprintId
        InitialProps[ID] = {pos = props:GetPosition(), prop = props}
    end
end
 
function ResetMap()
    for ID, table in InitialProps do
        if not table.prop.IsWreckage then
            table.prop:Destroy()
            CreateProp(table.pos, ID)
        end
    end

    ScenarioUtils.CreateArmyGroup('ARMY_9', 'WRECKAGE', true) -- TODO: make function that will find WRECKAGE group among armies and spawn it
end

-- Function that returns engies, marking those already used
function GetNextUnitOfCategory(brain, category)
	for _, unit in brain:GetListOfUnits(category, false) do
        if not UsedUnits[unit:GetEntityId()] then
            UsedUnits[unit:GetEntityId()] = true
            return unit
        end
    end
end

-- Slightly changed function from ScenarioFramework to build single structures
function EngineerBuildUnit(army, engineer, ...)
    local aiBrain = engineer:GetAIBrain()

    for k,v in arg do
        if k != 'n' then
            local unitData = ScenarioUtils.FindUnit(v, Scenario.Armies[army].Units)
            if not unitData then
                WARN('*WARNING: Invalid unit name ' .. v)
            end
            if unitData and aiBrain:CanBuildStructureAt(unitData.type, unitData.Position) then
                aiBrain:BuildStructure(engineer, unitData.type, {unitData.Position[1], unitData.Position[3], 0}, false)
            end
        end
    end
end

-- Function to build group of structures
-- Washy's version, TODO: find a way to sort the table of unit to be build,
--						  currently it's build kinda randomly and not in alphabetical order or order it's saved in save.lua
--						  Help needed here :(

function EngineerBuildGroup(army, engineer, group)
    local aiBrain = engineer:GetAIBrain()
    local tblData = ScenarioUtils.FindUnitGroup(group, Scenario.Armies[army].Units)
 
    if not tblData then
        WARN('*WARNING: No groupd named: ' .. group)
    end
    
    for _, unit in tblData.Units do
        if 'GROUP' == unit.type then
            __EngineerBuildGroup(army, engineer, aiBrain, unit)
        else
            if unit and aiBrain:CanBuildStructureAt(unit.type, unit.Position) then
                aiBrain:BuildStructure(engineer, unit.type, {unit.Position[1], unit.Position[3], 0}, false)
            end
        end
    end
end

function __EngineerBuildGroup(army, engineer, aiBrain, g)
    if not g then
        return
    end
    for _, subG in g.Units do
        if subG.type == 'GROUP' then
            __EngineerBuildGroup(army, engineer, aiBrain, subG)
        else
            if aiBrain:CanBuildStructureAt(subG.type, subG.Position) then
                aiBrain:BuildStructure(engineer, subG.type, {subG.Position[1], subG.Position[3], 0}, false)
            end
        end
    end
end

function loopFactoryBuildOrder(factory, unit)
	while true do
		WaitSeconds(0.1)
		if factory:IsIdleState() then
			IssueBuildFactory({factory}, unit, 3)
		end
	end
end

--------
-- Debug
--------
function OnCtrlF3()
    ResetMap()
end
