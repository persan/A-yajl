#!/usr/bin/python
import os
import glob
import subprocess
from os.path import *
files=["yajl/yajl_common.h",
      "yajl/yajl_gen.h",
      "yajl/yajl_parse.h",
      "yajl/yajl_version.h"]
renames=[
["yajl_yajl_common_h","libYajl.common_h"],
["yajl_yajl_gen_h","libYajl.gen_h"],
["yajl_yajl_parse_h","libYajl.parse_h"],
["yajl_yajl_version_h","libYajl.version_h"]]

def gen(src):
    f=file("gen.c","w")
    f.write("#include <%s>\n" % src)
    f.close()
    subprocess.call(["g++","-c","-fdump-ada-spec","gen.c"])

for i in files:
    gen(i)

buffer="""package libYajl is
end libYajl;
"""

for i in glob.glob("*.ads"):
    f=file(i)
    buffer=buffer+f.read()
    f.close()
    os.remove(i)
    
for i in renames:
    buffer=buffer.replace(i[0],i[1])
# buffer="\n".split(buffer)    
f=file("src.ada","w")
f.write(buffer)
f.close()

if not exists("src"):
    os.mkdir("src")
subprocess.call(["gnatchop","-w","-gnat05","src.ada","src"])
subprocess.call(["rm","src.ada","gen.c","gen.o"])
    
    
