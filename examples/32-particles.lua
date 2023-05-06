local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local texturec = require 'examples.texturec'

example_target '32-particles' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        texturec.compile 'examples/runtime/textures/particle.ktx',
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
        'examples/32-particles/particles.cpp',
    },
}
