local keydoc = loadrc("keydoc", "vbe/keydoc")

-- Freedesktop Menu
mymainmenu = awful.menu.new({items = loadrc("menugen", "menugen").build_menu(),
                             theme = { height = 16, width = 130 }})

globalkeys = awful.util.table.join(
    globalkeys,

    keydoc.group("Misc"),
    awful.key({modkey, "Shift"}, "m",
        function ()
            mymainmenu:show({keygrabber = true})
        end, "Show Menu")
)

-- update root keys
root.keys(globalkeys)
