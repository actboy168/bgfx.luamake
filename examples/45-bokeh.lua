local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'

lm:exe '45-bokeh' {
    rootdir = lm.BgfxDir / 'examples/45-bokeh',
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
        'bokeh.cpp',
    },
}
