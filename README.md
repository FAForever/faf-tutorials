# FA Forever - Tutorials

In game tutorials to introduce Forged Alliance Forever to new player. Currently only map specific build orders, but later will include tutorials for beginners explaining basic game mechanics.

Google document: https://docs.google.com/document/d/1dZShYfOeiSvRSTmQZ6G3rHPZ0UdpsgG6GqvgYIDYGPY

## Testing

* Put `init_tutorials.lua` into `C:\ProgramData\FAForever\bin`
* Open it and change this line https://github.com/speed2CZ/faf-tutorials/blob/master/init_tutorials.lua#L92 to point at the tutorial repo on your computer
* Launch `C:\ProgramData\FAForever\bin\ForgedAlliance.exe` with `/init init_tutorials.lua` go to skirmish, select map and launch
* You might need to edit `LastScenario` in your `game.prefs (C:\Users\%USERNAME%\AppData\Local\Gas Powered Games\Supreme Commander Forged Alliance)` to `FAF_TUT_Theta_BO` if the lobby bugs out since the mod doesn't default on this map yet.

## Build Orders Tutorials

* Goal is to make these tutorials easy to make but still complex enough to teach the right things. Currently majority of the things are handled by `Tutorial Manager`, see the code in `\lua\AI\TutAI\TutorialManager.lua`
* It's activated from the map script file.

### Adding new maps

#### Name

* For build order tutorial follow this formal: `FAF_TUT_MapName_BO`
* Vanilla FA or Supcom maps don't need `.scmap` file since we don't need to change anything there.
Just edit path in `.scenario.lua` to original map. List is available on [FAF Wiki](http://wiki.faforever.com/index.php?title=Map_Editor#Source_of_inspiration)

#### Changes to `.scenario.lua`
* Change `type = skirmish,` to: `type = 'tutorial',`
* Rename `ARMY_1` to `Player` and `ARMY_2` to `Tutorial_AI`
* If the map is for more players, delete other armies that are not needed. Keep `ARMY_9` that is used for enemy civilians and `NEUTRAL_CIVILIAN` army.

You also need to move them from CustomProps, it should look like this:
```LUA
Configurations = {
    ['standard'] = {
        teams = {
            { name = 'FFA', armies = {'Player','Tutorial_AI','ARMY_9','NEUTRAL_CIVILIAN',} },
        },
        customprops = {
        },
    },
}}
```
#### Changes to .save.lua
* First of all copy this file from your FA installation map folder, since mex positions and other markers has changes a bit since vanilla times.
* Delete all armies that you deleted in `.scenario.lua`
* For all armies that left you need to set plan: `plans = '/lua/ai/OpAI/DefaultBlankPlanlist.lua',`
* Other useless markers can be deleted later in the [Map Editor](http://wiki.faforever.com/index.php?title=Map_Editor)

#### Changes to .script.lua
* You can use script from any already existing tutorial, they are very similar.
* Fix importing strings file to point to the new tutorials you're making.
* Change local and global variables at the beginning of the file depending on how many armies you left.

##### Cinematic Intro
* You will need to set your own camera markers and VO names inside `MapIntro()` function.
* Example:
```LUA
-- Initial Camera
ScenarioFramework.Dialogue(OpStrings.MapInfo, nil, true)
Cinematics.CameraMoveToMarker(ScenarioUtils.GetMarker('Cam_MapInfo'), 15)
WaitSeconds(6)
```
* Function `Dialogue` uses `ForkThread` so the camera starts moving right away. It will take the camera 15 second to move to the marker, then it's going to wait 6 seconds.
* Proper timing can be achieved only when you have the voices and videos already since the lenght of the dialogue depends on the lenght of the video.

##### Example BO
* You need to supply Tutorial Manager with correct info to execute the build order. The tables should be easy to understand. Make sure you get the brackets right.
* Most of the work will be done in the [Map Editor](http://wiki.faforever.com/index.php?title=Map_Editor), placing and naming the units and markers correctly.
* Available orders and their required parameters can be found in `\lua\AI\TutAI\TutorialManager.lua`.

#### Changes to .strings.lua
* This file contains all map-specific strings, it also imports common strings from the mod.
