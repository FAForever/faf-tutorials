-- ****************************************************************************
-- **
-- **  File     : /maps/FAF_TUT_FourLeaf_BO/FAF_TUT_FourLeaf_BO_script.lua
-- **  Author(s): speed2
-- **
-- **  Summary  : Main mission flow script for FourLeaf Build Order Tutorial
-- **
-- ****************************************************************************
local Cinematics = import('/lua/cinematics.lua')
local OpStrings = import('/maps/FAF_TUT_FourLeaf_BO/FAF_TUT_FourLeaf_BO_strings.lua')
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
ScenarioInfo.NEUTRAL_CIVILIAN = 3

---------
-- Locals
---------
local Player = ScenarioInfo.Player
local Tutorial_AI = ScenarioInfo.Tutorial_AI
local NEUTRAL_CIVILIAN = ScenarioInfo.NEUTRAL_CIVILIAN

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
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_MapInfo'), 15)
    WaitSeconds(6)

    -- Starting Position
    ScenarioFramework.Dialogue(OpStrings.StartPosition, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_StartPosition'), 4)
    WaitSeconds(10)

    -- Side leaf entrance
    ScenarioFramework.Dialogue(OpStrings.Backdoor, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Backdoor'), 4)
    WaitSeconds(7)

    -- Enemy starting position
    ScenarioFramework.Dialogue(OpStrings.EnemyStartPosition, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_EnemyStartPosition'), 3)
    WaitSeconds(4)

    -- Expansion leaves
    ScenarioFramework.Dialogue(OpStrings.Expansions, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Expansions'), 3)
    WaitSeconds(3)

    -- Middle reclaim
    ScenarioFramework.Dialogue(OpStrings.MidReclaim, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_MidReclaim'), 6)
    WaitSeconds(10)

    -- Reclaim behind the base
    ScenarioFramework.Dialogue(OpStrings.ReclaimBehindBase, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_ReclaimBehindBase'), 4)
    WaitSeconds(3)

    -- More reclaim around the base
    ScenarioFramework.Dialogue(OpStrings.OtherReclaimInBase1, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_OtherReclaimInBase1'), 3)
    WaitSeconds(3)

    -- And even more
    ScenarioFramework.Dialogue(OpStrings.OtherReclaimInBase2, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_OtherReclaimInBase2'), 3)
    WaitSeconds(3)

    -- Move to Starting position
    ScenarioFramework.Dialogue(OpStrings.StartBuildOrder, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_BO_Start'), 7)
    WaitSeconds(3)

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
        },
        Engineers = {
            { -- Engineer 1
                {build = 'Engineer1_Build'},
                {wait = {'Units_Active', 6, categories.ueb0101}},
                {build = 'PowerSpam'},
            },
            { -- Engineer 2
                {move = 'Eng_2_Move'},
                {attackmove = 'Eng_2_AttackMove'},
            },
            { -- Engineer 3
                {reclaim = {area = 'Engineer3_Reclaim_Area_1'}},
                {reclaim = {moveChain = 'Engineer_3_Reclaim_Chain', minMass = 5}},
                {build = 'Engineer3_Build'},
                {attackmove = 'Eng_3_AttackMove'},
            },
            { -- Engineer 4
                {move = 'Eng_4_Move'},
                {assist = {'Engineer', 1}},
                {wait = {'Units_Active', 6, categories.ueb0101}},
                {move = 'Engineer_Middle_Move'},
                {attackmove = 'Engineer_Middle_AttackMove'},
            },
            { -- Engineer 5
                {build = 'Engineer5_Build'},
            },
            { -- Engineer 6
                {assist = {'Engineer', 1}},
                {wait = {'Units_Active', 6, categories.ueb0101}},
                {move = 'Engineer_Middle_Move'},
                {attackmove = 'Engineer_Middle_AttackMove'},
            },
            { -- Engineer 7
                {move = 'Eng_7_Move'},
                {attackmove = 'Eng_7_AttackMove'},
            },
            { -- Engineer 8
                {build = 'Engineer8_Build'},
            },
            { -- Engineer 9
                {build = 'Engineer9_Build'},
            },
            { -- Engineer 10
                {move = 'Eng_10_Move'},
                {attackmove = 'Eng_10_AttackMove'},
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
                    RallyPoint = 'Air_Fac_Rally',
                    RepeatBuild = true,
                },
            },
        },
        Land = {
            { -- Factory 1
                { -- Order 1
                    build = {
                        {'uel0105', 4},
                        {'uel0201', 1},
                        {'uel0101', 1},
                        {'uel0105', 1},
                        {'uel0201', 1},
                        {'uel0101', 1},
                        {'uel0105', 2},
                        {'uel0201', 2},
                        {'uel0105', 2},
                        {'uel0201', 2},
                        {'uel0105', 2},
                        {'uel0201', 2},
                    },
                    RallyPoint = 'Fac_1_Rally',
                    RepeatBuild = true,
                },
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
            { -- Factory 6
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
                {move = 'AttackGroup1_Move'},
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
                {move = 'AttackGroup3_Move_Chain'},
            },
        },
        { -- Attack Group 4
            units = {{'uel0101', 1}},
            orders = {
                {assist = {'AttackGroup', 3}},
            },
        },
        { -- Attack Group 5
            units = {{'uea0103', 1}},
            orders = {
                {wait = {'Units_Active', 1, categories.uea0101}},
                {move = 'Bomber_Move'},
                {attackmove = 'Bomber_AttackMove'},
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
        FourthEngineer = 'Engineer4',
        TankScout1 = 'AttackGroup1',
        TankScout2 = 'AttackGroup3',
        SecondFactory = 'LandFactory2',
        FithEngineer = 'Engineer5',
        AirFactory = 'AirFactory1',
        TankScout2 = 'AttackGroup3',
        SixthEngineer = 'Engineer6',
        SeventhEngineer = 'Engineer7',
        BomberScout = 'AttackGroup5',
        FactorySpam = 'LandFactory3',
        EighthEngineer = 'Engineer8',
        Powerspam = {'Units_Active', 6, categories.ueb0101}
        -- FollowUp = {'Units_Active', 1, categories.ueb3101, SpawnPlayer},
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

    ScenarioFramework.StartOperationJessZoom('Player_Start')

    -- Spawn ACU, name it
    ScenarioFramework.SpawnCommander('Player', 'Commander', 'Warp', true)
end