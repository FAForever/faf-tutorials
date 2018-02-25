-- Forged Alliance Forever tutorials mod_info.lua file
--
-- Documentation for the extended FAF mod_info.lua format can be found here:
-- https://github.com/FAForever/fa/wiki/mod_info.lua-documentation
name = "FAF tutorials support mod"
version = 1
_faf_modname='tutorials'
copyright = "Forged Alliance Forever Community"
description = "Support mod for tutorials maps"
author = "Forged Alliance Forever Community"
url = "http://www.faforever.com"
uid = "8e88fav8-3495-11e6-ac61-9e74128cae77"
selectable = false
exclusive = false
ui_only = false
conflicts = {}
mountpoints = {
    lua = '/lua',
    maps = '/maps',
    mods = '/mods'
}
hooks = {
    '/mods/tutorials/hook'
}