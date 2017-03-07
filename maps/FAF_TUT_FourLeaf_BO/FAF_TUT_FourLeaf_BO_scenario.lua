version = 3
ScenarioInfo = {
    name = 'Four-Leaf Clover - Build Order',
    description = "Introduction of the map, showing important locations and initial build order.",
    type = 'tutorial',
    starts = true,
    preview = '',
    size = {512, 512},
    map = '/maps/SCMP_031/SCMP_031.scmap',
    map_version = 1,
    save = '/maps/FAF_TUT_FourLeaf_BO/FAF_TUT_FourLeaf_BO_save.lua',
    script = '/maps/FAF_TUT_FourLeaf_BO/FAF_TUT_FourLeaf_BO_script.lua',
    norushradius = 0.000000,
    Configurations = {
        ['standard'] = {
            teams = {
                { name = 'FFA', armies = {'Player','Tutorial_AI','NEUTRAL_CIVILIAN',} },
            },
            customprops = {
            },
        },
    }}
