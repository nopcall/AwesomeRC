local keydoc = loadrc("keydoc", "vbe/keydoc")

-- {{{ Mouse Bindings
root.buttons(awful.util.table.join(
                 awful.button({}, 3, function () mymainmenu:toggle() end),
                 awful.button({}, 4, awful.tag.viewprev),
                 awful.button({}, 5, awful.tag.viewnext)))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    globalkeys,

    keydoc.group("Layout manipulation"),
    -- Tag browsing
    awful.key({modkey}, "Left", awful.tag.viewprev, "Jump to Left tag"),
    awful.key({modkey}, "Right", awful.tag.viewnext, "Jump to Right tag"),
    awful.key({modkey}, "Escape", awful.tag.history.restore, "Jump to Last tag"),
    -- Non-empty tag browsing
    awful.key({modkey}, "q",
        function ()
            lain.util.tag_view_nonempty(-1)
        end, "Jump to Left None Empty tag"),
    awful.key({modkey}, "w",
        function ()
            lain.util.tag_view_nonempty(1)
        end, "Jump to Right None Empty tag"),

    keydoc.group("Focus"),
    -- Default client focus
    awful.key({altkey,}, "Tab",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end, "Focus to Right Client in TaskList"),
    awful.key({altkey, "Shift"}, "Tab",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end, "Focus to Left client in TaskList"),

    -- By direction client focus
    awful.key({modkey}, "j",
        function ()
            awful.client.focus.bydirection("down")
            if client.focus then client.focus:raise() end
        end, "Focus to Down Client"),
    awful.key({modkey}, "k",
        function ()
            awful.client.focus.bydirection("up")
            if client.focus then client.focus:raise() end
        end, "Focus to Up Client"),
    awful.key({modkey}, "h",
        function ()
            awful.client.focus.bydirection("left")
            if client.focus then client.focus:raise() end
        end, "Focus to Left Client"),
    awful.key({modkey}, "l",
        function ()
            awful.client.focus.bydirection("right")
            if client.focus then client.focus:raise() end
        end, "Focust to Right Client"),

    awful.key({modkey, "Shift"}, "j",
        function ()
            awful.client.swap.byidx(1)
        end, "Swap Client to Next Client"),
    awful.key({modkey, "Shift"}, "k",
        function ()
            awful.client.swap.byidx(-1)
        end, "Swap Client to Previous Client"),
    awful.key({modkey, "Control"}, "j",
        function ()
            awful.screen.focus_relative(1)
        end, "Focus to Next Relative Screen"),
    awful.key({modkey, "Control"}, "k",
        function ()
            awful.screen.focus_relative(-1)
        end, "Focus to Previous Relative Screen"),
    awful.key({modkey}, "u", awful.client.urgent.jumpto, "Jumpto Urgent Client"),
    awful.key({modkey}, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end, "Focus to Last Client"),

    keydoc.group("Window-specific bindings"),
    awful.key({modkey, "Control"}, "n", awful.client.restore, "Restore Minimize Client"),

    keydoc.group("Layout manipulation"),
    -- Layout manipulation
    awful.key({altkey, "Shift"}, "l", function () awful.tag.incmwfact(0.05) end,
        "Tag incmwfact 0.05"),
    awful.key({altkey, "Shift"}, "h", function () awful.tag.incmwfact(-0.05) end,
        "Tag decmwfact 0.05"),
    awful.key({modkey, "Shift"}, "l", function () awful.tag.incnmaster(-1) end,
        "Tag decnmaster 1"),
    awful.key({modkey, "Shift"}, "h", function () awful.tag.incnmaster(1) end,
        "Tag incnmmaster 1"),
    awful.key({modkey, "Control"}, "l", function () awful.tag.incncol(-1) end,
        "Tag decncol 1"),
    awful.key({modkey, "Control"}, "h", function () awful.tag.incncol(1) end,
        "Tag Incncol 1"),
    -- Layout change
    awful.key({modkey}, "space",  function () awful.layout.inc(layouts, 1) end,
        "Next Layout"),
    awful.key({modkey, "Shift"}, "space", function () awful.layout.inc(layouts, -1) end,
        "Previous Layout"),
    -- Show/Hide Wibox
    awful.key({modkey}, "b", function ()
            mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
                             end, "Toggle Panel"),

    keydoc.group("Misc"),
    -- Take a screenshot
    -- https://github.com/copycat-killer/dots/blob/master/bin/screenshot
    awful.key({}, "Print",
        function ()
            awful.util.spawn_with_shell(
                "scrot -d 1 -q 100 '%Y-%m-%d_$wx$h.png' -e 'mv $f /tmp/'" ..
                    " && notify-send 'ScreenCaptured'")
        end, "Screenshot"),
    awful.key({modkey}, "Print", function () os.execute("~/bin/pastimg.pl") end, "Screenshot"),
    awful.key({}, "XF86ScreenSaver",
        function ()
            awful.util.spawn("xss-lock.sh lock")
        end, "Lock Screen"),
    awful.key({ modkey, }, "Delete",
        function ()
            awful.util.spawn("xss-lock.sh lock")
        end, "Lock Screen"),
    awful.key({modkey}, "F1", keydoc.display, "Show keydoc"),

    awful.key({modkey}, "Return", function () awful.util.spawn(terminal) end,
        "Start Terminal"),

    -- ALSA volume control
    awful.key({}, "XF86AudioRaiseVolume",
        function ()
            os.execute(string.format("amixer set %s 1%%+", volumewidget.channel))
            volumewidget.update()
    end),
    awful.key({}, "XF86AudioLowerVolume",
        function ()
            os.execute(string.format("amixer set %s 1%%-", volumewidget.channel))
            volumewidget.update()
    end),
    awful.key({}, "XF86AudioMute",
        function ()
            os.execute(string.format("amixer set %s toggle", volumewidget.channel))
            volumewidget.update()
    end),
    awful.key({altkey, "Control"}, "m",
        function ()
            os.execute(string.format("amixer set %s 100%%", volumewidget.channel))
            volumewidget.update()
        end, "Max Volume"),

    -- MPD control
    awful.key({altkey, "Control"}, "Up",
        function ()
            awful.util.spawn_with_shell("mpc toggle || ncmpc toggle || pms toggle")
            mpdwidget.update()
        end, "Toggle Music Player"),
    awful.key({altkey, "Control"}, "Down",
        function ()
            awful.util.spawn_with_shell("mpc stop || ncmpc stop || pms stop")
            mpdwidget.update()
        end, "Stop Music Player"),
    awful.key({altkey, "Control"}, "Left",
        function ()
            awful.util.spawn_with_shell("mpc prev || ncmpc prev || pms prev")
            mpdwidget.update()
        end, "Previous Song"),
    awful.key({altkey, "Control"}, "Right",
        function ()
            awful.util.spawn_with_shell("mpc next || ncmpc next || pms next")
            mpdwidget.update()
        end, "Next Song"),

    -- Clipboard
    awful.key({modkey}, "c", function () os.execute("xsel -p -o | xsel -i -b") end,
        "Copy to Clipboard"),
    -- quickly move mouse to a safe position
    awful.key({modkey}, "o",
        function ()
            awful.util.spawn_with_shell("xdotool mousemove 10 750 click --clearmodifiers 1")
        end, "Move mouse point to bottom left then click"),

    -- Prompt
    awful.key({modkey}, "r", function () mypromptbox[mouse.screen]:run() end,
        "Promot Command Box"),

    awful.key({altkey, "Control", "Shift"}, "r",
        function ()
            awful.util.spawn("dmenu_run -i -p 'Run command:' -nb '" ..
                                 beautiful.bg_normal ..
                                 "' -nf '" .. beautiful.fg_normal ..
                                 "' -sb '" .. beautiful.bg_focus  ..
                                 "' -sf '" .. beautiful.fg_focus  .. "'")
        end, "Dmenu Launcher"),
    awful.key({altkey, "Control"}, "r",
        function ()
            awful.util.spawn("j4-dmenu-desktop" ..
                                 " --display-binary" ..
                                 " [--dmenu='dmenu -i']" ..
                                 " [--term='xterm']")
        end, "j4 Dmenu launcher"),
    awful.key({modkey}, "x",
        function ()
            awful.prompt.run({prompt = "Run Lua code: "},
                mypromptbox[mouse.screen].widget,
                awful.util.eval, nil,
                awful.util.getdir("cache") .. "/history_eval")
        end, "Lua code command box"),
    awful.key({modkey, "Control"}, "r", awesome.restart, "Restart Awesome"),
    awful.key({modkey, "Control", "Shift"}, "q", awesome.quit, "Quit Awesome")
)

clientkeys = awful.util.table.join(
    keydoc.group("Window-specific bindings"),
    awful.key({modkey}, "f", function (c) c.fullscreen = not c.fullscreen end,
        "Fullscreen"),
    awful.key({modkey, "Shift"}, "c", function (c) c:kill() end, "Kill client"),
    awful.key({modkey, "Control"}, "space", awful.client.floating.toggle,
        "Toggle Floating mode of current client"),
    awful.key({modkey, "Control"}, "Return",
        function (c)
            c:swap(awful.client.getmaster())
        end, "SwapToMaster"),
    awful.key({modkey, "Shift"}, "o", awful.client.movetoscreen, "Move to Screen"),
    awful.key({modkey}, "t", function (c) c.ontop = not c.ontop end,
        "Make Screen on Top"),
    awful.key({modkey}, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end, "Minimize current Client"),
    awful.key({modkey}, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end, "Maximize Current Client")
)

clientbuttons = awful.util.table.join(
    awful.button({}, 1, function (c) client.focus = c; c:raise() end),
    awful.button({altkey}, 1, awful.mouse.client.move),
    awful.button({altkey}, 3, awful.mouse.client.resize)
)

-- Set keys
root.keys(globalkeys)
-- }}}
