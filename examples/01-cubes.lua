local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '01-cubes' {
    rootdir = lm.BgfxDir / 'examples/01-cubes',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/01-cubes/fs_cubes.sc',
        shaderc.compile 'examples/01-cubes/vs_cubes.sc',
    },
    defines = 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'cubes.cpp',
    },
}
