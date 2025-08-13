# Makefile created by mkmf 2022.01.00

OTHERFLAGS = -fPIC --shared -c -I/home/Eric.Stofferahn/repos/compiled_FMS_conda/include -L/home/Eric.Stofferahn/repos/compiled_FMS_conda/lib -lFMS $(LDFLAGS) 

MK_TEMPLATE = /work/Eric.Stofferahn/river/compile/river_comp_template
include $(MK_TEMPLATE)


.DEFAULT:
	-echo $@ does not exist.
all: addlakes
add_lake_data.o: ./add_lake_data.f90 param.h
	$(FC) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c 	./add_lake_data.f90
SRC = ./add_lake_data.f90 param.h
OBJ = add_lake_data.o
clean: neat
	-rm -f .addlakes.cppdefs $(OBJ) addlakes

neat:
	-rm -f $(TMPFILES)

TAGS: $(SRC)
	etags $(SRC)

tags: $(SRC)
	ctags $(SRC)

addlakes: $(OBJ)
	$(FC) $(OBJ) -o addlakes -I/home/Eric.Stofferahn/repos/compiled_FMS_conda/include -L/home/Eric.Stofferahn/repos/compiled_FMS_conda/lib -lFMS $(LDFLAGS)

