local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local texturec = require 'examples.texturec'

lm:exe '33-pom' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/33-pom/fs_pom.sc',
        shaderc.compile 'examples/33-pom/vs_pom.sc',
        texturec.compile 'examples/runtime/textures/parallax-d.ktx',
        texturec.compile 'examples/runtime/textures/parallax-h.ktx',
        texturec.compile 'examples/runtime/textures/parallax-n.ktx',
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
        'examples/33-pom/pom.cpp',
    },
}
