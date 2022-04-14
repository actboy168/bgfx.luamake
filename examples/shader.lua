local lm = require "luamake"

local platforms <const> = {
    windows = "windows",
    ios = "ios",
    macos = "osx",
    linux = "linux",
    android = "android",
}

local renderers <const> = {
    windows = "direct3d11",
    ios = "metal",
    osx = "metal",
    linux = "vulkan",
    android = "vulkan",
}

local stage_types <const> = {
    fs = "fragment",
    vs = "vertex",
    cs = "compute",
}

local shader_options <const> = {
    direct3d9 = {
        vs = "vs_5_0",
        fs = "ps_5_0",
        cs = "cs_5_0",
    },
    direct3d11 = {
        vs = "vs_5_0",
        fs = "ps_5_0",
        cs = "cs_5_0",
    },
    metal = {
        vs = "metal",
        fs = "metal",
        cs = "metal",
    },
    vulkan = {
        vs = "spirv",
        fs = "spirv",
        cs = "spriv",
    },
}

local shader_types <const> = {
    windows = "dx11",
    ios = "metal",
    macos = "metal",
    linux = "vulkan",
    android = "vulkan",
}

local function commandline(cfg)
    local platform = cfg.platform or platforms[lm.os]
    local renderer = cfg.renderer or renderers[platform]
    local stagename = cfg.stage
    local commands = {
        "-f", "$in", "-o", "$out",
        "--platform", platform,
        "--type", stage_types[stagename],
        "-p", shader_options[renderer][stagename],
    }
    if cfg.varying_path then
        commands[#commands+1] = "--varyingdef"
        commands[#commands+1] = cfg.varying_path
    end
    if cfg.includes then
        for _, p in ipairs(cfg.includes) do
            commands[#commands+1] = "-i"
            commands[#commands+1] = p
        end
    end
    if cfg.defines then
        local t = {}
        for _, m in ipairs(cfg.defines) do
            t[#t+1] = m
        end
        if #t > 0 then
            local defines = table.concat(t, ';')
            commands[#commands+1] = "--define"
            commands[#commands+1] = defines
        end
    end
    local level = cfg.optimizelevel
    if not level then
        if renderer:match("direct3d") then
            level = cfg.stage == "cs" and 1 or 3
        end
    end
    if cfg.debug then
        commands[#commands+1] = "--debug"
    else
        if level then
            commands[#commands+1] = "-O"
            commands[#commands+1] = tostring(level)
        end
    end
    return commands
end

local function compile(fullpath)
    local path, stage, name = fullpath:match "^(.*)/([cfv]s)_([^/]+)%.sc$"
    local target_name = ("shader-%s_%s"):format(stage, name)
    local input = lm.BgfxDir / ("%s/%s_%s.sc"):format(path, stage, name)
    local output = ("$bin/shaders/%s/%s_%s.bin"):format(shader_types[lm.os], stage, name)
    lm:build (target_name) {
        "$bin/shaderc",
        commandline {
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

return {
    compile = compile,
}
