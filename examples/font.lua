local lm = require "luamake"

local function compile(fullpath)
    local name = fullpath:match "/([^/]*%.%w+)$"
    local target_name = ("font-%s"):format(name)
    lm:copy (target_name) {
        input = lm.BgfxDir / fullpath,
        output = ("$bin/font/%s"):format(name),
    }
    return target_name
end

return {
    compile = compile,
}
