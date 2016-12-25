-- ****************************************************************************
-- **
-- **  File     : /maps/FAF_TUT_Loki_BO/FAF_TUT_Loki_BO_script.lua
-- **  Author(s): Tokyto, speed2
-- **
-- **  Summary  : Main mission flow script for Loki Build Order Tutorial
-- **
-- ****************************************************************************
local Cinematics = import('/lua/cinematics.lua')
local OpStrings = import('/maps/FAF_TUT_Loki_BO/FAF_TUT_Loki_BO_strings.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')
local ScenarioPlatoonAI = import('/lua/ScenarioPlatoonAI.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local Utilities = import('/lua/Utilities.lua')
local TutorialManager = import('/lua/AI/TutAI/TutorialManager.lua')

----------
-- Globals
----------
ScenarioInfo.Player = 1
ScenarioInfo.Tokyto_AI = 2
ScenarioInfo.NEUTRAL_CIVILIAN = 3

---------
-- Locals
---------
local Player = ScenarioInfo.Player
local Tokyto_AI = ScenarioInfo.Tokyto_AI
local NEUTRAL_CIVILIAN = ScenarioInfo.NEUTRAL_CIVILIA

local tManager = TutorialManager.CreateTutorialManager()

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
    ScenarioFramework.SetArmyColor(Tokyto_AI, 144, 20, 39)
end

function OnStart(self)
    ScenarioFramework.Dialogue(OpStrings.Intro_Choice, TutorialStart, true)
    Spawnwall()
    Spawnvillage()
    Spawnoutland()
    Spawncars()
end

------------------
-- Choice dialogue
------------------
function TutorialStart()
    -- Save props for later respawn
    --SaveMap()

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
--[[function MapIntro()
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
--]]

----------------------
-- Example Build Order
----------------------
-- ACU Orders
function StartBuildOrder(skipZoom)
    -- Switch Army veiw
    Utilities.UserConRequest('SetFocusArmy 1')
    -- SimConExecute('SetFocusArmy 1')

    if not skipZoom then
        -- Move camera to the right place
        ScenarioFramework.StartOperationJessZoom('AI_Start')
    end

    tManager:SetFactoriesQeue({
        AIR = {
            { -- Factory 2
                { -- Order 1
                    build = {
                        {'uea0101', 1}, -- T1 Air Scout
                        {'uea0102', 2}, -- T1 Interceptor
                    },
                    RallyPoint = 'Fac_2_Rally',
                },
            },
        },
        Land = {
            { -- Factory 1
                { -- Order 1
                    build = {
                        {'uel0105', 3}, -- 3x T1 Engie
                        {'uel0201', 1}, -- T1 Tank
                        {'uel0101', 1}, -- T1 Scout
                        {'uel0201', 1}, -- T1 Tank
                        {'uel0101', 1}, -- T1 Scout
                        {'uel0201', 1}, -- T1 Tank
                        {'uel0101', 1}, -- T1 Scout

                        {'uel0105', 2}, -- 2x T1 Engie
                        {'uel0201', 1}, -- 1x T1 Tank
                        {'uel0105', 1}, -- 1x T1 Engie
                        {'uel0201', 2}, -- 2x T1 Tank

                        {'uel0105', 1}, -- 1x T1 Engie
                        {'uel0201', 2}, -- 2x T1 Tank
                        {'uel0201', 2}, -- 2x T1 Tank
                        {'uel0105', 1}, -- 1x T1 Engie
                        {'uel0201', 2}, -- 2x T1 Tank
                        {'uel0201', 2}, -- 2x T1 Tank
                        {'uel0105', 1}, -- 1x T1 Engie
                        {'uel0201', 2}, -- 2x T1 Tank
                        {'uel0201', 2}, -- 2x T1 Tank
                        {'uel0105', 1}, -- 1x T1 Engie
                        {'uel0201', 2}, -- 2x T1 Tank
                        {'uel0201', 2}, -- 2x T1 Tank
                        {'uel0105', 1}, -- 1x T1 Engie        -- 9 engies
                    },
                    RallyPoint = 'Fac_1_Rally',
                },
            },
            { -- Factory 3
                { -- Order 1
                        build = {
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                        },  
                RallyPoint = 'Fac_3_Rally', 
                },
            },
            { -- Factory 4
                { -- Order 1
                    assist = 3,
                },
            },
            { -- Factory 5
                { -- Order 1
                        build = {
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                        },      
                RallyPoint = 'Fac_5_Rally',
                },
            },
            { -- Factory 6
                { -- Order 1
                    assist = 3,
                },
            },
            { -- Factory 7
                { -- Order 1
                    assist = 3,
                },
            },
            { -- Factory 8
                { -- Order 1
                    build = {
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            {'uel0101', 1}, -- T1 Scout
                            {'uel0201', 3}, -- 3x T1 Tank
                            },  
                    RallyPoint = 'Fac_4_Rally',
                },
            },
        },
    })

    tManager:SetEngineerOrders({
        ACU = {
            {build = 'ACU_Initial'}, -- groupName OR {unitName1, unitName2, ...}, if there's a marker with the same name as the building, move order will be issued first
            --{assist = {'Engineer', 1}}, -- {type, number}
            --{wait = {'Units_Active', 2, categories.ueb0101}},
        },
        Engineers = {
            { -- Engineer 1
                {build = 'Expansion_Left'},
            },
            { -- Engineer 2
                {build = 'Expansion_Top'},
                --IssueAggressiveMove({ScenarioInfo.Engie_2}, ScenarioUtils.MarkerToPosition('Engie_2_Attack_Move_1_1'))
            },
            { -- Engineer 3
                {build = 'Expansion_Bot'},
            },
            { -- Engineer 4
                {build = 'E_Spam'},
            },
            { -- Engineer 5
                {build = 'Fac_Spam'},
                {assist = {'Factory', 6}},
            },
            {
            {assist = {'Engineer', 5}},
            },
            {
            {assist = {'Engineer', 5}},
            },
            {
            {assist = {'Engineer', 5}},
            },
            {
            {assist = {'Engineer', 5}},
            },
            {
            {assist = {'Engineer', 5}},
            },
            {
            {assist = {'Engineer', 5}},
            },
            {
            {assist = {'Engineer', 5}},
            },
        },
    })
    tManager:Initialize('Tokyto_AI')
end

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




------------------------------
-- Loki's original script bits
------------------------------
makeInvincible = function(unit)     
    unit:SetDoNotTarget(true)
    unit:SetCanBeKilled(false)
    unit:SetCapturable(false)
    unit:SetReclaimable(false)
    unit:SetDoNotTarget(true)
    unit:SetMaxHealth(1)
    unit:SetHealth(nil,1)
    unit:SetRegenRate(1)
end

makelowmass = function(unit)
    unit:GetBlueprint().Wreckage.MassMult=0.05
end

removeddsal = function(unit)
    unit:GetBlueprint().Display.Tarmacs.Fadeout=0
    unit:GetBlueprint().Display.Tarmacs.RemveWhenDead=true
end

Spawnwall = function()
    local wall01 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 263.500000, 0.000000, 6.283185, 0.000000)
    makeInvincible(wall01)
    local wall02 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 230.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall02)
    local wall03 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 206.500000, 25.312500, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall03)
    local wall04 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 278.500000, 0.000000, 6.283185, 0.000000)
    makeInvincible(wall04)
    local wall05 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 271.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall05)
    local wall06 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 227.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall06)
    local wall07 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 233.500000, 0.000000, 3.141593, 0.000000)
    makeInvincible(wall07)
    local wall08 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 218.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall08)
    local wall09 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 272.500000, 0.000000, 6.283185, 0.000000)
    makeInvincible(wall09)
    local wall10 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 286.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall10)
    local wall11 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 239.500000, 0.000000, 3.141593, 0.000000)
    makeInvincible(wall11)
    local wall12 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 245.500000, 0.000000, 3.141593, 0.000000)
    makeInvincible(wall12)
    local wall13 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 221.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall13)
    local wall14 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 248.500000, 0.000000, 3.141593, 0.000000)
    makeInvincible(wall14)
    local wall15 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 304.500000, 25.312500, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall15)
    local wall16 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 283.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall16)
    local wall17 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 301.500000, 25.312500, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall17) 
    local wall18 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 224.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall18)
    local wall19 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 242.500000, 0.000000, 3.141593, 0.000000)
    makeInvincible(wall19)
    local wall20 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 245.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall20)
    local wall21 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 277.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall21)
    local wall22 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 260.500000, 0.000000, 6.283185, 0.000000)
    makeInvincible(wall22)
    local wall23 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 236.500000, 0.000000, 3.141593, 0.000000)
    makeInvincible(wall23)
    local wall24 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 295.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall24)
    local wall25 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 274.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall25)
    local wall26 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 275.500000, 0.000000, 6.283185, 0.000000)
    makeInvincible(wall26)
    local wall27 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 215.500000, 25.388672, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall27)
    local wall28 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 209.500000, 25.312500, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall28)
    local wall29 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 262.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall29)
    local wall30 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 292.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall30)
    local wall31 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 212.500000, 25.308594, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall31)
    local wall32 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 265.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall32)
    local wall33 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 268.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall33)
    local wall34 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 259.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall34)
    local wall35 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 269.500000, 0.000000, 6.283185, 0.000000)
    makeInvincible(wall35)
    local wall36 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 280.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall36)
    local wall37 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 242.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall37)
    local wall38 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 248.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall38)
    local wall39 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 251.500000, 0.000000, 3.141593, 0.000000)
    makeInvincible(wall39)
    local wall40 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 239.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall40)
    local wall41 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 251.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall41)
    local wall42 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 298.500000, 25.343750, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall42)
    local wall43 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 233.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall43)
    local wall44 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 236.500000, 25.390625, 229.500000, 0.000000, 4.712389, 0.000000)
    makeInvincible(wall44)
    local wall45 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 266.500000, 0.000000, 6.283185, 0.000000)
    makeInvincible(wall45)
    local wall46 = CreateUnitHPR('xec8001','NEUTRAL_CIVILIAN', 289.500000, 25.390625, 282.500000, 0.000000, 1.570796, 0.000000)
    makeInvincible(wall46)
    local corner1 = CreateUnitHPR('xec8011','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 281.500000, 0.000000, 3.141593, 0.000000)
    makeInvincible(corner1)
    local corner2 = CreateUnitHPR('xec8011','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 230.500000, 0.000000, 6.283185, 0.000000)
    makeInvincible(corner2)
    
    local hiddenwall000 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 211.500000, 25.310547, 230.500000, 0.000000, 0.000000, 0.000000)
    makeInvincible(hiddenwall000)
    local hiddenwall001 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 215.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall001)
    local hiddenwall002 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 252.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall002)
    local hiddenwall003 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 264.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall003)
    local hiddenwall004 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 292.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall004)
    local hiddenwall005 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 277.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall005)
    local hiddenwall006 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 247.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall006)
    local hiddenwall007 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 280.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall007)
    local hiddenwall008 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 304.500000, 25.312500, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall008)
    local hiddenwall009 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 239.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall009)
    local hiddenwall010 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 228.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall010)
    local hiddenwall011 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 207.500000, 25.312500, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall011)
    local hiddenwall012 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 232.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall012)
    local hiddenwall013 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 300.500000, 25.310547, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall013)
    local hiddenwall014 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 231.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall014)
    local hiddenwall015 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 273.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall015)
    local hiddenwall016 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 279.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall016)
    local hiddenwall017 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 209.500000, 25.312500, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall017)
    local hiddenwall018 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 252.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall018)
    local hiddenwall019 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 236.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall019)
    local hiddenwall020 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 239.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall020)
    local hiddenwall021 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 266.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall021)
    local hiddenwall022 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 225.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall022)
    local hiddenwall023 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 244.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall023)
    local hiddenwall024 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 262.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall024)
    local hiddenwall025 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 303.500000, 25.312500, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall025)
    local hiddenwall026 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 238.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall026)
    local hiddenwall027 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 245.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall027)
    local hiddenwall028 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 277.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall028)
    local hiddenwall029 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 261.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall029)
    local hiddenwall030 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 269.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall030)
    local hiddenwall031 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 232.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall031)
    local hiddenwall032 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 206.500000, 25.312500, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall032)
    local hiddenwall033 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 262.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall033)
    local hiddenwall034 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 260.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall034)
    local hiddenwall035 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall035)
    local hiddenwall036 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 286.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall036)
    local hiddenwall037 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 221.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall037)
    local hiddenwall038 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 282.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall038)
    local hiddenwall039 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 214.500000, 25.386719, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall039)
    local hiddenwall040 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 274.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall040)
    local hiddenwall041 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 298.500000, 25.359375, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall041)
    local hiddenwall042 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 235.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall042)
    local hiddenwall043 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 276.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall043)
    local hiddenwall044 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 216.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall044)
    local hiddenwall045 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 270.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall045)
    local hiddenwall046 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 241.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall046)
    local hiddenwall047 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 274.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall047)
    local hiddenwall048 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 251.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall048)
    local hiddenwall049 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 295.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall049)
    local hiddenwall050 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 246.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall050)
    local hiddenwall051 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 230.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall051)
    local hiddenwall052 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 213.500000, 25.359375, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall052)
    local hiddenwall053 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 240.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall053)
    local hiddenwall054 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 245.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall054)
    local hiddenwall055 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 293.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall055)
    local hiddenwall056 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 268.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall056)
    local hiddenwall057 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 234.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall057)
    local hiddenwall058 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 278.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall058)
    local hiddenwall059 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 267.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall059)
    local hiddenwall060 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 219.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall060)
    local hiddenwall061 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 224.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall061)
    local hiddenwall062 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 271.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall062)
    local hiddenwall063 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 235.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall063)
    local hiddenwall064 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 234.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall064)
    local hiddenwall065 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 244.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall065)
    local hiddenwall066 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 264.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall066)
    local hiddenwall067 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 223.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall067)
    local hiddenwall068 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 294.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall068)
    local hiddenwall069 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 251.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall069)
    local hiddenwall070 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 233.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall070)
    local hiddenwall071 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 285.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall071)
    local hiddenwall072 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 254.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall072)
    local hiddenwall073 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 291.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall073)
    local hiddenwall074 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 249.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall074)
    local hiddenwall075 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 227.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall075)
    local hiddenwall076 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 233.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall076)
    local hiddenwall077 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 242.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall077)
    local hiddenwall078 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 243.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall078)
    local hiddenwall079 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 265.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall079)
    local hiddenwall080 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 250.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall080)
    local hiddenwall081 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 279.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall081)
    local hiddenwall082 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 275.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall082)
    local hiddenwall083 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 266.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall083)
    local hiddenwall084 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 241.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall084)
    local hiddenwall085 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 229.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall085)
    local hiddenwall086 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 299.500000, 25.322266, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall086)
    local hiddenwall087 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 267.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall087)
    local hiddenwall088 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 248.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall088)
    local hiddenwall089 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 265.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall089)
    local hiddenwall090 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 272.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall090)
    local hiddenwall091 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 222.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall091)
    local hiddenwall092 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 289.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall092)
    local hiddenwall093 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 218.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall093)
    local hiddenwall094 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 273.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall094)
    local hiddenwall095 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall095)
    local hiddenwall096 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 212.500000, 25.322266, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall096)
    local hiddenwall097 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 257.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall097)
    local hiddenwall098 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 243.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall098)
    local hiddenwall099 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 217.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall099)
    local hiddenwall100 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 275.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall100)
    local hiddenwall101 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 263.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall101)
    local hiddenwall102 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 272.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall102)
    local hiddenwall103 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 259.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall103)
    local hiddenwall104 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 259.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall104)
    local hiddenwall105 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 276.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall105)
    local hiddenwall106 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 271.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall106)
    local hiddenwall107 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 249.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall107)
    local hiddenwall108 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 268.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall108)
    local hiddenwall109 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 247.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall109)
    local hiddenwall110 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 284.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall110)
    local hiddenwall111 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 256.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall111)   
    local hiddenwall112 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 210.500000, 25.312500, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall112)
    local hiddenwall113 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 290.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall113)
    local hiddenwall114 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 283.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall114)
    local hiddenwall115 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 237.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall115)
    local hiddenwall116 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 301.500000, 25.312500, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall116)
    local hiddenwall117 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 238.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall117)
    local hiddenwall118 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 208.500000, 25.312500, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall118)
    local hiddenwall119 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 281.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall119)
    local hiddenwall120 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 261.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall120)
    local hiddenwall121 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 237.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall121)
    local hiddenwall122 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 297.500000, 25.386719, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall122)
    local hiddenwall123 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 302.500000, 25.312500, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall123)
    local hiddenwall124 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 248.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall124)
    local hiddenwall125 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 242.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall125)
    local hiddenwall126 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 240.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall126)
    local hiddenwall127 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 270.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall127)
    local hiddenwall128 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 231.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall128)
    local hiddenwall129 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 296.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall128)
    local hiddenwall130 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 263.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall130)
    local hiddenwall131 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 226.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall131)
    local hiddenwall132 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 258.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall132)
    local hiddenwall133 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 280.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall133)
    local hiddenwall134 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 269.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall134)
    local hiddenwall135 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 288.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall135)
    local hiddenwall136 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 253.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall136)
    local hiddenwall137 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 250.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall137)
    local hiddenwall138 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 246.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall138)
    local hiddenwall139 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 236.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall139)
    local hiddenwall140 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 287.500000, 25.390625, 281.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall140)
    local hiddenwall141 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 278.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall141)
    local hiddenwall142 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 255.500000, 25.390625, 260.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall142)
    local hiddenwall143 = CreateUnitHPR('ueb5101','NEUTRAL_CIVILIAN', 220.500000, 25.390625, 230.500000, 0.000000, 0.000000, 0.000000 )
    makeInvincible(hiddenwall143)

end

Spawnvillage = function(unit)
    local village00 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',216.500000, 25.322266, 236.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village00)
    makelowmass(village00)
    local village01 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',276.500000, 25.390625, 274.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village01)
    makelowmass(village01)
    local village02 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',217.500000, 25.386719, 223.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village02)
    makelowmass(village02)
    local village03 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',276.500000, 25.390625, 270.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village03)
    makelowmass(village03)
    local village04 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',228.500000, 25.390625, 243.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village04)
    makelowmass(village04)
    local village05 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',244.500000, 25.390625, 243.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village05)
    makelowmass(village05)
    local village06 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',252.500000, 25.390625, 267.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village06)
    makelowmass(village06)
    local village07 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',281.500000, 25.390625, 270.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village07)
    makelowmass(village07)
    local village08 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',229.500000, 25.386719, 219.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village08)
    makelowmass(village08)
    local village09 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',258.500000, 25.390625, 241.500000, 0.000000, 7.853982, 0.000000)
    removeddsal(village09)
    makelowmass(village09)
    local village10 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',266.500000, 25.390625, 273.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village10)
    makelowmass(village10)
    local village11 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',281.500000, 25.390625, 266.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village11)
    makelowmass(village11)
    local village12 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',251.500000, 25.390625, 275.500000, 0.000000, 6.283185, 0.000000)
    removeddsal(village12)
    makelowmass(village12)
    local village13 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',290.500000, 25.390625, 294.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village13)
    makelowmass(village13)
    local village14 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',217.500000, 25.347656, 213.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village14)
    makelowmass(village14)
    local village15 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',235.500000, 25.390625, 223.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village15)
    makelowmass(village15)
    local village16 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',252.500000, 25.390625, 263.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village16)
    makelowmass(village16)
    local village17 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',236.500000, 25.390625, 238.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village17)
    makelowmass(village17)
    local village18 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',237.000000, 25.390625, 266.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village18)
    makelowmass(village18)
    local village19 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',221.500000, 25.390625, 243.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village19)
    makelowmass(village19)
    local village20 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',239.500000, 25.390625, 258.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village20)
    makelowmass(village20)
    local village21 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',251.500000, 25.390625, 248.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village21)
    makelowmass(village21)
    local village22 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',239.500000, 25.390625, 253.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village22)
    makelowmass(village22)
    local village23 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',276.500000, 25.390625, 266.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village23)
    makelowmass(village23)
    local village24 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',281.500000, 25.390625, 274.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village24)
    makelowmass(village24)
    local village25 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',241.500000, 25.390625, 238.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village25)
    makelowmass(village25)
    local village26 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',222.500000, 25.390625, 204.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village26)
    makelowmass(village26)
    local village27 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',297.500000, 25.222656, 292.500000, 0.000000, 7.853982, 0.000000)
    removeddsal(village27)
    makelowmass(village27)
    local village28 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',249.500000, 25.390625, 259.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village28)
    makelowmass(village28)
    local village29 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',244.500000, 25.390625, 247.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village29)
    makelowmass(village29)
    local village30 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',263.500000, 25.390625, 240.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village30)
    makelowmass(village30)
    local village31 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',229.500000, 25.390625, 255.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village31)
    makelowmass(village31)
    local village32 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',271.500000, 25.390625, 274.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village32)
    makelowmass(village32)
    local village33 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',295.500000, 25.386719, 286.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village33)
    makelowmass(village33)
    local village34 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',235.500000, 25.390625, 253.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village34)
    makelowmass(village34)
    local village35 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',271.500000, 25.390625, 266.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village35)
    makelowmass(village35)
    local village36 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',249.500000, 25.390625, 253.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village36)
    makelowmass(village36)
    local village37 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',285.500000, 25.390625, 274.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village37)
    makelowmass(village37)
    local village38 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',271.500000, 25.390625, 270.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village38)
    makelowmass(village38)
    local village39 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',263.500000, 25.390625, 236.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village39)
    makelowmass(village39)
    local village40 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',217.500000, 25.382813, 204.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village40)
    makelowmass(village40)
    local village41 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',285.500000, 25.390625, 266.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village41)
    makelowmass(village41)
    local village42 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',285.500000, 25.390625, 270.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village42)
    makelowmass(village42)  
    local village43 = CreateUnitHPR('uec1101','NEUTRAL_CIVILIAN',258.500000, 25.390625, 237.500000, 0.000000, 7.853982, 0.000000)
    removeddsal(village43)
    makelowmass(village43)
    
    local village50 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',249.500000, 25.390625, 271.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village50)
    makelowmass(village50)
    local village51 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',258.500000, 25.390625, 246.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village51)
    makelowmass(village51)
    local village52 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',222.500000, 25.390625, 235.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village52)
    makelowmass(village52)
    local village53 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',243.500000, 25.390625, 253.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village53)
    makelowmass(village53)
    local village54 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',291.500000, 25.390625, 263.500000, 0.000000, 6.283185, 0.000000)
    removeddsal(village54)
    makelowmass(village54)
    local village55 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',266.500000, 25.390625, 268.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village55)
    makelowmass(village55)
    local village56 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',236.500000, 25.390625, 234.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village56)
    makelowmass(village56)
    local village57 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',229.500000, 25.390625, 248.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village57)
    makelowmass(village57)
    local village58 = CreateUnitHPR('uec1201','NEUTRAL_CIVILIAN',266.500000, 25.390625, 244.500000, 0.000000, 6.283185, 0.000000)
    removeddsal(village58)
    makelowmass(village58)
    
    local village60 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',229.500000, 25.390625, 237.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village60)
    makelowmass(village60)
    local village61 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',297.500000, 25.183594, 300.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village61)
    makelowmass(village61)
    local village62 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',294.500000, 25.390625, 269.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village62)
    makelowmass(village62)
    local village63 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',290.500000, 25.390625, 269.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village63)
    makelowmass(village63)
    local village64 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',279.500000, 25.390625, 286.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village64)
    makelowmass(village64)
    local village65 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',280.500000, 25.390625, 261.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village65)
    makelowmass(village65)
    local village66 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',277.500000, 25.390625, 261.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village66)
    makelowmass(village66)
    local village67 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',294.500000, 25.378906, 274.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village67)
    makelowmass(village67)
    local village68 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',285.500000, 25.390625, 286.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village68)
    makelowmass(village68)
    local village69 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',238.500000, 25.390625, 249.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village69)
    makelowmass(village69)
    local village70 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',235.500000, 25.390625, 244.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village70)
    makelowmass(village70)
    local village71 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',249.500000, 25.390625, 244.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village71)
    makelowmass(village71)
    local village72 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',298.500000, 25.082031, 274.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village72)
    makelowmass(village72)
    local village73 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',244.500000, 25.390625, 259.500000, 0.000000, 3.141593, 0.000000)
    removeddsal(village73)
    makelowmass(village73)
    local village74 = CreateUnitHPR('uec1301','NEUTRAL_CIVILIAN',290.500000, 25.390625, 274.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village74)
    makelowmass(village74)
    
    local village81 = CreateUnitHPR('xec1301','NEUTRAL_CIVILIAN',243.500000, 25.390625, 265.500000, 0.000000, 1.570796, 0.000000)
    removeddsal(village81)
    makelowmass(village81)
    local village82 = CreateUnitHPR('xec1301','NEUTRAL_CIVILIAN',265.500000, 25.390625, 260.500000, 0.000000, 4.712389, 0.000000)
    removeddsal(village82)
    makelowmass(village82)
    local village83 = CreateUnitHPR('xec1301','NEUTRAL_CIVILIAN',248.500000, 25.390625, 237.500000, 0.000000, 0.000000, 0.000000)
    removeddsal(village83)
    makelowmass(village83)
    local village84 = CreateUnitHPR('xec1301','NEUTRAL_CIVILIAN',265.500000, 25.390625, 251.500000, 0.000000, 7.853982, 0.000000)
    removeddsal(village84)
    makelowmass(village84)


end

Spawnoutland = function(unit)
    local outland00 = CreateUnitHPR('uec1401','NEUTRAL_CIVILIAN',65.500000, 29.050781, 10.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland00)
    local outland01 = CreateUnitHPR('uec1401','NEUTRAL_CIVILIAN',173.500000, 34.125000, 194.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland01)
    local outland02 = CreateUnitHPR('uec1401','NEUTRAL_CIVILIAN',340.500000, 34.472656, 459.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland02)
    local outland03 = CreateUnitHPR('uec1401','NEUTRAL_CIVILIAN',208.500000, 34.650391, 55.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland03)
    local outland04 = CreateUnitHPR('uec1401','NEUTRAL_CIVILIAN',430.500000, 29.046875, 506.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland04)
    local outland05 = CreateUnitHPR('uec1401','NEUTRAL_CIVILIAN',385.500000, 35.072266, 389.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland05)
    local outland06 = CreateUnitHPR('uec1401','NEUTRAL_CIVILIAN',346.500000, 34.349609, 323.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland06)
    local outland07 = CreateUnitHPR('uec1401','NEUTRAL_CIVILIAN',125.500000, 34.574219, 132.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland07)
    
    local outland10 = CreateUnitHPR('uec1501','NEUTRAL_CIVILIAN',405.500000, 34.804688, 275.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland10)
    local outland11 = CreateUnitHPR('uec1501','NEUTRAL_CIVILIAN',106.500000, 34.804688, 236.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland11)
    local outland12 = CreateUnitHPR('uec1501','NEUTRAL_CIVILIAN',128.500000, 34.859375, 250.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland12)
    local outland13 = CreateUnitHPR('uec1501','NEUTRAL_CIVILIAN',383.500000, 34.859375, 261.500000, 0.000000, 0.000000, 0.000000)
    makelowmass(outland13)  
end

Spawncars = function(unit)
    local car00 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',131.500000, 34.816406, 248.500000, 0.000000, 1.754057, 0.000000)
    makelowmass(car00)  
    local car01 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',384.500000, 34.871094, 263.500000, 0.000000, -0.514872, 0.000000)
    makelowmass(car01)  
    local car02 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',117.500000, 34.832031, 244.500000, 0.000000, -0.069812, 0.000000)
    makelowmass(car02)  
    local car03 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',290.500000, 25.390625, 267.500000, 0.000000, -2.399827, 0.000000)
    makelowmass(car03)  
    local car04 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',402.820343, 34.824524, 276.352142, 0.000000, -0.514872, 0.000000)
    makelowmass(car04)  
    local car05 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',395.500000, 34.812500, 268.500000, 0.000000, -1.012291, 0.000000)
    makelowmass(car05)  
    local car06 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',231.500000, 25.390625, 252.500000, 0.000000, -0.026180, 0.000000)
    makelowmass(car06)  
    local car07 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',103.500000, 34.804688, 235.500000, 0.000000, 1.754057, 0.000000)
    makelowmass(car07)  
    local car08 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',269.500000, 25.390625, 259.500000, 0.000000, -2.399827, 0.000000)
    makelowmass(car08)  
    local car09 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',237.500000, 25.390625, 241.500000, 0.000000, 1.544616, 0.000000)
    makelowmass(car09)  
    local car10 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',275.500000, 25.390625, 277.500000, 0.000000, -1.535890, 0.000000)
    makelowmass(car10)  
    local car11 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',247.500000, 25.390625, 259.500000, 0.000000, 3.054326, 0.000000)
    makelowmass(car11)  
    local car12 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',402.500000, 34.832031, 275.500000, 0.000000, -0.514872, 0.000000)
    makelowmass(car12)  
    local car13 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',396.500000, 34.806641, 260.500000, 0.000000, -1.012291, 0.000000)
    makelowmass(car13)  
    local car14 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',131.500000, 34.816406, 250.500000, 0.000000, 1.754057, 0.000000)
    makelowmass(car14)  
    local car15 = CreateUnitHPR('uec0001','NEUTRAL_CIVILIAN',253.834137, 25.390625, 256.242828, 0.000000, -2.399827, 0.000000)
    makelowmass(car15)  
end