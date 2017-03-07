-- ****************************************************************************
-- **
-- **  File     : /maps/FAF_TUT_SummerDuel_BO/FAF_TUT_SummerDuel_BO_script.lua
-- **  Author(s): speed2
-- **
-- **  Summary  : Main mission flow script for Summer Duel Build Order Tutorial
-- **
-- ****************************************************************************
local Cinematics = import('/lua/cinematics.lua')
local OpStrings = import('/maps/FAF_TUT_SummerDuel_BO/FAF_TUT_SummerDuel_BO_strings.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')
local ScenarioPlatoonAI = import('/lua/ScenarioPlatoonAI.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local TutorialManager = import('/lua/AI/TutAI/TutorialManager.lua')
local Utilities = import('/lua/Utilities.lua')

----------
-- Globals
----------
ScenarioInfo.Player = 1
ScenarioInfo.Tutorial_AI = 2

---------
-- Locals
---------
local Player = ScenarioInfo.Player
local Tutorial_AI = ScenarioInfo.Tutorial_AI

local tManager = TutorialManager.CreateTutorialManager()

----------
-- Startup
----------
function OnPopulate(scenario)
    ScenarioUtils.InitializeScenarioArmies()

    -- Sets Army Colors
    ScenarioFramework.SetUEFPlayerColor(Player)
    ScenarioFramework.SetArmyColor(Tutorial_AI, 144, 20, 39)
end

function OnStart(self)
    ScenarioFramework.Dialogue(OpStrings.Intro_Choice, TutorialStart, true)
    --StartBuildOrder(true)
end

------------------
-- Choice dialogue
------------------
function TutorialStart()
    -- Save props for later respawn
    ScenarioFramework.SaveMap()

    -- Choice dialogue
    local dialogue = CreateDialogue('What do you want to do?', {'Watch map basic info', 'Watch build order', 'Try the build order'})
    dialogue.OnButtonPressed = function(self, info)
        dialogue:Destroy()
        if info.buttonID == 1 then
            ForkThread(MapIntro)
        elseif info.buttonID == 2 then
            StartBuildOrder()
        else
            SpawnPlayer()
        end
    end
end

----------------------
-- Map info cinematics
----------------------
function MapIntro()
    -- Vision to the map
    Utilities.UserConRequest('SallyShears')

    -- MarkReclaimAreas({'Reclaim_Area_1', 'Reclaim_Area_2', 'Reclaim_Area_3'})

    Cinematics.EnterNISMode()

    WaitSeconds(1)

    -- Initial Camera
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_MapInfo'), 2)
    ScenarioFramework.Dialogue(OpStrings.MapInfo, nil, true)
    WaitSeconds(10)

    -- Starting Position
    ScenarioFramework.Dialogue(OpStrings.StartPosition, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_StartPosition'), 3)
    WaitSeconds(1)

    -- Reclaim near hhill
    ScenarioFramework.Dialogue(OpStrings.Stones, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Stones'), 2)
    WaitSeconds(4)

    -- Middle Pass
    ScenarioFramework.Dialogue(OpStrings.MainRoute, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_MainRoute'), 3)
    WaitSeconds(4)

    -- North route
    ScenarioFramework.Dialogue(OpStrings.NorthernChoke, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_NorthernChoke'), 2)
    WaitSeconds(4)

    -- South route
    ScenarioFramework.Dialogue(OpStrings.SouthernChoke, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_SouthernChoke'), 3)
    WaitSeconds(2)

    -- Bottom Pass
    ScenarioFramework.Dialogue(OpStrings.ACURush, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_ACURush'), 5)
    WaitSeconds(9)

    -- North Area 
    ScenarioFramework.Dialogue(OpStrings.StartBuildOrder, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_StartBuildOrder'), 4)
    WaitSeconds(1)

    Cinematics.ExitNISMode()

    Utilities.UserConRequest('SallyShears')

    StartBuildOrder(true)
end

----------------------
-- Example Build Order
----------------------
function StartBuildOrder(skipZoom)
    Sync.NoOrdersAllowed = true
    -- Switch Army veiw
    Utilities.UserConRequest('SetFocusArmy 1')
    -- SimConExecute('SetFocusArmy 1')

    if not skipZoom then
        -- Move camera to the right place
        ScenarioFramework.StartOperationJessZoom('AI_Start')
    end

    tManager:SetEngineersOrders({
        ACU = {
            {build = 'ACU_Initial'}, -- groupName OR {unitName1, unitName2, ...}, if there's a marker with the same name as the building, move order will be issued first
            {move = 'ACU_Move_1'},
            {assist = {'Engineer', 1}},
            {wait = {'Units_Active', 3, categories.ueb0101}},
            {move = 'ACU_Move_Enemy'},
        },
        Engineers = {
            { -- Engineer 1
                {build = 'Engineer1_Build'},
            },
            { -- Engineer 2
                {build = {'1_Eng2_Mex'}},
                {move = 'Eng2_Move'},
                {attackmove = 'Eng2_AttackMove'},
            },
            { -- Engineer 3
                {build = 'Engineer3_Build'},
            },
            { -- Engineer 4
                {move = 'Eng4_Move'},
                {assist = {'Engineer', 1}},
            },
            { -- Engineer 5
                {build = 'Engineer5_Build'},
                {attackmove = 'Eng5_AttackMove'},
            },
            { -- Engineer 6
                {move = 'Eng6_Move'},
                {assist = {'Engineer', 1}},
            },
            { -- Engineer 7
                {build = 'Engineer7_Build'},
                {attackmove = 'Eng7_AttackMove'},
            },
        },
    })

    tManager:SetFactoriesQueue({
        Air = {
            { -- Factory 1
                { -- Order 1
                    build = {
                        {'uea0101', 1}, -- T1 Air Scout
                        {'uea0102', 3}, -- T1 Interceptor
                    },
                    RallyPoint = 'Air_Fac_Rally',
                    RepeatBuild = true,
                },
            },
        },
        Land = {
            { -- Factory 1
                { -- Order 1
                    build = {
                        {'uel0105', 3},
                        {'uel0201', 1},
                        {'uel0101', 2},
                        {'uel0105', 2},
                        {'uel0201', 1},
                        {'uel0101', 1},
                        {'uel0105', 1},
                        {'uel0201', 2},
                        {'uel0105', 1},
                        {'uel0201', 2},
                        {'uel0105', 1},
                        {'uel0201', 2},
                        {'uel0105', 1},
                        {'uel0201', 2},
                    },
                    RallyPoint = 'Fac_1_Rally',
                    RepeatBuild = true,
                },
                {wait = {'Units_Active', 3, categories.ueb0101, ClearCommands = false}},
                {RallyPoint = 'Final_Rally'},
            },
            { -- Factory 2
                { -- Order 1
                    build = {
                        {'uel0201', 5},
                        {'uel0101', 1},
                        {'uel0103', 2},
                    },
                    RallyPoint = 'Fac_2_Rally',
                    RepeatBuild = true,
                },
                {wait = {'Units_Active', 3, categories.ueb0101, ClearCommands = false}},
                {RallyPoint = 'Final_Rally'},
            },
            { -- Factory 3
                { -- Order 1
                    assist = 2,
                },
            },
            { -- Factory 4
                { -- Order 1
                    assist = 2,
                },
            },
            { -- Factory 5
                { -- Order 1
                    assist = 2,
                },
            },
        },
    })

    tManager:SetAttackGroups({
        { -- Attack Group 1
            units = {{'uel0201', 1}},
            orders = {
                {move = 'AttackGroup1_Move_1'},
            },
        },
        { -- Attack Group 2
            units = {{'uel0101', 1}},
            orders = {
                {assist = {'AttackGroup', 1}},
            },
        },
        { -- Attack Group 3
            units = {{'uel0101', 1}},
            orders = {
                {move = 'AttackGroup3_Move_1'},
            },
        },
        { -- Attack Group 4
            units = {{'uel0201', 2}},
            orders = {
                {move = 'AttackGroup4_Move_1'},
            },
        },
        { -- Attack Group 5
            units = {{'uel0101', 1}},
            orders = {
                {assist = {'AttackGroup', 4}},
            },
        },
        { -- Attack Group 6
            units = {{'uea0101', 1}},
            orders = {
                {patrol = 'AirScout_Patrol_Chain'},
            },
        },
    })

    tManager:SetVoiceOvers(OpStrings, {
        LandFirst = 'Start',
        FirstEngineer = 'Engineer1',
        SecondEngineer = 'Engineer2',
        ThirdEngineer = 'Engineer3',
        TankScout = 'AttackGroup2',
        SecondScout = 'AttackGroup3',
        SecondFactory = 'LandFactory2',
        FourthEngineer = 'Engineer4',
        FithEngineer = 'Engineer5',
        DualTank = 'AttackGroup4',
        ACUMove = {'Units_Active', 3, categories.ueb0101},
        SeventhEngineer = 'Engineer7',
        AirFactory = 'AirFactory1',
        -- FollowUp = {'Units_Active', 1, categories.ueb3101, SpawnPlayer},
    })
    tManager:Initialize()
end

--------------------------------
-- Player's build order practise
--------------------------------
function SpawnPlayer()
    Sync.NoOrdersAllowed = false
    -- Switch back to player's army
    Utilities.UserConRequest('SetFocusArmy 0')

    -- Reset the map props
    ScenarioFramework.ResetMap()

    ScenarioFramework.StartOperationJessZoom('Player_Start')

    -- Spawn ACU, name it
    ScenarioFramework.SpawnCommander('Player', 'Commander', 'Warp', true)
end

--------
-- Debug
--------
function OnCtrlF3()
    SaveMap()
end

function OnCtrlF4()
    ResetMap()
end

function OnShiftF3()
    LOG(repr(Scenario.Chains))
end

function OnShiftF4()
end