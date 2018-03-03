-- *********************************************************************************
-- **
-- **  File     : /maps/FAF_TUT_EotS_BO/FAF_TUT_EotS_BO_script.lua
-- **  Author(s): speed2
-- **
-- **  Summary  : Main mission flow script for Eye of the Storm Build Order Tutorial
-- **
-- *********************************************************************************
local Cinematics = import('/lua/cinematics.lua')
local OpStrings = import('/maps/FAF_TUT_EotS_BO/FAF_TUT_EotS_BO_strings.lua')
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
    ScenarioFramework.Dialogue(OpStrings.IntroChoice_Dialogue, TutorialStart, true)
end

------------------
-- Choice dialogue
------------------
function TutorialStart()
    -- Save props for later respawn
    ScenarioFramework.SaveMap()

    -- Choice dialogue
    ScenarioFramework.CreateChoiceDialogue(
        OpStrings.IntroChoice_Title,    -- Title
        {                               -- Choices
            OpStrings.IntroChoice_MapInfo,
            OpStrings.IntroChoice_ExampleBO,
            OpStrings.IntroChoice_TryBO,
        },
        {                               -- Callbacks
            MapIntro,
            StartBuildOrder,
            SpawnPlayer,
        }
    )
end

----------------------
-- Map info cinematics
----------------------
function MapIntro()
    -- Vision to the map
    Utilities.UserConRequest('SallyShears')

    Cinematics.EnterNISMode()

    WaitSeconds(1)

    -- Initial Camera
    ScenarioFramework.Dialogue(OpStrings.MapInfo, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('MapInfo'), 10)
    WaitSeconds(6)

    -- Starting Position
    ScenarioFramework.Dialogue(OpStrings.StartPosition, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('StartPosition'), 4)
    WaitSeconds(2)

    -- Reclaim Lamp near base
    ScenarioFramework.Dialogue(OpStrings.Stones, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Lamp'), 3)
    WaitSeconds(3)

    -- East Path 1
    ScenarioFramework.Dialogue(OpStrings.MainRoute, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('EastPath1'), 3)
    WaitSeconds(4)

    -- East Path 2
    ScenarioFramework.Dialogue(OpStrings.NorthernChoke, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('EastPath2'), 3)
    WaitSeconds(3)

    -- South route
    ScenarioFramework.Dialogue(OpStrings.SouthernChoke, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('SouthPath'), 3)
    WaitSeconds(2)

    -- Middle
    ScenarioFramework.Dialogue(OpStrings.ACURush, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Middle'), 5)
    WaitSeconds(3)

    -- Oponent spawn
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('OpponentSpawn'), 10)
    WaitSeconds(2)

    -- North Area 
    ScenarioFramework.Dialogue(OpStrings.StartBuildOrder, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_StartBuildOrder'), 6)
    WaitSeconds(1)

    Cinematics.ExitNISMode()

    Utilities.UserConRequest('SallyShears')

    StartBuildOrder(true)
end

----------------------
-- Example Build Order
----------------------
function StartBuildOrder(skipZoom)
    -- Disallow orders
    Sync.NoOrdersAllowed = true

    -- Switch Army veiw
    Utilities.UserConRequest('SetFocusArmy 1')

    if not skipZoom then
        -- Move camera to the right place
        ScenarioFramework.StartOperationJessZoom('AI_Start')
    end

    tManager:SetEngineersOrders({
        ACU = {
            {build = 'ACU_Initial_Build'}, -- groupName OR {unitName1, unitName2, ...}, if there's a marker with the same name as the building, move order will be issued first
            {reclaim = {area = 'ACU_Reclaim_Area_1', minMass = 50}},
            {move = 'ACU_Move_1'},
            {reclaim = {area = 'ACU_Reclaim_Area_2', minMass = 50}},
            {build = 'ACU_Expansion_Build'},
            {move = 'ACU_Move_2'},
        },
        Engineers = {
            { -- Engineer 1
                {build = 'Engineer1_Build'},
            },
            { -- Engineer 2
                {move = 'Eng2_Move'},
                {assist = {'Engineer', 1}},
            },
            { -- Engineer 3
                {move = 'Eng3_Move'},
                {reclaim = {area = 'Engineer3_Reclaim_Area', minMass = 50}},
                {build = 'Engineer3_Build_1'},
                {move = 'Eng3_Move_2'},
                {reclaim = {area = 'Engineer3_Reclaim_Area_2', minMass = 50}},
                {build = 'Engineer3_Build_2'},
                {attackmove = 'Eng3_AttackMove'},
            },
            { -- Engineer 4
                {move = 'Eng4_Move_1'},
                {reclaim = {area = 'Engineer4_Reclaim_Area_1', minMass = 50}},
                {build = 'Engineer4_Build_1'},
                {reclaim = {area = 'Engineer4_Reclaim_Area_2', minMass = 50}},
                {build = 'Engineer4_Build_2'},
                {attackmove = 'Eng4_AttackMove'},
            },
            { -- Engineer 5
                {reclaim = {area = 'Engineer5_Reclaim_Area_1', minMass = 50}},
                {build = 'Engineer5_Build'},
                {attackmove = 'Eng5_AttackMove'},
            },
            { -- Engineer 6
                {build = 'Engineer6_Build'},
                {wait = {'Units_Active', 1, categories.ueb0103}},
                {move = 'Eng6_Move'},
                {attackmove = 'Eng6_AttackMove'},
            },
            { -- Engineer 7
                {attackmove = 'Eng7_AttackMove'},
            },
            { -- Engineer 8
                {move = 'Eng8_Move'},
                {assist = {'Engineer', 1}},
            },
            { -- Engineer 9
                {move = 'Eng9_Move'},
                {attackmove = 'Eng9_AttackMove'},
            },
            { -- Engineer 10
                {build = 'Engineer10_Build'},
            },
        },
    })

    tManager:SetFactoriesQueue({
        Air = {
            { -- Factory 1
                { -- Order 1
                    build = {
                        {'uea0103', 1}, -- T1 Bomber
                        {'uea0101', 1}, -- T1 Air Scout
                        {'uea0102', 3}, -- T1 Interceptor
                    },
                    RallyPoint = 'Air_Fac_1_Rally',
                    RepeatBuild = true,
                },
            },
            { -- Factory 2
                { -- Order 1
                    build = {
                        {'uea0101', 1}, -- T1 Air Scout
                        {'uea0102', 4}, -- T1 Interceptor
                    },
                    RallyPoint = 'Air_Fac_2_Rally',
                    RepeatBuild = true,
                },
            },
            { -- Factory 3
                { -- Order 1
                    assist = 2,
                },
            },
        },
        Land = {
            { -- Factory 1
                { -- Order 1
                    build = {
                        {'uel0105', 5},
                        {'uel0201', 1},
                        {'uel0101', 1},
                        {'uel0201', 1},
                        {'uel0101', 1},
                        {'uel0105', 2},
                        {'uel0201', 2},
                        {'uel0105', 2},
                        {'uel0201', 2},
                        {'uel0105', 50},
                    },
                    RallyPoint = 'Fac_1_Rally_1',
                },
                {wait = {'Units_Active', 2, categories.uel0105, ClearCommands = false}},
                {RallyPoint = 'Fac_1_Rally_2'},
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
            },
            { -- Factory 3
                { -- Order 1
                    assist = 2,
                },
            },
        },
        Naval = {
            { -- Factory 1
                { -- Order 1
                    build = {
                        {'ues0203', 1},
                    },
                    RallyPoint = 'Naval_Fac_Rally',
                    RepeatBuild = true,
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
            units = {{'uel0201', 1}},
            orders = {
                {move = 'AttackGroup3_Move_1'},
            },
        },
        { -- Attack Group 4
            units = {{'uel0101', 1}},
            orders = {
                {assist = {'AttackGroup', 3}},
            },
        },
        { -- Attack Group 5
            units = {{'uea0101', 1}},
            orders = {
                {move = 'Air_Scout_1_Move_Chain'},
                {patrol = 'Air_Scout_1_Patrol_Chain'},
            },
        },
        { -- Attack Group 6
            units = {{'uea0103', 1}},
            orders = {
                {move = 'Bomber_Move_Chain'},
                {attackmove = 'Bomber_AttackMove'},
            },
        },
        { -- Attack Group 7
            units = {{'uea0102', 1}},
            orders = {
                {assist = {'AttackGroup', 6}},
            },
        },
        { -- Attack Group 8
            units = {{'uea0101', 1}},
            orders = {
                {move = 'AirScout_2_Move'},
                {patrol = 'AirScout_2_Patrol_Chain'},
            },
        },
        { -- Attack Group 9
            units = {{'uel0201', 1}},
            orders = {
                {move = 'AttackGroup1_Move_1'},
            },
        },
        { -- Attack Group 10
            units = {{'uea0102', 1}},
            orders = {
                {assist = {'AttackGroup', 6}},
            },
        },
        { -- Attack Group 11
            units = {{'uel0201', 1}},
            orders = {
                {move = 'AttackGroup1_Move_1'},
            },
        },
        { -- Attack Group 12
            units = {{'uea0102', 1}},
            orders = {
                {assist = {'AttackGroup', 6}},
            },
        },
    })

    tManager:SetVoiceOvers(OpStrings, {
        LandFirst = 'Start',
        FactoryQueue = 'LandFactory1',
        FirstEngineer = 'Engineer1',
        SecondEngineer = 'Engineer2',
        ThirdEngineer = 'Engineer3',
        FourthEngineer = 'Engineer4',
        FithEngineer = 'Engineer5',
        ACUAirFactory = 'AirFactory1',
        EngiAirFactory = 'AirFactory2',
        TankScout1 = 'AttackGroup1',
        TankScout2 = 'AttackGroup3',
        SecondFactory = 'LandFactory2',
        ACUMove = {'Units_Active', 2, categories.ueb0102},
        SixthEngineer = 'Engineer6',
        SeventhEngineer = 'Engineer7',
        EighthEngineer = 'Engineer8',
        NinethEngineer = 'Engineer9',
        TenthEngineer = 'Engineer10',
        ThirdAirFactory = 'AirFactory3',
        AirScout1 = 'AttackGroup5',
        AirScout2 = 'AttackGroup8',
        NavalFactory = 'NavalFactory1',
        MoreLandfactories = {'Units_Active', 13, categories.ueb1103},
        FollowUp = {'Units_Active', 1, categories.ues0203, SpawnPlayer},
    })
    tManager:Initialize()
end

--------------------------------
-- Player's build order practise
--------------------------------
function SpawnPlayer()
    -- Allow orders again
    Sync.NoOrdersAllowed = false

    -- Switch back to player's army
    Utilities.UserConRequest('SetFocusArmy 0')

    -- Reset the map props
    ScenarioFramework.ResetMap()

    ScenarioFramework.StartOperationJessZoom('AI_Start')

    -- Spawn ACU, name it
    ScenarioFramework.SpawnCommander('Player', 'Commander', 'Warp', true)
end