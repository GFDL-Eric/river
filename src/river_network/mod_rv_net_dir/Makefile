# Makefile created by mkmf 2022.01.00


MK_TEMPLATE = /work/Eric.Stofferahn/river/compile/river_comp_template
include $(MK_TEMPLATE)


.DEFAULT:
	-echo $@ does not exist.
all: mod_rv_net
mod_river_network.o: ./mod_river_network.f90
	$(FC) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	./mod_river_network.f90
SRC = ./mod_river_network.f90
OBJ = mod_river_network.o
clean: neat
	-rm -f .mod_rv_net.cppdefs $(OBJ) mod_rv_net

neat:
	-rm -f $(TMPFILES)

TAGS: $(SRC)
	etags $(SRC)

tags: $(SRC)
	ctags $(SRC)

mod_rv_net: $(OBJ)
	$(FC) $(OBJ) -o mod_rv_net  $(LDFLAGS)

