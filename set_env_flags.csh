setenv CPPFLAGS "-I`nc-config --includedir`"
setenv FCFLAGS "-I`nf-config --includedir`"
setenv LDFLAGS "`nc-config --libs` `nf-config --flibs`"
setenv FC "`which gfortran`"
