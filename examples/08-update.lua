local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local texturec = require 'examples.texturec'

example_target '08-update' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/08-update/cs_update.sc',
        shaderc.compile 'examples/08-update/fs_update.sc',
        shaderc.compile 'examples/08-update/fs_update_3d.sc',
        shaderc.compile 'examples/08-update/fs_update_cmp.sc',
        shaderc.compile 'examples/08-update/vs_update.sc',
        texturec.compile 'examples/runtime/textures/texture_compression_atc.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_atc.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_atce.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_atce.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_atci.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_atci.dds',
        texturec.compile 'examples/runtime/textures/texture_compression_bc1.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_bc1.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_bc2.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_bc2.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_bc3.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_bc3.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_etc1.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_etc1.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_etc2.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_etc2.ktx',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc12.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc12.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc14.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc14.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc22.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc22.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc24.pvr',
        texturec.compile 'examples/runtime/textures/texture_compression_ptc24.pvr',
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
        'examples/08-update/update.cpp',
    },
}
