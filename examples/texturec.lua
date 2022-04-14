local lm = require "luamake"

--require "tools.texturec"

local function compile(fullpath)
    --TODO use texturec compile
    local name = fullpath:match "/([^/]*%.%w+)$"
    local target_name = ("mesh-%s"):format(name)
    lm:copy (target_name) {
        input = lm.BgfxDir / fullpath,
        output = ("$bin/textures/%s"):format(name),
    }
    return target_name
end

return {
    compile = compile,
}
