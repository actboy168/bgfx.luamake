local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local copy = require 'examples.copyfile'

example_target '31-rsm' {
    rootdir = lm.BgfxDir,
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
        copy.compile 'examples/runtime/meshes/unit_sphere.bin',
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
        'examples/31-rsm/reflectiveshadowmap.cpp',
    },
}
