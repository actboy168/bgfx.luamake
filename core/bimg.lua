local lm = require "luamake"

lm:source_set "astc-encoder" {
    rootdir = lm.BimgDir .. "/3rdparty/astc-encoder",
    includes = {
        ".",
        "include"
    },
    sources = {
        "source/*.cpp",
    }
}

lm:source_set "bimg" {
    rootdir = lm.BimgDir,
    deps = "astc-encoder",
    includes = {
        lm.BxDir .. "/include",
        "include",
        "3rdparty/astc-encoder/include"
    },
    sources = {
        "src/image.cpp",
        "src/image_gnf.cpp",
    },
    gcc = {
        flags = {
            "-Wno-class-memaccess",
        }
    },
	msvc = {
		flags = "/Zc:preprocessor",
	},
}

lm:source_set "bimg-miniz" {
    rootdir = lm.BimgDir,
    includes = {
        "3rdparty/tinyexr/deps/miniz"
    },
    defines = {
        "MINIZ_NO_ARCHIVE_APIS",
        "MINIZ_NO_STDIO",
    },
    sources = {
        "3rdparty/tinyexr/deps/miniz/miniz.c",
    }
}

lm:source_set "bimg-decode" {
    rootdir = lm.BimgDir,
    deps = "bimg-miniz",
    includes = {
        lm.BxDir .. "/include",
        "include",
        "3rdparty",
        "3rdparty/tinyexr/deps/miniz"
    },
    sources = {
        "src/image_decode.cpp",
    },
    msvc = {
        flags = "/Zc:preprocessor",
    },
}

lm:source_set "bimg-iqa" {
    rootdir = lm.BimgDir,
    includes = "3rdparty/iqa/include",
    sources = "3rdparty/iqa/source/*.c",
}

lm:source_set "bimg-encode" {
    rootdir = lm.BimgDir,
    deps = {
        "astc-encoder",
        "bimg-iqa",
    },
    includes = {
        lm.BxDir .. "/include",
        "include",
        "3rdparty",
        "3rdparty/nvtt",
        "3rdparty/iqa/include",
        "3rdparty/astc-encoder/include"
    },
    sources = {
        "src/image_encode.cpp",
        "src/image_cubemap_filter.cpp",
        "3rdparty/libsquish/*.cpp",
        "3rdparty/edtaa3/*.cpp",
        "3rdparty/etc1/*.cpp",
        "3rdparty/etc2/*.cpp",
        "3rdparty/nvtt/**/*.cpp",
        "3rdparty/pvrtc/*.cpp",
    },
    msvc = {
        flags = {
            "/wd4244",
            "/wd4819",
            "/wd5056",
			"/Zc:preprocessor",
        }
    },
    gcc = {
        flags = {
            "-Wno-class-memaccess",
        }
    },
    clang = {
        flags = {
            "-Wno-tautological-compare",
            "-Wno-unused-function",
        }
    }
}
