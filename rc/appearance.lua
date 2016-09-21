-- awesome theme
beautiful.init(awful.util.getdir("config") .. "/themes/multicolor/theme.lua")

-- {{{ Wallpaper
local gears = require("gears")

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ GTK stuff:
-- Also see: http://developer.gnome.org/gtk3/3.2/GtkSettings.html
local gtk2_header = [[
include "$HOME/.themes/Xenlism-Minimalism/gtk-2.0/gtkrc"
style "user-font"
{
        font_name = "Fira Mono Regular"
}
]]
local gtk = [[
gtk-font-name="Fira Mono Regular 11"
gtk-theme-name="Xenlism-Minimalism"
gtk-icon-theme-name="Xenlism-Wildfire"
gtk-fallback-icon-theme="Numix-Circle"
gtk-cursor-theme-name="ComixCursors-White-Large-Slim"
gtk-cursor-theme-size=8
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintfull"
gtk-xft-rgba="rgb"
gtk-key-theme-name="Emacs"
]]
local gtk2 = io.open(os.getenv("HOME") .. "/.gtkrc-2.0", "w")
gtk2:write(gtk2_header)
gtk2:write(gtk)
gtk2:close()

-- GTK3 is the same, but no double quotes for strings
-- I don't have gtk3 so no need to use it
os.execute("test -d ~/.config/gtk-3.0 || mkdir -p ~/.config/gtk-3.0")
local gtk3 = io.open(os.getenv("HOME") .. "/.config/gtk-3.0/settings.ini", "w")
gtk3:write("[Settings]\n")
gtk, _ = gtk:gsub('"', '')
gtk3:write(gtk)
gtk3:close()
-- }}}

--[[
-- For QT, the configuration file is ~/.config/Trolltech.conf. It
-- seems a bit complex to override it each time. The solution is to
-- run qtconfig and to select "GTK+" for the style and the appropriate
-- font.
    !! qtconfig set gtkstyle
--]]

--[[
-- The systray is a bit complex. We need to configure it to display
-- the right colors. Here is a link with more background about this:
--  http://thread.gmane.org/gmane.comp.window-managers.awesome/9028
xprop = assert(io.popen("xprop -root _NET_SUPPORTING_WM_CHECK"))
wid = xprop:read():match("^_NET_SUPPORTING_WM_CHECK.WINDOW.: window id # (0x[%S]+)$")
xprop:close()
if wid then
    wid = tonumber(wid) + 1
    os.execute("xprop -id " .. wid .. " -format _NET_SYSTEM_TRAY_COLORS 32c " ..
                   "-set _NET_SYSTEM_TRAY_COLORS " ..
                   "65535,65535,65535,65535,8670,8670,65535,32385,0,8670,65535,8670")
end
--]]

-- Set cursor theme
os.execute("xsetroot -cursor_name left_ptr")
