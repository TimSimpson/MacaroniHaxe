Macaroni Haxe Support
=====================
This project allows Haxe code to be mixed with delicious Macaroni.

Usage
-----
Enter the directory HxCppBjam and install it using "macaroni -i". This will
create a Boost Build file with all the stuff Haxe's HxCpp library needs. Note
you may need to patch HxCpp first (see below *).

Next, attempt to run the Test file.

* You may need to add some lines to HxCpp. See this project for details:
    https://github.com/TimSimpson/BjamHaxe

TODOS: The path to HxCpp is currently hard coded. The plan is to add some kind
       of check for this later.
