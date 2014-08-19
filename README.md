Eonil Library
=============
2014/08/19
Hoon H.





This is brave trial to make a monolith repository for all of
my reusable code.

This source tree cares only one thing. Version consistency. 
This doesn't care anything else. Total size of this source 
code would grow large as like GBs, and total build time would 
take hours...

Anyway for your convenience, each component libraries are 
currently separated in different repositories. You can 
composite them to build your own *llight-weight* version
compositions.










Submodule Layout
----------------
If a component contains its own submodules they shouldn't
be duplicated. Having multiple source code is explicitly
prohibited, and only one version must be exist in whole source
tree. As a simplest way to do this, any code needs shared 
dependency must be in same repository. Currently, existing 
code are stored in separated repository, but they will be
merged soon into this repository.




Note
----
Do not place any large binary. Currently I have no good idea 
how to handle those large binaries. Then, prebuilt LLDB library
has been excluded.