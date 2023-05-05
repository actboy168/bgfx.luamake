local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

local function example_target(name)
    if lm.os == 'android' then
        return lm:dll(name)
    else
        return lm:exe(name)
    end
end

example_target '09-hdr' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/09-hdr/fs_hdr_blur.sc',
        shaderc.compile 'examples/09-hdr/fs_hdr_bright.sc',
        shaderc.compile 'examples/09-hdr/fs_hdr_lum.sc',
        shaderc.compile 'examples/09-hdr/fs_hdr_lumavg.sc',
        shaderc.compile 'examples/09-hdr/fs_hdr_mesh.sc',
        shaderc.compile 'examples/09-hdr/fs_hdr_skybox.sc',
        shaderc.compile 'examples/09-hdr/fs_hdr_tonemap.sc',
        shaderc.compile 'examples/09-hdr/vs_hdr_blur.sc',
        shaderc.compile 'examples/09-hdr/vs_hdr_bright.sc',
        shaderc.compile 'examples/09-hdr/vs_hdr_lum.sc',
        shaderc.compile 'examples/09-hdr/vs_hdr_lumavg.sc',
        shaderc.compile 'examples/09-hdr/vs_hdr_mesh.sc',
        shaderc.compile 'examples/09-hdr/vs_hdr_skybox.sc',
        shaderc.compile 'examples/09-hdr/vs_hdr_tonemap.sc',
        geometryc.compile 'examples/assets/meshes/bunny.obj',
        texturec.compile 'examples/runtime/textures/uffizi.ktx',
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
        'examples/09-hdr/hdr.cpp',
    },
}
