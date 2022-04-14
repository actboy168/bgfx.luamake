local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local texturec = require 'examples.texturec'

lm:exe '21-deferred' {
    rootdir = lm.BgfxDir / 'examples/21-deferred',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/21-deferred/fs_deferred_clear_uav.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_combine.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_combine_ta.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_debug.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_debug_line.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_debug_ta.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_geom.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_light.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_light_ta.sc',
        shaderc.compile 'examples/21-deferred/fs_deferred_light_uav.sc',
        shaderc.compile 'examples/21-deferred/vs_deferred_combine.sc',
        shaderc.compile 'examples/21-deferred/vs_deferred_debug.sc',
        shaderc.compile 'examples/21-deferred/vs_deferred_debug_line.sc',
        shaderc.compile 'examples/21-deferred/vs_deferred_geom.sc',
        shaderc.compile 'examples/21-deferred/vs_deferred_light.sc',
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
        'deferred.cpp',
    },
}
