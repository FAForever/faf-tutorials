--- It's kind dumb that the options aren't stored like this to start with...
function getOption(byKey, optionsTable)
    for k, v in optionsTable do
        if v.key == byKey then
            return v
        end
    end
end

-- Note that options with only one possibility don't appear in the UI, but still find their way into
-- the GameOptions object. Generally, this is the approach needed to delete options.

-- The only victory condition option needs to be "Sandbox".
local victoryOption = getOption("Victory", globalOpts)
victoryOption.default = 1
victoryOption.values = {
    {
        text = "<LOC lobui_0128>Sandbox",
        help = "<LOC lobui_0129>Game never ends",
        key = 'sandbox',
    }
}

-- The only spawn option needs to be "Fixed".
local spawnOption = getOption("TeamSpawn", teamOptions)
spawnOption.default = 1
spawnOption.values = {
    {
        text = "<LOC lobui_0092>Fixed",
        help = "<LOC lobui_0093>Spawn everyone in fixed locations (determined by slot)",
        key = 'fixed',
    },
}

-- Civilians are always neutral (this option actually doesn't do anything meaningful for campaign,
-- we just don't want it in the UI.
local civvyOption = getOption("CivilianAlliance", globalOpts)
civvyOption.default = 1
civvyOption.values = {
    {
        text = "<LOC lobui_0293>Enemy",
        help = "<LOC lobui_0294>Civilians are enemies of players",
        key = 'enemy',
    }
}

-- No rush is nonsense here.
local noRushOption = getOption("NoRushOption", globalOpts)
noRushOption.default = 1
noRushOption.values = {
    {
        text = "<LOC lobui_0318>Off",
        help = "<LOC lobui_0319>Rules not enforced",
        key = 'Off'
    }
}

-- No prebuilt units (this breaks *everything*)
local prebuiltUnitsOption = getOption("PrebuiltUnits", globalOpts)
prebuiltUnitsOption.default = 1
prebuiltUnitsOption.values = {
    {
        text = "<LOC lobui_0312>Off",
        help = "<LOC lobui_0313>No prebuilt units",
        key = 'Off'
    }
}

-- Random map... Um. No.
local randomMapOption = getOption("RandomMap", globalOpts)
randomMapOption.default = 1
randomMapOption.values = {
    {
        text = "<LOC lobui_0312>Off",
        help = "<LOC lobui_0556>No random map",
        key = 'Off'
    }
}

-- Don't allow fog of war to be turned off
local fogOption = getOption("FogOfWar", globalOpts)
fogOption.default = 1
fogOption.values = {
    {
        text = "<LOC lobui_0114>Explored",
        help = "<LOC lobui_0115>Terrain revealed, but units still need recon data",
        key = 'explored'
    }
}

-- Autoteams makes no sense either...
local autoTeamsOption = getOption("AutoTeams", teamOptions)
autoTeamsOption.default = 1
autoTeamsOption.values = {
    {
        text = "<LOC lobui_0244>None",
        help = "<LOC lobui_0534>No automatic teams",
        key = 'none'
    }
}

-- Don't allow people to switch teams during the campaign...
local teamLockOption = getOption("TeamLock", teamOptions)
teamLockOption.default = 1
teamLockOption.values = {
    {
        text = "<LOC lobui_0098>Locked",
        help = "<LOC lobui_0099>Teams are locked once play begins",
        key = 'locked'
    }
}

-- Unit cap is controlled by mission script
local unitCapOption = getOption("UnitCap", globalOpts)
unitCapOption.default = 1
unitCapOption.values = {'1000'}

-- No civilians to reveal
local revealCivilianOption = getOption("RevealCivilians", globalOpts)
revealCivilianOption.default = 1
revealCivilianOption.values = {
    {
        text = "<LOC _No>No",
        help = "<LOC lobui_0303>Civilian structures are hidden",
        key = 'No',
    }
}

-- Enable score
local scoreOption = getOption("Score", globalOpts)
scoreOption.default = 1
scoreOption.values = {
    {
        text = "<LOC _On>On",
        help = "<LOC lobui_0729>Score is enabled",
        key = 'yes',
    }
}

-- Share until death
local shareOption = getOption("Share", globalOpts)
shareOption.default = 1
shareOption.values = {
    {
        text = "<LOC lobui_0744>Share Until Death",
        help = "<LOC lobui_0745>All units you have built this game will be destroyed when you die, except those captured by the enemy.",
        key = 'ShareUntilDeath',
    }
}

-- Share unit cap
local shareUnitCapOption = getOption("ShareUnitCap", globalOpts)
shareUnitCapOption.default = 1
shareUnitCapOption.values = {
    {
        text = "<LOC lobui_0438>Allies",
        help = "<LOC lobui_0439>Share unitcap with allies only",
        key = 'allies',
    }
}

-- Share unit cap
local timeoutsOption = getOption("Timeouts", globalOpts)
timeoutsOption.default = 1
timeoutsOption.values = {
    {
        text = "<LOC lobui_0248>Infinite",
        help = "<LOC lobui_0249>There is no limit on timeouts",
        key = '-1',
    }
}

local cheatOption = getOption("CheatsEnabled", globalOpts)
cheatOption.default = 1
cheatOption.values = {
    {
        text = "<LOC _On>On",
        help = "<LOC lobui_0211>Cheats enabled",
        key = 'true',
    },
}

local observerOption = getOption("AllowObservers", globalOpts)
observerOption.default = 1
observerOption.values = {
    {
        text = "<LOC _Yes>Yes",
        help = "<LOC lobui_0594>Observers are allowed",
        key = true,
    },
}

local gameSpeedOption = getOption("GameSpeed", globalOpts)
gameSpeedOption.default = 1
gameSpeedOption.values = {
    {
        text = "<LOC lobui_0264>Adjustable",
        help = "<LOC lobui_0265>Adjustable in-game",
        key = 'adjustable',
    },
}

-- AI options break *everything*.
AIOpts = {}
