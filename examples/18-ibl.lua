local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

example_target '18-ibl' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/18-ibl/fs_ibl_mesh.sc',
        shaderc.compile 'examples/18-ibl/fs_ibl_skybox.sc',
        shaderc.compile 'examples/18-ibl/vs_ibl_mesh.sc',
        shaderc.compile 'examples/18-ibl/vs_ibl_skybox.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        geometryc.compile 'examples/assets/meshes/orb.obj',
        texturec.compile 'examples/runtime/textures/bolonga_irr.dds',
        texturec.compile 'examples/runtime/textures/bolonga_lod.dds',
        texturec.compile 'examples/runtime/textures/kyoto_irr.dds',
        texturec.compile 'examples/runtime/textures/kyoto_lod.dds',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/18-ibl/ibl.cpp',
    },
}
