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

local tManager = TutorialManager.CreateTutorialManager()

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
    ScenarioFramework.Dialogue(OpStrings.Intro_Choice, TutorialStart, true)
    -- StartBuildOrder(true)
end

------------------
-- Choice dialogue
------------------
function TutorialStart()
    -- Save props for later respawn
    SaveMap()

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

    Cinematics.EnterNISMode()

    WaitSeconds(1)

    -- Initial Camera
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Init'), 2)

    WaitSeconds(1)
    ScenarioFramework.Dialogue(OpStrings.MapInfo, nil, true)

    -- Starting Position
    ScenarioFramework.Dialogue(OpStrings.StartPosition, nil, true)
    WaitSeconds(10)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Starting_Position'), 3)
    WaitSeconds(5)

    -- Reclaim near base
    ScenarioFramework.Dialogue(OpStrings.ReclaimNearBase, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_ReclaimNearBase'), 2)
    WaitSeconds(5)

    -- Reclaim in middle
    ScenarioFramework.Dialogue(OpStrings.ReclaimMiddle, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Reclaim'), 3)
    WaitSeconds(6)

    -- Civ buildings
    ScenarioFramework.Dialogue(OpStrings.MiddleWrecks, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Civs'), 2)
    WaitSeconds(3)

    -- More info about middle pass
    ScenarioFramework.Dialogue(OpStrings.InfoAboutMiddle, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Middle_Pass'), 3)
    WaitSeconds(7)

    -- Bottom Pass
    ScenarioFramework.Dialogue(OpStrings.BottomPassage, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_South_Pass'), 3)
    WaitSeconds(9)

    -- North Area 
    ScenarioFramework.Dialogue(OpStrings.NorthPart, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Main'), 4)
    WaitSeconds(9)

    -- North Mexes
    ScenarioFramework.Dialogue(OpStrings.NorthPlateau, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Top_Expansion'), 2)
    WaitSeconds(7)

    -- Final words
    ScenarioFramework.Dialogue(OpStrings.NorthPlateau2, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_Mid_Final'), 5)
    WaitSeconds(6)

    -- Move to Starting position
    ScenarioFramework.Dialogue(OpStrings.StartBuildOrder, nil, true)
    Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_BO_Start'), 3)
    WaitSeconds(1)

    Cinematics.ExitNISMode()

    Utilities.UserConRequest('SallyShears')

    StartBuildOrder(true)
end

----------------------
-- Example Build Order
----------------------
function StartBuildOrder(skipZoom)
    -- Switch Army veiw
    Utilities.UserConRequest('SetFocusArmy 1')
    -- SimConExecute('SetFocusArmy 1')

    if not skipZoom then
        -- Move camera to the right place
        ScenarioFramework.StartOperationJessZoom('AI_Start')
    end

    tManager:SetEngineerOrders({
        ACU = {
            {build = '1_ACU_Build'}, -- groupName OR {unitName1, unitName2, ...}, if there's a marker with the same name as the building, move order will be issued first
            {assist = {'Engineer', 1}}, -- {type, number}
            {wait = {'Units_Active', 2, categories.ueb0101}},
            {build = {'Mex_Middle'}},
            {reclaim = {area = 'Reclaim_Middle', moveChain = 'Move_Chain_Middle', minMass = 5}},
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
            },
            { -- Engineer 3
                {build = 'South_Expansion'},
            },
            { -- Engineer 4
                {assist = {'Engineer', 1}},
            },
            { -- Engineer 5
                {assist = {'Engineer', 1}},
            },
        },
    })

    tManager:SetFactoriesQeue({
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
                        {'uel0201', 5},
                        {'uel0101', 1},
                        {'uel0201', 5},
                        {'uel0101', 1},
                        {'uel0201', 5},
                        {'uel0101', 1},
                        {'uel0201', 5},
                        {'uel0101', 1},
                    },
                    RallyPoint = 'Fac_2_Rally',
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

    tManager:SetVoiceOvers(OpStrings, {
        LandFirst = {}
    })

    tManager:Initialize('speed2_AI')
end

-- TODO: once build order ends, swich back to player's army view and let him try the build order.
--------------------------------
-- Player's build order practise
--------------------------------
function SpawnPlayer()
    -- Switch back to player's army
    Utilities.UserConRequest('SetFocusArmy 0')

    ScenarioFramework.StartOperationJessZoom('Player_Start')

    -- Spawn ACU, name it
    ScenarioFramework.SpawnCommander('Player', 'Commander', 'Warp', true)
end

-------------------
-- Custom functions
-------------------
-- TODO: Needs to be moved into the mod, for usage on any map

-- Functions for resering reclaim on the map, TODO: 1) make some UI button to reset the map
-- Tables for reseting map
local InitialProps = {}

function SaveMap()
    for _, v in GetReclaimablesInRect(Rect(unpack(ScenarioInfo.PlayableArea))) do
        if IsProp(v) and v.CanTakeDamage then
            local prop = {}
            prop.ID = v:GetBlueprint().BlueprintId
            prop.Position = v.CachePosition
            table.insert(InitialProps, prop)
        end
    end
end
 
function ResetMap()
    -- Delete ramining props
    for _, v in GetReclaimablesInRect(Rect(unpack(ScenarioInfo.PlayableArea))) do
        if IsProp(v) and v.CanTakeDamage then
            v:Destroy()
        end
    end

    -- Delete units
    for i = 1, 2 do
        for _, v in ArmyBrains[i]:GetListOfUnits(categories.ALLUNITS, false) do
            v:Destroy()
        end
    end

    -- Create wreckages
    for iArmy, strArmy in pairs(ListArmies()) do
        local wreckageGroup = FindUnitGroup('WRECKAGE', Scenario.Armies[strArmy].Units)
        if wreckageGroup then
            ScenarioUtils.CreateArmyGroup(strArmy, wreckageGroup, true)
        end
    end

    -- Create Props
    for _, v in InitialProps do
        CreateProp(v.Position, v.ID)
    end
end

-- Marks reclaim areas
local AreaDecal = '/env/utility/decals/objective_debug_albedo.dds'
local TutorialDecals = {}
function MarkAreas(tblAreas)
    for _, area in tblAreas do
        local rect = ScenarioUtils.AreaToRect(area)

        local w = rect.x1 - rect.x0
        local h = rect.y1 - rect.y0
        local x = rect.x0 + ( w / 2.0 )
        local z = rect.y0 + ( h / 2.0 )

        TutorialDecals[area] = CreateDecal(Vector(x,0, z), 0, AreaDecal, '', 'Water Albedo', w, h, 4000, 0, 1, 0)
    end
end

function TestArrow()
    local ObjectiveArrow = import('objectiveArrow.lua').ObjectiveArrow
    local arrow = ObjectiveArrow { AttachTo = unit }
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
end

function OnShiftF4()
end