local testfile = arg[1]

local subprocess = require "bee.subprocess"
local platform = require "bee.platform"
local fs = require "bee.filesystem"
local EXE = platform.os == "windows" and ".exe" or ""

local cwd = fs.path(testfile):parent_path()
fs.create_directories(cwd / "temp")

local process = assert(subprocess.spawn {
    fs.absolute(testfile..EXE), table.unpack(arg, 2),
    cwd = cwd,
    stdout = io.stdout,
    stderr = "stdout",
})
local code = process:wait()
if code ~= 0 then
    os.exit(code, true)
end
