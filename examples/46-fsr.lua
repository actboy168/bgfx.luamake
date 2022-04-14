local lm = require "luamake"
local shader = require "examples.shader"

shader.compile "examples/46-fsr/cs_fsr_bilinear_32.sc"
shader.compile "examples/46-fsr/cs_fsr_easu_32.sc"
shader.compile "examples/46-fsr/cs_fsr_rcas_32.sc"
shader.compile "examples/46-fsr/cs_fsr_bilinear_16.sc"
shader.compile "examples/46-fsr/cs_fsr_easu_16.sc"
shader.compile "examples/46-fsr/cs_fsr_rcas_16.sc"

shader.compile "examples/46-fsr/vs_fsr_forward.sc"
shader.compile "examples/46-fsr/fs_fsr_forward.sc"
shader.compile "examples/46-fsr/fs_fsr_forward_grid.sc"
shader.compile "examples/46-fsr/vs_fsr_screenquad.sc"
shader.compile "examples/46-fsr/fs_fsr_copy_linear_to_gamma.sc"

lm:exe "46-fsr" {
    rootdir = lm.BgfxDir / "examples/46-fsr",
    deps = {
        "example-runtime",
        "shader-cs_fsr_bilinear_32",
        "shader-cs_fsr_easu_32",
        "shader-cs_fsr_rcas_32",
        "shader-cs_fsr_bilinear_16",
        "shader-cs_fsr_easu_16",
        "shader-cs_fsr_rcas_16",
        "shader-vs_fsr_forward",
        "shader-fs_fsr_forward",
        "shader-fs_fsr_forward_grid",
        "shader-vs_fsr_screenquad",
        "shader-fs_fsr_copy_linear_to_gamma",
    },
    defines = "ENTRY_CONFIG_IMPLEMENT_MAIN=1",
    includes = {
        lm.BxDir / "include",
        lm.BimgDir / "include",
        lm.BgfxDir / "include",
        lm.BgfxDir / "examples/common",
        lm.BgfxDir / "3rdparty",
    },
    sources = {
        "app.cpp",
        "fsr.cpp",
    }
}
