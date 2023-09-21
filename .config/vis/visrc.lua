-- load standard vis module, providing parts of the Lua API
require('vis')
require('plugins/vis-commentary')
plugin_vis_open = require('plugins/vis-fzf-open')
plugin_vis_tasks = require('plugins/vis-tasks')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
    vis:command('map! normal <C-f> :fzf<Enter>')
    plugin_vis_tasks.setup()
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	-- Your per window configuration options e.g.
    vis:command('set tw 4')
    vis:command('set rnu on')
    vis:command('set cul on')
    vis:command('set theme gruvbox')
end)
