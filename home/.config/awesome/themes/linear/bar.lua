local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = require("beautiful").xresources.apply_dpi

-- Buttons
textbutton = function(args)
	local text = args.text
	local size = args.size or dpi(10)
	local onclick = args.onclick or function() end
	
	local result = wibox.widget {
		text = text,
		font = "Material Icons " .. size,
		widget = wibox.widget.textbox
	}

	result:connect_signal("button::press", function() awful.spawn.with_shell(onclick) end)

	return result
end

-- Window control
minimize = wibox.widget {
	image = beautiful.minimize,
	widget = wibox.widget.imagebox
}
minimize:connect_signal("button::press", function() 
	if client.focus then
		client.focus.minimized = true 
	end
end)

maximize = wibox.widget {
	image = beautiful.maximize,
	widget = wibox.widget.imagebox
}
maximize:connect_signal("button::press", function() 
	if client.focus then
		client.focus.maximized = not client.focus.maximized
	end
end)

close = wibox.widget {
	image = beautiful.close,
	widget = wibox.widget.imagebox
}
close:connect_signal("button::press", function() 
	if client.focus then
		client.focus:kill() 
	end
end)

-- Launcher
launcher = wibox.widget {
	buttons = {
		awful.button({}, 1, function()
			awesome.emit_signal('widget::launcher')
		end) 
	},
	image = beautiful.awesome_icon,
	widget = wibox.widget.imagebox
}

-- Battery
battery = awful.widget.watch("cat /sys/class/power_supply/BAT0/capacity", 10, function(widget, stdout)
			widget:set_text("BAT " .. stdout:gsub("\n", "") .. "%")
		end)

-- Clock
textclock = wibox.widget.textclock('%I:%M %p')

-- Tags
screen.connect_signal("request::desktop_decoration", function(s)
    -- Layout Widget
    s.layoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
        }
    }

	s.taglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = {
			awful.button({ }, 1, function(t) t:view_only() end)
		}
	}

	-- Tasklist widget
    s.tasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
		widget_template = {
			{
      	    	{
        	   	    id     = "text_role",
    	       	    widget = wibox.widget.textbox,
	           	},
				valign = "center",
				halign = "center",
				widget = wibox.container.place,
			},
   		   	id     = "background_role",
   	    	widget = wibox.container.background,
    	},
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
        }
    }

    -- Wibox
    s.wibox = awful.wibar {
		border_width = dpi(5),
		border_color = beautiful.tasklist_bg_focus,
		position = "bottom",
		height = dpi(40),
		bg = beautiful.tasklist_bg_focus,
		fg = beautiful.fg_focus,
        screen   = s,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left
                layout = wibox.layout.fixed.horizontal,
				spacing = dpi(20),
				{
					launcher,
					top = dpi(10),
					bottom = dpi(10),
					left = dpi(10),
					widget = wibox.container.margin
				},
				{
					s.taglist, 
					right = dpi(20), 
					widget = wibox.container.margin
				}
            },
			-- Middle
            s.tasklist,
            { -- Right
                layout = wibox.layout.fixed.horizontal,
				spacing = dpi(15),
				{
                	wibox.widget.systray(),
					left = dpi(15),
					top = dpi(5),
					bottom = dpi(5),
					widget = wibox.container.margin
				},
				textclock,
				{
					minimize,
					top = dpi(14),
					bottom = dpi(14),
					widget = wibox.container.margin
				},
				{
					maximize,
					top = dpi(14),
					bottom = dpi(14),
					widget = wibox.container.margin
				},
				{
					close,
					top = dpi(14),
					bottom = dpi(14),
					widget = wibox.container.margin
				},
				{
					s.layoutbox,
					right = dpi(10),
					top = dpi(10),
					bottom = dpi(10),
					widget = wibox.container.margin
				},
            },
        }
    }
end)
