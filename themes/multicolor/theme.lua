--[[
    Multicolor Awesome WM config 2.0
    github.com/copycat-killer
--]]


theme                               = {}

-- essential dir
theme.confdir                       = awful.util.getdir("config") .. "/themes/multicolor"
theme.icondir                       = theme.confdir .. "/icons"

theme.wallpaper                     = theme.confdir .. "/wallpaper/solarized-dark-k.png"
theme.font                          = "Terminus 8"

-- {{{ color defines
-- theme.fg_black                   = "#424242"
-- theme.fg_red                     = "#ce5666"
-- theme.fg_green                   = "#80a673"
-- theme.fg_yellow                  = "#ffaf5f"
-- theme.fg_blue                    = "#7788af"
-- theme.fg_magenta                 = "#94738c"
-- theme.fg_cyan                    = "#778baf"
-- theme.fg_white                   = "#aaaaaa"
-- theme.fg_blu                     = "#8ebdde"

-- solarized dark
theme.colors                        = {}

theme.colors.base3                  = "#002b36ff"
theme.colors.base2                  = "#073642ff"
theme.colors.base1                  = "#586e75ff"
theme.colors.base0                  = "#657b83ff"
theme.colors.base00                 = "#839496ff"
theme.colors.base01                 = "#93a1a1ff"
theme.colors.base02                 = "#eee8d5ff"
theme.colors.base03                 = "#fdf6e3ff"

theme.colors.yellow                 = "#b58900ff"
theme.colors.orange                 = "#cb4b16ff"
theme.colors.red                    = "#dc322fff"
theme.colors.magenta                = "#d33682ff"
theme.colors.violet                 = "#6c71c4ff"
theme.colors.blue                   = "#268bd2ff"
theme.colors.cyan                   = "#2aa198ff"
theme.colors.green                  = "#859900ff"
theme.colors.gray                   = "#607d8b"

-- meterial color blue
theme.colors.mt_blue                = "#5677fc"
theme.colors.mt_blue_600            = "#4e6cef"
theme.colors.mt_blue_700            = "#455ede"
theme.colors.mt_blue_900            = "#2a36b1"
theme.colors.mt_cyan                = "#00bcd4"
theme.colors.mt_red                 = "#e51c23"
theme.colors.mt_pink                = "#e91e63"
-- }}}

-- {{{ essential
theme.bg_normal                     = theme.colors.base2 -- base2
theme.bg_focus                      = theme.colors.blue
theme.bg_urgent                     = theme.colors.mt_red

theme.fg_normal                     = theme.colors.base02
theme.fg_focus                      = theme.colors.base03
theme.fg_urgent                     = theme.colors.base3
-- }}}

-- {{{ border
theme.border_width                  = 5
theme.border_normal                 = theme.bg_normal
theme.border_focus                  = theme.colors.mt_cyan
theme.border_marked                 = theme.bg_urgent
-- }}}

-- {{{ menu
theme.menu_height                   = 15
theme.menu_width                    = 100
theme.submenu_icon                  = theme.icondir .. "/submenu.png"
-- }}}

-- {{{ tag
theme.icon_tag                      = theme.icondir .. "/taglist"

theme.taglist_squares_sel           = theme.icon_tag .. "/square_sel.png"
theme.taglist_squares_unsel         = theme.icon_tag .. "/square_unsel.png"
-- }}}

-- {{{ tasklist
theme.tasklist_disable_icon         = false
-- color for minimized client only work with both variable were set
-- theme.tasklist_fg_minimize          = theme.colors.magenta
-- theme.tasklist_bg_minimize          = theme.bg_normal

-- flag
theme.tasklist_floating             = "|F|"
theme.tasklist_ontop                = "|T|"
theme.tasklist_maximized            = "|M|"
theme.tasklist_maximized_horizontal = "|H|"
theme.tasklist_maximized_vertical   = "|V|"
-- }}}

-- {{{ layout icons
theme.icon_layout                   = theme.icondir .."/layout"

theme.layout_tile                   = theme.icon_layout .. "/tile.png"
theme.layout_tileleft               = theme.icon_layout .. "/tileleft.png"
theme.layout_tilebottom             = theme.icon_layout .. "/tilebottom.png"
theme.layout_tiletop                = theme.icon_layout .. "/tiletop.png"
theme.layout_fairv                  = theme.icon_layout .. "/fairv.png"
theme.layout_fairh                  = theme.icon_layout .. "/fairh.png"
theme.layout_spiral                 = theme.icon_layout .. "/spiral.png"
theme.layout_dwindle                = theme.icon_layout .. "/dwindle.png"
theme.layout_max                    = theme.icon_layout .. "/max.png"
theme.layout_fullscreen             = theme.icon_layout .. "/fullscreen.png"
theme.layout_magnifier              = theme.icon_layout .. "/magnifier.png"
theme.layout_floating               = theme.icon_layout .. "/floating.png"
-- }}}

return theme
