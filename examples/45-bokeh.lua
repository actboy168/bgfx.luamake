local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

example_target '45-bokeh' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_copy.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_copy_linear_to_gamma.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_dof_combine.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_dof_debug.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_dof_downsample.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_dof_second_pass.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_dof_single_pass.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_forward.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_forward_grid.sc',
        shaderc.compile 'examples/45-bokeh/fs_bokeh_linear_depth.sc',
        shaderc.compile 'examples/45-bokeh/vs_bokeh_forward.sc',
        shaderc.compile 'examples/45-bokeh/vs_bokeh_screenquad.sc',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
        texturec.compile 'examples/runtime/textures/fieldstone-n.dds',
        texturec.compile 'examples/runtime/textures/fieldstone-rgba.dds',
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
        'examples/45-bokeh/bokeh.cpp',
    },
}
