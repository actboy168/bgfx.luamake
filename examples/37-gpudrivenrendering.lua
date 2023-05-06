local lm = require 'luamake'
local example_target = require 'examples.util'.example_target
local shaderc = require 'examples.shaderc'

example_target '37-gpudrivenrendering' {
    rootdir = lm.BgfxDir,
    deps = {
        'example-runtime',
        shaderc.compile 'examples/37-gpudrivenrendering/cs_gdr_copy_z.sc',
        shaderc.compile 'examples/37-gpudrivenrendering/cs_gdr_downscale_hi_z.sc',
        shaderc.compile 'examples/37-gpudrivenrendering/cs_gdr_occlude_props.sc',
        shaderc.compile 'examples/37-gpudrivenrendering/cs_gdr_stream_compaction.sc',
        shaderc.compile 'examples/37-gpudrivenrendering/fs_gdr_instanced_indirect_rendering.sc',
        shaderc.compile 'examples/37-gpudrivenrendering/vs_gdr_instanced_indirect_rendering.sc',
        shaderc.compile 'examples/37-gpudrivenrendering/vs_gdr_render_occlusion.sc',
    },
    includes = {
        lm.BxDir / 'include',
        lm.BimgDir / 'include',
        lm.BgfxDir / 'include',
        lm.BgfxDir / 'examples/common',
        lm.BgfxDir / '3rdparty',
    },
    sources = {
        'examples/37-gpudrivenrendering/gpudrivenrendering.cpp',
    },
}
