local lm = require "luamake"

require "tools.geometryc"

local function compile(cfg)
    local name = cfg.name
    local target_name = ("mesh-%s"):format(name)
    local fullpath = ("examples/assets/meshes/%s.obj"):format(name)
    lm:build (target_name) {
        "$bin/geometryc",
        "-f", "$in","-o", "$out",
        cfg,
        input = lm.BgfxDir / fullpath,
        output = ("$bin/meshes/%s.bin"):format(name),
        deps = "geometryc",
        description = "Convert geometry $in"
    }
end

return {
    compile = compile,
}
