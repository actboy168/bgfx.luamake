local lm = require "luamake"

require "tools.geometryc"

local function compile(cfg)
    local name = cfg.name
    local target_name = ("mesh-%s"):format(name)
    local input = lm.BgfxDir / ("examples/assets/meshes/%s.obj"):format(name)
    local output = ("$bin/meshes/%s.bin"):format(name)
    lm:build (target_name) {
        "$bin/geometryc",
        "-f", "$in","-o", "$out",
        cfg,
        input = input,
        output = output,
        deps = "geometryc",
        description = "Converting geometry $in..."
    }
end

return {
    compile = compile,
}
