local lm = require 'luamake'
local shaderc = require 'examples.shaderc'

lm:exe '24-nbody' {
    rootdir = lm.BgfxDir / 'examples/24-nbody',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/24-nbody/cs_indirect.sc',
        shaderc.compile 'examples/24-nbody/cs_init_instances.sc',
        shaderc.compile 'examples/24-nbody/cs_update_instances.sc',
        shaderc.compile 'examples/24-nbody/fs_particle.sc',
        shaderc.compile 'examples/24-nbody/vs_particle.sc',
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
        'nbody.cpp',
    },
}
