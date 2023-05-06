local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local texturec = require 'examples.texturec'

example_target '33-pom' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/33-pom/fs_pom.sc',
        shaderc.compile 'examples/33-pom/vs_pom.sc',
        texturec.compile 'examples/runtime/textures/parallax-d.ktx',
        texturec.compile 'examples/runtime/textures/parallax-h.ktx',
        texturec.compile 'examples/runtime/textures/parallax-n.ktx',
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
        'examples/33-pom/pom.cpp',
    },
}
