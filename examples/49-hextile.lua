local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local texturec = require 'examples.texturec'

lm:exe '49-hextile' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/49-hextile/fs_hextile.sc',
        shaderc.compile 'examples/49-hextile/vs_hextile.sc',
        texturec.compile 'examples/runtime/textures/aerial_rocks_04_diff_2k.ktx',
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
        'examples/49-hextile/hextile.cpp',
    },
}
