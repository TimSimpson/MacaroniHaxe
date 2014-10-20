import("Lp3", "Lp3Project", "DEV")
require "Lp3Project"
require "os"
PathList = require "Macaroni.IO.PathList"

Lp3Project{
  group="Lp3",
  project="MacaroniHaxe",
  version="DEV",
  src="src",
  target="target",
  libShortName="MacaroniHaxe",
  dependencies = {
    load("Lp3", "Lp3.Engine.Core", "DEV"):Target("lib"),
    load("Lp3", "Lp3.Engine.Input", "DEV"):Target("lib"),
    load("Lp3", "Lp3.Engine.Gfx", "DEV"):Target("lib"),
    load("Macaroni", "HxCpp", "DEV"):Target("hxcpp"),
  },
  -- If there was *ONLY* some way to add code to a Haxe generated C++ file
  -- *before* the include, this next part wouldn't be necessary:
  bjamFlags = {
    requirements = [[
      <link>shared:<define>MACARONI_LIB_CREATE_Lp3___MacaroniHaxe___DEV___lib
    ]],
  }
};


local newPath = function(subPath)
    local p = Path.New(getWorkingDirectory())
    return p:NewPathForceSlash(subPath)
end

-- Todo: Put this into a standalone fake Macaroni lib, so HX_BEGIN_MAIN
--       can be properly defined.
lib.Headers[#lib.Headers + 1] = newPath("targethx/include")
--lib.Headers[#lib.Headers + 1] = newPath("C:\\HaxeToolkit\\haxe\\lib\\hxcpp\\3,1,39\\src")
--lib.Headers[#lib.Headers + 1] = newPath("C:\\HaxeToolkit\\haxe\\lib\\hxcpp\\3,1,39\\include")

print(lib.Headers)

local old = generateLess
function generateLess()
    print("DO NOT HANG!")
    --os.execute('haxe -cpp target -debug -D HXCPP_M64 -D no-compilation Turtle')
    os.execute('haxe -cpp targethx -debug -D HXCPP_M64 -D no-compilation -main Turtle')

    --TODO: figure out how to get Haxe to stop doing the whole main thing
    os.execute('del targethx\\src\\__main__.cpp')
    print("phew")
    --local p1 = newPath("target");
    local p2 = newPath("targethx/src");
    local pList = PathList.New()
    --pList[#pList + 1] = p1
    pList[#pList + 1] = p2
    lib:Append({sources=pList});
    for i=1, #project.Targets do
      local e = project.Targets[i]
      print(tostring(i) .. " = " .. tostring(e))
    end
    old()
end
