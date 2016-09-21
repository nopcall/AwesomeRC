-- Start idempotent commands
local xxsettings = {
    -- Disable bell
    "xset -b",
    -- keyboard type repeat
    "xset r rate 250 25",
    -- screensaver timeout
    "xset s 2400 300",
    -- lock screen timeout
    "xset dpms 3000 3300 3600",
    -- Make CapseLock to Control
    "setxkbmap -option ctrl:nocaps",
    -- Control-Alt-Backspace kill Xorg
    "setxkbmap -option 'terminate:ctrl_alt_bksp'",
}
os.execute(table.concat(xxsettings, ";"))

-- {{{
local autorun = loadrc("autorun", "autorun")

-- use autorun only run program while it is not running
autorun("urxvtd")
autorun("unclutter", "-root")
autorun("xinput", "set-prop 'AT Translated Set 2 keyboard' 'Device Enabled' 0")
-- autorun("compton", "--backend glx --xrender-sync --xrender-sync-fence --vsync opengl-swc --paint-on-overlay")

autorun("/usr/libexec/polkit-gnome-authentication-agent-1")
-- autorun("xss-lock.sh", "start")

autorun("nm-applet")
-- autorun("blueman-applet")
autorun("autokey-gtk")
autorun("goldendict")
autorun("copyq")
autorun("zeal")
-- autorun("WizNote")
-- }}}
