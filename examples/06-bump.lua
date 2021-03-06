local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local texturec = require 'examples.texturec'

lm:exe '06-bump' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/06-bump/fs_bump.sc',
        shaderc.compile 'examples/06-bump/vs_bump.sc',
        shaderc.compile 'examples/06-bump/vs_bump_instanced.sc',
        texturec.compile 'examples/runtime/textures/fieldstone-n.dds',
        texturec.compile 'examples/runtime/textures/fieldstone-rgba.dds',
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
        'examples/06-bump/bump.cpp',
    },
}
