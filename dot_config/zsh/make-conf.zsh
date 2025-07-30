# set MAKEFLAGS/Compression threads
THREADS=$(($(nproc)-1))
export MAKEFLAGS="$MAKEFLAGS -j$THREADS"
export COMPRESSXZ=(xz -c -z --threads=$THREADS - )

