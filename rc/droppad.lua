local sdrop = require("scratchdrop")

globalkeys = awful.util.table.join(
    globalkeys,
    -- Dropdown terminal
    awful.key({altkey}, "`",
        function ()
            sdrop(terminal, "top", "center", 0.95, 0.45, true, mouse.screen)
    end),
    awful.key({modkey}, "`",
        function ()
            sdrop("nautilus", "top", "center", 0.8, 0.8, true, mouse.screen)
    end)
)

root.keys(globalkeys)
