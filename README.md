Eonil Library - The "Monolith"
==============================
2014/08/19
Hoon H.



The "Monolith" is name of my all-in-one style framework code 
collection. This is a huge monolithic, multi-platform, multi-
language code collection, and intended to provide all the code
by single link work. Platform, language specific code will be
activated automatically by compiling context, then you don't
need to worry about anything.

Main reason to make this framework is to reduce efforts to link
multiple small libraries, and managing dependencies between 
them. Anyway, each libraries are intentionally separated and 
still can be linked one-by-one. Major benefit of this framework
is quick-starting and convenience, and I think you eventually
switch to link to multiple small libraries when the project 
matures to optimize building process.





How to Build
------------
Select `Monolith - OSX Dynamic Framework` scheme and build.
All Library targets are depending on several script and programs
to place header files correctly, then do not modify build passes
without understanding it.




Submodule Layout
----------------
If a component contains its own submodules they shouldn't
be duplicated. Having multiple source code is explicitly
prohibited, and only one version must be exist in whole source
tree. As a simplest way to do this, any code needs shared 
dependency must be in same repository. Currently, existing 
code are stored in separated repository, but they will be
merged soon into this repository.




Headers
-------
Headers are copied by a manually written custom program to keep the hierarchy.
(writing a shell script is harder than writing and maintaining this program)




Note
----
Do not place any large binary. Currently I have no good idea 
how to handle those large binaries. Then, prebuilt LLDB library
has been excluded.












