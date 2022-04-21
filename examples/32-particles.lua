local lm = require 'luamake'
local texturec = require 'examples.texturec'

lm:exe '32-particles' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        texturec.compile 'examples/runtime/textures/particle.ktx',
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
        'examples/32-particles/particles.cpp',
    },
}
