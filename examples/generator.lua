local BgfxDir = ...

local fs = require "bee.filesystem"

local function readall(file)
    local f <close> = assert(io.open(file, "rb"))
    return f:read "a"
end

local function generator(name)
    local s = {}
    local function write(text)
        s[#s+1] = text
    end

    local projectdir = BgfxDir.."/examples/"..name
    local c_sources = {}
    local cpp_sources = {}
    local shaders = {}
    local meshes = {}
    for file in fs.pairs(projectdir) do
        local filename = file:filename():string()
        local ext = file:extension():string():lower()
        if ext == ".c" then
            c_sources[#c_sources+1] = filename
        elseif ext == ".cpp" then
            cpp_sources[#cpp_sources+1] = filename
        elseif ext == ".sc" then
            if filename:match "^[cfv]s_" then
                shaders[#shaders+1] = filename
            end
        end
    end

    table.sort(c_sources)
    table.sort(cpp_sources)
    table.sort(shaders)

    for _, filename in ipairs(cpp_sources) do
        local content = readall(projectdir.."/"..filename)
        content:gsub('"meshes/([^.]*)%.bin"', function (mesh)
            meshes[#meshes+1] = mesh
        end)
    end
    table.sort(meshes)

    write "local lm = require 'luamake'"
    if #shaders > 0 then
        write "local shaderc = require 'examples.shaderc'"
    end
    if #meshes > 0 then
        write "local geometryc = require 'examples.geometryc'"
    end
    write ""
    write "lm:exe '${NAME}' {"
    write "    rootdir = lm.BgfxDir / 'examples/${NAME}',"
    write "    deps = {"
    write "        'example-runtime',"
    for _, shader in ipairs(shaders) do
        write(("        shaderc.compile 'examples/${NAME}/%s',"):format(shader))
    end
    for _, mesh in ipairs(meshes) do
        write(("        geometryc.compile 'examples/assets/meshes/%s.obj',"):format(mesh))
    end
    write "    },"
    write "    defines = 'ENTRY_CONFIG_IMPLEMENT_MAIN=1',"
    write "    includes = {"
    write "        lm.BxDir / 'include',"
    write "        lm.BimgDir / 'include',"
    write "        lm.BgfxDir / 'include',"
    write "        lm.BgfxDir / 'examples/common',"
    write "        lm.BgfxDir / '3rdparty',"
    write "    },"
    write "    sources = {"
    for _, filename in ipairs(c_sources) do
        write(("        '%s',"):format(filename))
    end
    for _, filename in ipairs(cpp_sources) do
        write(("        '%s',"):format(filename))
    end
    write "    },"
    write "}"
    write ""

    local result = table.concat(s, "\n")
        : gsub("${(%u+)}", {
            NAME = name,
        })
    local f <close> = assert(io.open("./examples/"..name..".lua", "wb"))
    f:write(result)
end

for example in fs.pairs(BgfxDir.."/examples/") do
    local name = example:string():match '/(%d%d-.*)$'
    if name then
        generator(name)
    end
end
