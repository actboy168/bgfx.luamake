local lm = require 'luamake'
local texturec = require 'examples.texturec'

lm:exe '47-pixelformats' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        texturec.compile 'examples/runtime/textures/pf_alpha_test.dds',
        texturec.compile 'examples/runtime/textures/pf_compression_test.dds',
        texturec.compile 'examples/runtime/textures/pf_cubemap_test.dds',
        texturec.compile 'examples/runtime/textures/pf_uv_filtering_test.dds',
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
        'examples/47-pixelformats/pixelformats.cpp',
    },
}
