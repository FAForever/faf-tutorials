local ReallyOnCreateArmyBrain = OnCreateArmyBrain
function OnCreateArmyBrain(index, brain, name, nickname)
    ReallyOnCreateArmyBrain(index, brain, name, nickname)

    -- Stuff this army into the HumanPlayers set, if applicable.
    if StringStartsWith(ArmyBrains[index].Name, "Player") then
        table.insert(ScenarioInfo.HumanPlayers, index)
    end
end

-- SetupSession loads the scenario data into a global. This is the One True Copy of scenario data.
-- This means that now is a really good time to fart about with scenario data.
local ReallySetupSession = SetupSession
function SetupSession()
    ReallySetupSession()

    ScenarioInfo.HumanPlayers = {}
end

local ReallyBeginSession = BeginSession
function BeginSession()
    ReallyBeginSession()

    -- Hide scores for AI's and make them able to place orders outside the playable rect
    for i = 1, table.getn(ArmyBrains) do
        if not table.find(ScenarioInfo.HumanPlayers, i) then
            SetArmyShowScore(i, false)
            SetIgnorePlayableRect(i, true)
        end
    end
end
