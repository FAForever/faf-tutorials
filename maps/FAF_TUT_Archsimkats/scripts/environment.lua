
local ScenarioFramework = import('/lua/ScenarioFramework.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')

local EffectUtilities = import('/lua/EffectUtilities.lua')
local EffectTemplates = import('/lua/EffectTemplates.lua')

local effects = {
    -- EffectTemplates.DamageFire01,
    -- EffectTemplates.DamageFireSmoke01,
    EffectTemplates.TreeBurning01,
    EffectTemplates.TreeBurning01,
    -- EffectTemplates.op_fire_01,
    -- EffectTemplates.DamageStructureFire01,
    EffectTemplates.DamageStructureFireSmoke01,
}

-- Spawns wreckages in a separate thread with additional properties
function CreateWreckages(emitters)
    ForkThread(CreateWrecksThread, emitters)
end

-- Spawns wreckages with additional properties
function CreateWrecksThread(emitters)

    -- sane defaults
    emitters = emitters or false

    ----------------------------------
    -- determine the group to spawn -- 

	local armies = ListArmies();
	local players = { };
  
	for v, army in armies do
        if string.find(army, "ARMY") then
			table.insert(players, army);
		end
    end

    -- take into account ARMY_17: it is always there
    local n = table.getn(players) - 1
    local wreckageGroup = 'Wrecks' .. n 

    LOG("Spawning wreckage group: " .. wreckageGroup)

    ----------------------------------------
    -- spawn the wrecks of all the armies --

    local props = { }
    local armies = ListArmies()
    for k, army in armies do 

        -- check if there is such a group
        local wrecks = ScenarioUtils.FindUnitGroup(wreckageGroup, ScenarioInfo.Env.Scenario.Armies[army].Units)
        if wrecks then
            -- spawn all the units
            local platoonList, tblResult, treeResult = ScenarioUtils.CreatePlatoons(army, wrecks)

            -- create the wrecks
            for num,unit in tblResult do
                -- create the wreck
                local prop = unit:CreateWreckageProp(0)
                table.insert(props, prop)

                -- destroy the unit
                unit:Destroy()
            end
        end
    end

    -----------------------------------------
    -- spawn the emitter effects on wrecks --

    if emitters then 
        for k, prop in props do

            local threshold = Random()
            if threshold > 0.25 then
            
                -- get a random bone
                local indexBone = math.floor(Random() * prop:GetBoneCount())
                local bone = prop:GetBoneName(indexBone)

                -- determine the emitter and attach
                local indexEmitter = math.floor(Random() * table.getn(effects)) + 1
                local emitters = EffectUtilities.CreateBoneEffects(prop, bone, "ARMY_17", effects[indexEmitter]) or false

                -- clean up of the emitters
                if emitters then
                    for k, emitter in emitters do 
                        prop.Trash:Add(emitter)
                    end
                end
            end
        end
    end
end