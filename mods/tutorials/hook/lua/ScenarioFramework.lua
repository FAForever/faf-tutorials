-- Functions for resering reclaim on the map, TODO: 1) make some UI button to reset the map
-- Tables for reseting map
local InitialProps = {}

--- Saves all props on the map for later respawn
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
 
--- Delete all units and remaining props. Spawn props agan from saved table and spawn wreckages
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
        local wreckageGroup = ScenarioUtils.FindUnitGroup('WRECKAGE', Scenario.Armies[strArmy].Units)
        if wreckageGroup then
            ScenarioUtils.CreateArmyGroup(strArmy, 'WRECKAGE', true)
        end
    end

    -- Create Props
    for _, v in InitialProps do
        CreateProp(v.Position, v.ID)
    end
end

function MarkReclaimAreas(areas, removeOnReclaimed)
    MarkAreas(areas)

    if removeOnReclaimed then
        for _, area in areas do
            ForkThread(ReclaimInAreaCheckThread, area)
        end
    end
end

function ReclaimInAreaCheckThread(area)
    local rect = ScenarioUtils.AreaToRect(area)

    while true do
        local reclaimables = GetReclaimablesInRect(rect)
        for _, v in reclaimables do
            if (IsProp(v) and v.CanTakeDamage) or (IsUnit(v) and v:IsDead()) then
                break
            end
        end
        WaitSeconds(5)
    end

    if TutorialDecals[area] then
        TutorialDecals[area]:Destroy()
    end
end

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

function CreateChoiceDialogue(title, tblChoices, tblCallbacks)
    local dialogue = CreateDialogue(title, tblChoices)
    dialogue.OnButtonPressed = function(self, info)
        dialogue:Destroy()

        local cb = tblCallbacks[info.buttonID]
        if cb then
            ForkThread(cb)
        end
    end
    return dialogue
end