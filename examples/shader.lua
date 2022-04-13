local lm = require "luamake"
local preprocess = require "preprocess.shader"

local shader_types <const> = {
    windows = "dx11",
    ios = "metal",
    macos = "metal",
    linux = "vulkan",
    android = "vulkan",
}

local function compile_shader(path, stage, name)
    local target_name = ("shader-%s_%s"):format(stage, name)
    local input = lm.BgfxDir / ("%s/%s_%s.sc"):format(path, stage, name)
    local output = lm.BgfxDir / ("examples/runtime/shaders/%s/%s_%s.bin"):format(shader_types[lm.os], stage, name)
    lm:build (target_name) {
        "$bin/shaderc",
        preprocess {
            stage = stage,
            includes = {
                lm.BgfxDir / "src"
            }
        },
        input = input,
        output = output,
        deps = "shaderc",
    }
end

local function compile(cfg)
    compile_shader(cfg.path, "fs", cfg.name)
    compile_shader(cfg.path, "vs", cfg.name)
    lm:phony ("shader-"..cfg.name) {
        deps = {
            "shader-fs_"..cfg.name,
            "shader-vs_"..cfg.name,
        }
    }
end

return {
    compile = compile,
}
