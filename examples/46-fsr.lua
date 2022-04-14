local lm = require "luamake"
local shader = require "examples.shader"

shader.compile_cs {
    path = "examples/46-fsr/",
    name = "fsr_bilinear_32",
}

shader.compile_cs {
    path = "examples/46-fsr/",
    name = "fsr_easu_32",
}

shader.compile_cs {
    path = "examples/46-fsr/",
    name = "fsr_rcas_32",
}



shader.compile_cs {
    path = "examples/46-fsr/",
    name = "fsr_bilinear_16",
}


shader.compile_cs {
    path = "examples/46-fsr/",
    name = "fsr_easu_16",
}


shader.compile_cs {
    path = "examples/46-fsr/",
    name = "fsr_rcas_16",
}

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
