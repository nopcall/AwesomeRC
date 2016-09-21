local quake = loadrc("quake", "vbe/quake")

local quakeconsole = {}

-- each screen has it's own terminal
for s = 1, screen.count() do
    quakeconsole[s] = quake({terminal = terminal,
                             name = ddname .. s,
                             height = 0.45,
                             width = 0.95,
                             screen = s})
end

local keydoc = loadrc("keydoc", "vbe/keydoc")
globalkeys = awful.util.table.join(
    globalkeys,

    keydoc.group("Misc"),
    awful.key({altkey}, "Escape",
        function () quakeconsole[mouse.screen]:toggle() end,
        "Dropdown Terminal")
)

-- update root keys
root.keys(globalkeys)
