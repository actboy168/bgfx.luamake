local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

lm:exe '13-stencil' {
    rootdir = lm.BgfxDir / 'examples/13-stencil',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/13-stencil/fs_stencil_color_black.sc',
        shaderc.compile 'examples/13-stencil/fs_stencil_color_lighting.sc',
        shaderc.compile 'examples/13-stencil/fs_stencil_color_texture.sc',
        shaderc.compile 'examples/13-stencil/fs_stencil_texture.sc',
        shaderc.compile 'examples/13-stencil/fs_stencil_texture_lighting.sc',
        shaderc.compile 'examples/13-stencil/vs_stencil_color.sc',
        shaderc.compile 'examples/13-stencil/vs_stencil_color_lighting.sc',
        shaderc.compile 'examples/13-stencil/vs_stencil_color_texture.sc',
        shaderc.compile 'examples/13-stencil/vs_stencil_texture.sc',
        shaderc.compile 'examples/13-stencil/vs_stencil_texture_lighting.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/column.obj',
        texturec.compile 'examples/runtime/textures/fieldstone-rgba.dds',
        texturec.compile 'examples/runtime/textures/figure-rgba.dds',
        texturec.compile 'examples/runtime/textures/flare.dds',
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
        'stencil.cpp',
    },
}
