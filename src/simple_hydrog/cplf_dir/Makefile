# Makefile created by mkmf 2022.01.00


OTHERFLAGS = -fPIC --shared -c -I$(FMS_incdir) -L$(FMS_libdir) -lFMS $(LDFLAGS) 

MK_TEMPLATE = /work/Eric.Stofferahn/river/compile/river_comp_template
include $(MK_TEMPLATE)


.DEFAULT:
	-echo $@ does not exist.
all: cplf
cr_lake_files.o: ./cr_lake_files.f90
	$(FC) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	./cr_lake_files.f90
SRC = ./cr_lake_files.f90
OBJ = cr_lake_files.o
clean: neat
	-rm -f .cplf.cppdefs $(OBJ) cplf

neat:
	-rm -f $(TMPFILES)

TAGS: $(SRC)
	etags $(SRC)

tags: $(SRC)
	ctags $(SRC)

cplf: $(OBJ)
	$(FC) $(OBJ) -o cplf -I$(FMS_incdir) -L$(FMS_libdir) -lFMS $(LDFLAGS)

