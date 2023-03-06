windres pwct.rc -O coff -o pwct.res
g++ pwct.c pwct.res -mwindows -static -static-libgcc -static-libstdc++