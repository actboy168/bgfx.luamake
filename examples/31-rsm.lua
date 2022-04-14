local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '31-rsm' {
    rootdir = lm.BgfxDir / 'examples/31-rsm',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/31-rsm/fs_rsm_combine.sc',
        shaderc.compile 'examples/31-rsm/fs_rsm_gbuffer.sc',
        shaderc.compile 'examples/31-rsm/fs_rsm_lbuffer.sc',
        shaderc.compile 'examples/31-rsm/fs_rsm_shadow.sc',
        shaderc.compile 'examples/31-rsm/vs_rsm_combine.sc',
        shaderc.compile 'examples/31-rsm/vs_rsm_gbuffer.sc',
        shaderc.compile 'examples/31-rsm/vs_rsm_lbuffer.sc',
        shaderc.compile 'examples/31-rsm/vs_rsm_shadow.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/column.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
        geometryc.compile 'examples/assets/meshes/orb.obj',
        geometryc.compile 'examples/assets/meshes/tree.obj',
        geometryc.compile 'examples/assets/meshes/unit_sphere.obj',
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
        'reflectiveshadowmap.cpp',
    },
}
