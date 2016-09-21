
local setmetatable = setmetatable
local awful = require("awful")
local capi = { timer = timer }

module("autorun")

local run_once = function(prg,arg_string,pname,screen)
    if not prg then
        do return nil end
    end

    if not pname then
        pname = prg
    end

    if not arg_string then
        awful.util.spawn_with_shell("pgrep -u $USER -x '" .. pname ..
                                        "' || (" .. prg .. ")", screen)
    else
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" ..
                                        pname .. " ".. arg_string ..
                                        "' || (" .. prg .. " " .. arg_string ..
                                        ")", screen)
    end
end

-- Run a command if not already running.
local autorun = function(prg,arg_string,pname,screen)
    -- We need to wait for awesome to be ready. Hence the timer.
    local stimer = capi.timer { timeout = 0 }
    local run = function()
        stimer:stop()
        run_once(prg,arg_string,pname,screen)
    end
    stimer:connect_signal("timeout", run)
    stimer:start()
end

setmetatable(_M, { __call = function(_, ...) return autorun(...) end })
