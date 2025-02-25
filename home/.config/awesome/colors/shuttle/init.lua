local theme_path = require("gears").filesystem.get_configuration_dir() .. "colors/shuttle/"
local icon_path = theme_path .. "icons/"
local color = {}

color.bg      	   = "#dedcdf"
color.fg 	   	   = "#4b4b4b"
color.black		   = "#4b4b4b"
color.white		   = "#c8c3c8"
color.red		   = "#cd8c8c"
color.green		   = "#91c8a0"
color.yellow	   = "#dcbe91"
color.blue		   = "#96a5cd"
color.magenta	   = "#b996cd"
color.cyan		   = "#96cdbe"

color.bg_alt       = color.white
color.urgent 	   = color.red
color.font   	   = "RobotoMono Bold 11"
color.font_alt	   = "RobotoMono Italic Bold 11"
color.wall	   	   = theme_path .. "shuttle.png"
color.close 	   = icon_path .. "close.png"
color.maximize 	   = icon_path .. "maximize.png"
color.minimize	   = icon_path .. "minimize.png"
color.floating     = icon_path .. "floating.png"
color.max 		   = icon_path .. "max.png"
color.tile 	       = icon_path .. "tile.png"
color.submenu	   = icon_path .. "submenu.png"

return color
