# Environment on PPAN
The system install of netcdf was not working for me, so I created a conda environment to load netcdf, gcc, and gfortran. This entailed the following:

```
module load miniforge
mamba env create -n river
conda activate river
mamba install netcdf-fortran gfortran gcc
```

You can also attempt to install using the enclosed environment.yml as follows:

```
module load miniforge
mamba env create -n river -f environment.yml
```

These steps should allow you to have the environment that will compile and install FMS (a prerequisite to run this code) as well as the executables contained in the src directory in this repository.

# Installation

## FMS

### Use my installation (not guaranteed to work)
You MIGHT be able to get away with using my installation of FMS located here: /home/Eric.Stofferahn/repos/compiled\_FMS\_conda

### Install your own

Set some environmental flags:

`source set\_env\_flags.{c,ba}sh` 

Clone the FMS repository via https or ssh:

`git clone https://github.com/NOAA-GFDL/FMS.git` #https
`git clone github:NOAA-GFDL/FMS.git` #ssh assuming you have a "github" entry in your .ssh/config

Navigate to the FMS directory `cd FMS` and run the tool `autoreconf -fi`
Create a build directory with `mdkir -p build` and navigate to it with `cd build`
Configure, make, and make install:

```
../configure --with-mpi=no --prefix=<path_to_fms_installation> #I installed to my home directory but it should work anywhere
make
make install
```

Make a note of your \<path\_to\_fms\_installation\> as you will need it to install the river executables

## River Executables

This repo should already contain the executables in the `exec` subdirectory, but if they don't or you need to rebuild with new netcdf versions (or a new FMS installation), here's how that should work:

Ensure that you have loaded the river conda environment and navigate to the `compile` subdirectory, then run:
```
bash compile.main
```

That should recompile the source code in the `src` subdirectory and prompt you to overwrite the executables that are in the `exec` subdirectory (press `y` to overwrite).
You can also navigate to the source directories to make changes to either the Makefile or source .f90 files, but proceed with extreme caution.

# Running the Code

This repository takes a provided grid\_spec, several input data files, and produces 6 river\_network hydrography files in netcdf format (1 per cubed sphere tile).
To accomplish this, there are several scripts in the `run` subdirectory that utilize both the compiled executables and those found in the fre-nctools package on PPAN.
Note that one of the tools available in fre-nctools (cr\_lake\_files) did not function as expected, so it is one of the provided executables in this repo (as `cplf`).

List of fre-nctools executables:

- river\_regrid
- cp\_river\_vars
- rmv\_parallel\_rivers

List of compiled executables included in this repo:

- simple\_hydrog/cplf
- lake/cpel
- lake/addlakes
- river\_network/mod\_rv\_net
- river\_network/slope_fields

To run this code, you will have to provide a mosaic directory. A sample can be found here: /work/ejs/river/cm5\_mosaic.
Copy your mosaic files to a directory named <mygrid>\_mosaic (e.g. c384om5\_mosaic or c192o12\_mosaic [for 12th degree ocean]).

Next, navigate to the `run` subdirectory and open up the `run.setup` file. You will notice several variables set here, including some hardcoded paths.
The first thing to change will be your mosaic variable. Use `set mosaic = <mygrid>` where <mygrid> is what you defined earlier.
You will also want to change the `river_dir` to its current location and the `FMS_dir` to the FMS installation location.
That should be it for changes, go ahead and save that file and exit the text editor.
Next, you will want to run the program. Ensure the following:

- You are in csh or tcsh (you could try to change the instructions for bash but that is untested)
- You have the river conda environment enabled
- You have the appropriate flags loaded with `source ../set_env_flags.csh` (this may have been loaded already if you did any installation)

You're all set... go ahead and do `source run.main <test_name>` where <test\_name> is a unique identifier (I usually use test\_MMDDYY for today's date)
This shouldn't have a permanent impact on your environmental variables (there's a lot of setting and unsetting of variables in the code).
If that's a big concern you can always start a new tcsh shell even if you are already in tcsh.

# Analyzing output

Your output will be in the `run/output/<my_grid>/<test_name>` directory. The final output of river\_network hydrography files should be in the `slope_fields/` subdirectory of that output, and intermediate files should be in the other subdirectories.
If you'd like to know how a specific test output compares to another one on the same grid (e.g. if you changed an executable or one of the input files), you can use the `compare_output` command in the main repository directory.
You can compare between two of your own runs, or if you'd like to compare to a reference output, the current hydrography files for ESM4.5 are available here: /work/ejs/river/run/output/cm5/esm45noij

## Final Notes

You can tar up the river\_network files to use in a model, but you have to rename them to river\_data.tile?.nc first.

This repo has only really been tested with the c96 "lake\_zigzag" data file. It is possible that other files could work.
The files aren't easy to find, but here is a potential sample for a 3km grid: `/home/kap/lmdt/river_network/input/dat.mod_river_network.C3072_c3072_cm4.lake_flow.28oct2015.9`
Other files in that directory may also help depending on your resolution. You can use the following search parameter in vim: `/\d\+\.\?\(\d\+\)\?\s*[A-Za-z]`
