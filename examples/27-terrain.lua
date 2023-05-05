local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '27-terrain' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/27-terrain/fs_terrain.sc',
        shaderc.compile 'examples/27-terrain/vs_terrain.sc',
        shaderc.compile 'examples/27-terrain/vs_terrain_height_texture.sc',
    },
    defines = lm.os ~= 'android' and 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/27-terrain/terrain.cpp',
    },
}
