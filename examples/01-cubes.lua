local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '01-cubes' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/01-cubes/fs_cubes.sc',
        shaderc.compile 'examples/01-cubes/vs_cubes.sc',
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
        'examples/01-cubes/cubes.cpp',
    },
}
