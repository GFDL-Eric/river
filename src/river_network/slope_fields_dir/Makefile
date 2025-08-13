# Makefile created by mkmf 2022.01.00


MK_TEMPLATE = /work/Eric.Stofferahn/river/compile/river_comp_template
include $(MK_TEMPLATE)


.DEFAULT:
	-echo $@ does not exist.
all: slope_fields
cp_slope_fields.o: ./cp_slope_fields.f90
	$(FC) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	./cp_slope_fields.f90
SRC = ./cp_slope_fields.f90
OBJ = cp_slope_fields.o
clean: neat
	-rm -f .slope_fields.cppdefs $(OBJ) slope_fields

neat:
	-rm -f $(TMPFILES)

TAGS: $(SRC)
	etags $(SRC)

tags: $(SRC)
	ctags $(SRC)

slope_fields: $(OBJ)
	$(FC) $(OBJ) -o slope_fields  $(LDFLAGS)

