Path = require "Macaroni.IO.Path"


project = context:Group("Macaroni")
                 :Project("HxCpp")
                 :Version("DEV");
lib = project:Library{
    name="hxcpp",
    shortName="hxcpp",
    headers=pathList2{ Path.New("C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/include") },
    sources=pathList{},
    dependencies={},
    excludeFiles=pathList{},
};

local bjam = plugins:Get("BoostBuild2")

local BJAM_CONTENT=[[
# This project shows how to use Haxe to add code to an existing C++ app.
# The tricky part is compiling the associated Haxe stuff correctly.

import boost ;
import path ;
using testing ;

boost.use-project 1.55 ;

lib         user32_lib
    :
    :       <name>User32
    ;

lib         zlib_lib
    :
    :       <name>zlib
    ;

project Macaroni___HxCpp___DEV
    :   requirements
            # Haxe stuff
            # This is all from the Haxe libraries needed by any project using
            # Haxe (I assume)
            <include>C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/include
            <include>C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3
            <define>HX_WINDOWS
            <define>HX_UNDEFINE_H       # Failure to set this leads to errors when the string class is included.
            <define>HXCPP_SCRIPTABLE
            <define>NOMINMAX
            <define>HXCPP_VISIT_ALLOCS  # Failure to include this leads to a lack of a "__Visit" function on objects
    :   usage-requirements
        <include>C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/include
        <link>shared:<define>HXCPP_DLL_IMPORT
        <define>HXCPP_SCRIPTABLE
        <define>HXCPP_VISIT_ALLOCS
    ;


###############################################################################
#        Base Haxe
#
#             Anything you generate will need this.
###############################################################################
obj Array
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/Array.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;

obj Class
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/Class.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Dynamic
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/Dynamic.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Enum
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/Enum.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Math
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/Math.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj String
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/String.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Anon
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Anon.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Cppia
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Cppia.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Debug
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Debug.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Hash
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Hash.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Scriptable
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Scriptable.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Boot
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Boot.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj CppiaBuiltin
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/CppiaBuiltin.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj GC
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/GC.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Interface
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Interface.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Object
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Object.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj StdLibs
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/StdLibs.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj CFFI
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/CFFI.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Date
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Date.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj GCInternal
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/GCInternal.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Lib
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Lib.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;
obj Thread
    :   C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/src/hx/Thread.cpp
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;


alias HaxeSources
    :   Array
        Class
        Dynamic
        Enum
        #ExampleMain
        Math
        String
        Anon
        Boot  #<-- I'M WATCHING YOU
        Cppia
        Debug
        Hash
        #NekoAPI
        Scriptable
        #Boot
        CppiaBuiltin
        GC
        Interface
        Object
        StdLibs
        CFFI
        Date
        GCInternal
        Lib
        #RunLibs
        Thread

        # RunLibs is problematic. When compiling a DLL including it leads to
        # linking errors. But then the Haxe generated code needs it.
    :   <link>shared:<define>HXCPP_DLL_EXPORT
    ;

alias HaxeSourcesStatic
    :   HaxeSources
        #Boot
    ;




lib zlib
        :       C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/libs/zlib/ZLib.cpp
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/adler32.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/compress.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/crc32.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/deflate.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/gzio.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/infback.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/inffast.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/inflate.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/inftrees.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/trees.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/uncompr.c
                C:/HaxeToolkit/haxe/lib/hxcpp/3,1,39/project/thirdparty/zlib-1.2.3/zutil.c

        ;



lib hxcpp
    : HaxeSources
      zlib
      user32_lib
    : <link>shared
    ;

lib hxcpp
    : HaxeSourcesStatic
      zlib
      user32_lib
    : <link>static
    ;
]]


function install()
    local outputPath = filePath("target");
    local jamrootJam = outputPath:NewPath("/Jamroot.jam");
    local writer = jamrootJam:CreateFile();
    writer:WriteLine(BJAM_CONTENT);
    bjam:Run("Build", {
        jamroot=jamrootJam,
        projectVersion=project,
        output=output
        })
    sinstall(project, filePath("./"));
end
