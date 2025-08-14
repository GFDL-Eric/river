export CPPFLAGS="-I`nc-config --includedir`"
export FCFLAGS="-I`nf-config --includedir`"
export LDFLAGS="`nc-config --libs` `nf-config --flibs`"
export FC="`which gfortran`"
