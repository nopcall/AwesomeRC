-- load necessary layaout components with layout dir prefix.
loadrc("component/tags")
loadrc("component/tasks")
loadrc("component/widgets")

-- Iterate for add widgets to layout
local widget_add_iterate = function (layout, widgets)
    for _, t in pairs(widgets) do
        layout:add(t)
    end
end

-- promptbox to run command
mypromptbox = {}

-- layoutbox to set client tile
mylayoutbox = {}

-- per screen setting
for s = 1, screen.count() do
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s,
                                        awful.widget.taglist.filter.all,
                                        mytaglist.buttons)

    -- Create a promptbox
    mypromptbox[s] = awful.widget.prompt()

    -- Create a tasklist
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags,
                                          mytasklist.buttons)

    -- We need a layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                               awful.button({}, 1,
                                   function () awful.layout.inc(layouts, 1) end),
                               awful.button({}, 3,
                                   function () awful.layout.inc(layouts, -1) end),
                               awful.button({}, 4,
                                   function () awful.layout.inc(layouts, 1) end),
                               awful.button({}, 5,
                                   function () awful.layout.inc(layouts, -1) end)))

    -- {{ Widgets that are aligned to the upper left
    local left_layout = wibox.layout.fixed.horizontal()
    widget_add_iterate(left_layout,
                       {mytaglist[s],
                        mypromptbox[s],
                        mpdbg,
                        sep})
    -- }}

    -- {{ Widgets that are aligned to the upper right
    local right_layout = wibox.layout.fixed.horizontal()

    -- only show systray on main screen
    if s == 1 then
        widget_add_iterate(right_layout, {sep, wibox.widget.systray()})
    end

    widget_add_iterate(right_layout,
                       {rsbg,
                        weathericon, myweather,
                        netbg,
                        sep,
                        cpuwidget, memwidget, tempwidget,
                        volbg,
                        batwidget,
                        clockbg,
                        mylayoutbox[s]})
    -- }}

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    -- Create the upper wibox
    mywibox[s] = awful.wibox({position = "top", screen = s, height = 20})

    -- Show it now
    mywibox[s]:set_widget(layout)

end
