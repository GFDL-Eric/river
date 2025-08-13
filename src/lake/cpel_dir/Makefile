# Makefile created by mkmf 2022.01.00


OTHERFLAGS = -fPIC --shared -c -I/home/Eric.Stofferahn/repos/compiled_FMS_conda/include -L/home/Eric.Stofferahn/repos/compiled_FMS_conda/lib -lFMS $(LDFLAGS) 

MK_TEMPLATE = /work/Eric.Stofferahn/river/compile/river_comp_template
include $(MK_TEMPLATE)


.DEFAULT:
	-echo $@ does not exist.
all: cpel
cp_elev_hzint.o: ./cp_elev_hzint.f90 param.h
	$(FC) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c 	./cp_elev_hzint.f90
SRC = ./cp_elev_hzint.f90 param.h
OBJ = cp_elev_hzint.o
clean: neat
	-rm -f .cpel.cppdefs $(OBJ) cpel

neat:
	-rm -f $(TMPFILES)

TAGS: $(SRC)
	etags $(SRC)

tags: $(SRC)
	ctags $(SRC)

cpel: $(OBJ)
	$(FC) $(OBJ) -o cpel -I/home/Eric.Stofferahn/repos/compiled_FMS_conda/include -L/home/Eric.Stofferahn/repos/compiled_FMS_conda/lib -lFMS $(LDFLAGS)

