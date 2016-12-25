# FA Forever - Tutorials

Tutorials to introduce popular maps for new players and showing build order.

## Testing

* Put `init_tutorials.lua` into `C:\ProgramData\FAForever\bin`
* Open it and change this line https://github.com/speed2CZ/faf-tutorials/blob/master/init_tutorials.lua#L92 to point at the tutorial repo on your computer
* Launch `C:\ProgramData\FAForever\bin\ForgedAlliance.exe` with `/init init_tutorials.lua` go to skirmish, select map and launch
* You might need to edit `LastScenario` in your `game.prefs (C:\Users\%USERNAME%\AppData\Local\Gas Powered Games\Supreme Commander Forged Alliance)` to `FAF_TUT_Theta_BO` if the lobby bugs out since the mod doesn't default on this map yet.

## Adding new maps

### Name

* For build order tutorial follow this formal: `FAF_TUT_MapName_BO`
* Vanilla FA or Supcom maps don't need `.scmap` file since we don't need to change anything there.
Just edit path in `.scenario.lua` to original map. List is available on [FAF Wiki](http://wiki.faforever.com/index.php?title=Map_Editor#Source_of_inspiration)

### Changes to `.scenario.lua`
* Until tutorials have it's own mod, changes type from skirmish to: `type = 'campaign_coop',`
* Rename `ARMY_1` to `Player` and `ARMY_2` to `Tutorial_AI`
* If the map is for more players, delete other armies that are not needed. Keep `ARMY_9` that is used for enemy civilians and `NEUTRAL_CIVILIAN` army.

You also need to move them from CustomProps, it should look like this:

    Configurations = {
        ['standard'] = {
            teams = {
                { name = 'FFA', armies = {'Player','Tutorial_AI','ARMY_9','NEUTRAL_CIVILIAN',} },
            },
            customprops = {
            },
        },
    }}

### Changes to .save.lua
* First of all copy this file from your FA installation map folder, since mex positions and other markers has changes a bit since vanilla times.
* Delete all armies that you deleted in `.scenario.lua`
* For all armies that left you need to set plan: `plans = '/lua/ai/OpAI/DefaultBlankPlanlist.lua',`
* Other useless markers can be deleted later in [Map Editor](http://wiki.faforever.com/index.php?title=Map_Editor)
