local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'

example_target '24-nbody' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/24-nbody/cs_indirect.sc',
        shaderc.compile 'examples/24-nbody/cs_init_instances.sc',
        shaderc.compile 'examples/24-nbody/cs_update_instances.sc',
        shaderc.compile 'examples/24-nbody/fs_particle.sc',
        shaderc.compile 'examples/24-nbody/vs_particle.sc',
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
        'examples/24-nbody/nbody.cpp',
    },
}
