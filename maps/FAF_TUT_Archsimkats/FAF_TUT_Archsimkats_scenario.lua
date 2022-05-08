version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Adaptive Archsimkats Valley",
    description = "A gorgeous valley is turned upside down into a battle ground.",
    preview = '',
    map_version = 3,
    type = 'skirmish',
    starts = true,
    size = {512, 512},
    reclaim = {28157.34, 167852.3},
    map = '/maps/FAF_TUT_Archsimkats/FAF_TUT_Archsimkats.scmap',
    save = '/maps/FAF_TUT_Archsimkats/FAF_TUT_Archsimkats_save.lua',
    script = '/maps/FAF_TUT_Archsimkats/FAF_TUT_Archsimkats_script.lua',
    norushradius = 100,
    Configurations = {
        ['standard'] = {
            teams = {
                {
                    name = 'FFA',
                    armies = {'ARMY_1', 'ARMY_2', 'ARMY_3', 'ARMY_4'}
                },
            },
            customprops = {
                ['ExtraArmies'] = STRING( 'ARMY_17 NEUTAL_CIVILIAN JIP' ),
            },
        },
    },
}
