local lm = require "luamake"

require "tools.geometryc"

local geometryc_args <const> = {
    bunny = {"--barycentric"},
    bunny_decimated = {"-c"},
    bunny_patched = {},
    column = {},
    cube = {},
    hollowcube = {"--barycentric"},
    orb = {"--barycentric"},
    platform = {},
    tree = {"-c"},
    tree1b_lod0_1 = {"-c"},
    tree1b_lod0_2 = {"-c"},
    tree1b_lod1_1 = {"-c"},
    tree1b_lod1_2 = {"-c"},
    tree1b_lod2_1 = {"-c"},
    tree1b_lod2_2 = {"-c"},
}

local m = {}

local function compile(fullpath)
    local name = fullpath:match "/([^/]+)%.obj$"
    local target_name = ("mesh-%s"):format(name)
    if m[name] then
        return target_name
    end
    m[name] = true
    local args = assert(geometryc_args[name])
    lm:build (target_name) {
        "$bin/geometryc",
        "-f", "$in","-o", "$out",
        "--packnormal", "1",
        args,
        input = lm.BgfxDir / fullpath,
        output = ("$bin/meshes/%s.bin"):format(name),
        deps = "geometryc",
        description = "Convert geometry $in"
    }
    return target_name
end

return {
    compile = compile,
}
