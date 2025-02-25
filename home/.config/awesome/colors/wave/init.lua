local theme_path = require("gears").filesystem.get_configuration_dir() .. "colors/wave/"
local icon_path = theme_path .. "icons/"
local color = {}

color.bg      	   = "#f0fafa"
color.fg 	   	   = "#262626"
color.black		   = "#404040"
color.white		   = "#dce6e6"
color.red		   = "#e68383"
color.green		   = "#a0e6af"
color.yellow	   = "#ffcd96"
color.blue		   = "#83b4e6"
color.magenta	   = "#e1aae1"
color.cyan		   = "#8cd7d2"

color.bg_alt       = color.white
color.urgent 	   = color.red
color.font   	   = "RobotoMono Bold 11"
color.font_alt	   = "RobotoMono Italic Bold 11"
color.wall	   	   = theme_path .. "wave.jpg"
color.close 	   = icon_path .. "close.png"
color.maximize 	   = icon_path .. "maximize.png"
color.minimize	   = icon_path .. "minimize.png"
color.floating     = icon_path .. "floating.png"
color.max 		   = icon_path .. "max.png"
color.tile 	       = icon_path .. "tile.png"
color.submenu	   = icon_path .. "submenu.png"

return color
