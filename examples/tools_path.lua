local lm = require "luamake"

local tools_path = (function ()
    if lm.hostos == lm.os then
        return "$bin/"
    end
    if lm.hostos == "windows" then
        return ("build/msvc/%s/bin/"):format(lm.mode)
    end
    return ("build/%s/%s/bin/"):format(lm.hostos, lm.mode)
end)()

return function (name)
    return tools_path..name
end
