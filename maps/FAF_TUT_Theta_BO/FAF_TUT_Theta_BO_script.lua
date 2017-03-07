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
local TutorialManager = import('/lua/AI/TutAI/TutorialManager.lua')
local Utilities = import('/lua/Utilities.lua')

----------
-- Globals
----------
ScenarioInfo.Player = 1
ScenarioInfo.Tutorial_AI = 2
ScenarioInfo.ARMY_9 = 3
ScenarioInfo.NEUTRAL_CIVILIAN = 4

---------
-- Locals
---------
local Player = ScenarioInfo.Player
local Tutorial_AI = ScenarioInfo.Tutorial_AI
local ARMY_9 = ScenarioInfo.ARMY_9
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
    ScenarioFramework.Dialogue(OpStrings.Intro_Choice, TutorialStart, true)
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
    ScenarioFramework.Dialogue(OpStrings.MapInfo, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Init'), 15)
    WaitSeconds(9)

    -- Starting Position
    ScenarioFramework.Dialogue(OpStrings.StartPosition, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Starting_Position'), 4)
    WaitSeconds(10)

    -- Reclaim near base
    ScenarioFramework.Dialogue(OpStrings.ReclaimNearBase, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_ReclaimNearBase'), 3)
    WaitSeconds(3)

    -- Reclaim in middle
    ScenarioFramework.Dialogue(OpStrings.ReclaimMiddle, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Reclaim'), 3)
    WaitSeconds(4)

    -- Civ buildings
    ScenarioFramework.Dialogue(OpStrings.MiddleWrecks, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Civs'), 2)
    WaitSeconds(4)

    -- More info about middle pass
    ScenarioFramework.Dialogue(OpStrings.InfoAboutMiddle, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Middle_Pass'), 4)
    WaitSeconds(4)

    -- Bottom Pass
    ScenarioFramework.Dialogue(OpStrings.BottomPassage, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_South_Pass'), 4)
    WaitSeconds(8)

    -- North Area 
    ScenarioFramework.Dialogue(OpStrings.NorthPart, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Main'), 6)
    WaitSeconds(5)

    -- North Mexes
    ScenarioFramework.Dialogue(OpStrings.NorthPlateau, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Top_Expansion'), 3)
    WaitSeconds(8)

    -- Final words
    ScenarioFramework.Dialogue(OpStrings.NorthPlateau2, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Final'), 5)
    WaitSeconds(5)

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
            {build = '1_ACU_Build'}, -- groupName OR {unitName1, unitName2, ...}, if there's a marker with the same name as the building, move order will be issued first
            {assist = {'Engineer', 1}}, -- {type, number}
            {wait = {'Units_Active', 2, categories.ueb0101}},
            {build = {'Mex_Middle'}},
            {reclaim = {area = 'Reclaim_Middle', moveChain = 'Move_Chain_Middle', minMass = 5}},
            {move = 'ACU_Final_Position'},
        },
        Engineers = {
            { -- Engineer 1
                {build = '1_Engineer_Build'},
            },
            { -- Engineer 2
                {reclaim = {simpleChainFigure = 'Reclaim_Chain_1', moveChain = 'Move_Chain_1', minMass = 5}},
                {build = {'1_North_Mex', '2_North_Mex'}},
                {reclaim = {simpleChainFigure = 'Reclaim_Chain_3', moveChain = 'Move_Chain_3', minMass = 5}},
                {build = {'3_North_Mex', '4_North_Mex', '5_North_Mex'}},
                {build = 'Walls_North'},
                {build = 'PD_North'},
                {build = {'Radar_North'}},
                {move = 'North_Engie_Hide'},
            },
            { -- Engineer 3
                {build = 'South_Expansion'},
                {attackmove = 'South_Engineer_AttackMove_Chain'},
            },
            { -- Engineer 4
                {assist = {'Engineer', 1}},
            },
            { -- Engineer 5
                {assist = {'Engineer', 1}},
            },
            { -- Engineer 6
                {build = {'Radar_Middle'}},
                {attackmove = 'Engineer_6_AttackMove_Chain'},
            },
        },
    })

    tManager:SetFactoriesQueue({
        Land = {
            { -- Factory 1
                { -- Order 1
                    build = {
                        {'uel0105', 3},
                        {'uel0201', 2},
                        {'uel0101', 2},
                        {'uel0105', 2},
                        {'uel0201', 2},
                        {'uel0101', 1},
                        {'uel0105', 2},
                        {'uel0201', 2},
                        {'uel0101', 1},
                    },
                    RallyPoint = 'Fac_1_Rally',
                },
            },
            { -- Factory 2
                { -- Order 1
                    build = {
                        {'uel0201', 5},
                        {'uel0101', 1},
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
        },
    })

    tManager:SetAttackGroups({
        { -- Attack Group 1
            units = {{'uel0201', 1}},
            orders = {
                {move = 'North_Attack_1'},
            },
        },
        { -- Attack Group 2
            units = {{'uel0201', 1}},
            orders = {
                {move = 'South_Attack_Chain'},
            },
        },
        { -- Attack Group 3
            units = {{'uel0101', 1}},
            orders = {
                {assist = {'AttackGroup', 1}},
            },
        },
        { -- Attack Group 4
            units = {{'uel0101', 1}},
            orders = {
                {assist = {'AttackGroup', 2}},
            },
        },
        { -- Attack Group 5
            units = {{'uel0201', 3}},
            orders = {
                {move = 'Attack_Group_5_Move'}
            },
        },
        { -- Attack Group 6
            units = {{'uel0201', 4}, {'uel0101', 2}},
            orders = {
                {move = 'Attack_Group_6_Move'}
            },
        },
    })

    tManager:SetVoiceOvers(OpStrings, {
        LandFirst = 'Start',
        FirstEngineer = 'Engineer1',
        NorthEngineer = 'Engineer2',
        SouthEngineer = 'Engineer3',
        Raids = 'AttackGroup1',
        SecondFactory = 'LandFactory2',
        MoreTanks = 'AttackGroup5',
        ACUMiddle = {'Units_Active', 9, categories.ueb1103},
        MiddleRadar = 'Engineer6',
        EndBuildOrder = {'Units_Active', 1, categories.ueb3101, SpawnPlayer},
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