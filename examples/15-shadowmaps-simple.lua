local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '15-shadowmaps-simple' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/15-shadowmaps-simple/fs_sms_mesh.sc',
        shaderc.compile 'examples/15-shadowmaps-simple/fs_sms_mesh_pd.sc',
        shaderc.compile 'examples/15-shadowmaps-simple/fs_sms_shadow.sc',
        shaderc.compile 'examples/15-shadowmaps-simple/fs_sms_shadow_pd.sc',
        shaderc.compile 'examples/15-shadowmaps-simple/vs_sms_mesh.sc',
        shaderc.compile 'examples/15-shadowmaps-simple/vs_sms_shadow.sc',
        shaderc.compile 'examples/15-shadowmaps-simple/vs_sms_shadow_pd.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
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
        'examples/15-shadowmaps-simple/shadowmaps_simple.cpp',
    },
}
