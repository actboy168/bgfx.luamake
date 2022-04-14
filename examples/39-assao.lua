local lm = require 'luamake'
local shaderc = require 'examples.shaderc'
local geometryc = require 'examples.geometryc'
local texturec = require 'examples.texturec'

lm:exe '39-assao' {
    rootdir = lm.BgfxDir / 'examples/39-assao',
    deps = {
        'example-runtime',
        shaderc.compile 'examples/39-assao/cs_assao_apply.sc',
        shaderc.compile 'examples/39-assao/cs_assao_generate_importance_map.sc',
        shaderc.compile 'examples/39-assao/cs_assao_generate_q0.sc',
        shaderc.compile 'examples/39-assao/cs_assao_generate_q1.sc',
        shaderc.compile 'examples/39-assao/cs_assao_generate_q2.sc',
        shaderc.compile 'examples/39-assao/cs_assao_generate_q3.sc',
        shaderc.compile 'examples/39-assao/cs_assao_generate_q3base.sc',
        shaderc.compile 'examples/39-assao/cs_assao_load_counter_clear.sc',
        shaderc.compile 'examples/39-assao/cs_assao_non_smart_apply.sc',
        shaderc.compile 'examples/39-assao/cs_assao_non_smart_blur.sc',
        shaderc.compile 'examples/39-assao/cs_assao_non_smart_half_apply.sc',
        shaderc.compile 'examples/39-assao/cs_assao_postprocess_importance_map_a.sc',
        shaderc.compile 'examples/39-assao/cs_assao_postprocess_importance_map_b.sc',
        shaderc.compile 'examples/39-assao/cs_assao_prepare_depth_mip.sc',
        shaderc.compile 'examples/39-assao/cs_assao_prepare_depths.sc',
        shaderc.compile 'examples/39-assao/cs_assao_prepare_depths_and_normals.sc',
        shaderc.compile 'examples/39-assao/cs_assao_prepare_depths_and_normals_half.sc',
        shaderc.compile 'examples/39-assao/cs_assao_prepare_depths_half.sc',
        shaderc.compile 'examples/39-assao/cs_assao_smart_blur.sc',
        shaderc.compile 'examples/39-assao/cs_assao_smart_blur_wide.sc',
        shaderc.compile 'examples/39-assao/fs_assao_deferred_combine.sc',
        shaderc.compile 'examples/39-assao/fs_assao_gbuffer.sc',
        shaderc.compile 'examples/39-assao/vs_assao.sc',
        shaderc.compile 'examples/39-assao/vs_assao_gbuffer.sc',
        geometryc.compile 'examples/assets/meshes/bunny_decimated.obj',
        geometryc.compile 'examples/assets/meshes/column.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/cube.obj',
        geometryc.compile 'examples/assets/meshes/hollowcube.obj',
        geometryc.compile 'examples/assets/meshes/orb.obj',
        geometryc.compile 'examples/assets/meshes/tree.obj',
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
        'assao.cpp',
    },
}
