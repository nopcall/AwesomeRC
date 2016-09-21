-- {{{ Required libraries
awful        = require("awful")
require("awful.autofocus")
-- appearance
beautiful    = require("beautiful")
-- notify
naughty      = require("naughty")

-- custom lib path
package.path = package.path .. ';' ..
    awful.util.getdir("config") .. '/lib/?.lua;' ..
    awful.util.getdir("config") .. '/lib/?/init.lua;'

-- 3rd widget lib
lain         = require("lain")

-- custom functions
require("func")
-- }}}

-- {{{ Variable definitions
-- key
modkey       = "Mod4"
altkey       = "Mod1"
globalkeys   = {}

-- user defined
terminal     = "urxvtc"
ddname       = "UniqueDropdownTerminalName"
laptop_bat   = "BAT1"           -- /sys/class/power_supply/

-- visit openweathermap.org to get your city id
weather_city = 1804609

-- common program
browser      = "google-chrome"
picviewer    = "eog"
pdfviewer    = "evince"
videoplayer  = "smplayer"
-- }}}

-- {{{ load configurations
loadrc("errors")        -- error notify
loadrc("appearance")    -- appearance for both awesome and gtk applications
loadrc("debug")         -- debug
loadrc("desktop")       -- menu and wallpaper
loadrc("layout")        -- layout settings
loadrc("bindings")      -- key and mouse binding
loadrc("signals")       -- signals hack
loadrc("rules")         -- client rules
loadrc("quake")         -- dropdown terminal
loadrc("droppad")       -- dropdown pad
loadrc("mime")          -- set mime default application
loadrc("start")         -- autostart applications
loadrc("xrandr")        -- multi screen
-- }}}
