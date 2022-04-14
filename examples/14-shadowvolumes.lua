local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '14-shadowvolumes' {
    rootdir = lm.BgfxDir / 'examples/14-shadowvolumes',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_color_lighting.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_color_texture.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svbackblank.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svbackcolor.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svbacktex1.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svbacktex2.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svfrontblank.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svfrontcolor.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svfronttex1.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svfronttex2.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svside.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svsideblank.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svsidecolor.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_svsidetex.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_texture.sc',
        shaderc.compile 'examples/14-shadowvolumes/fs_shadowvolume_texture_lighting.sc',
        shaderc.compile 'examples/14-shadowvolumes/vs_shadowvolume_color_lighting.sc',
        shaderc.compile 'examples/14-shadowvolumes/vs_shadowvolume_color_texture.sc',
        shaderc.compile 'examples/14-shadowvolumes/vs_shadowvolume_svback.sc',
        shaderc.compile 'examples/14-shadowvolumes/vs_shadowvolume_svfront.sc',
        shaderc.compile 'examples/14-shadowvolumes/vs_shadowvolume_svside.sc',
        shaderc.compile 'examples/14-shadowvolumes/vs_shadowvolume_texture.sc',
        shaderc.compile 'examples/14-shadowvolumes/vs_shadowvolume_texture_lighting.sc',
        geometryc.compile 'examples/assets/meshes/bunny_decimated.obj',
        geometryc.compile 'examples/assets/meshes/bunny_patched.obj',
        geometryc.compile 'examples/assets/meshes/column.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/platform.obj',
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
        'shadowvolumes.cpp',
    },
}
