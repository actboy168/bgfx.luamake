local lm = require "luamake"

--TODO use texturec compile
--require "tools.texturec"

local m = {}

local function compile(fullpath)
    local name = fullpath:match "/([^/]*%.%w+)$"
    local target_name = ("texture-%s"):format(name)
    if m[target_name] then
        return target_name
    end
    m[target_name] = true
    lm:copy (target_name) {
        input = lm.BgfxDir / fullpath,
        output = ("$bin/textures/%s"):format(name),
    }
    return target_name
end

return {
    compile = compile,
}
