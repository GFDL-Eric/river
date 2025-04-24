#!/bin/tcsh
mkdir -p tmp_pp
cd tmp_pp
cp ${src_dir}/cp_river_vars.f90 .
mkmf -p cp_rvar_tmp -t ${comp_template}
gmake
rm -f ${exec_dir}/simple_hydrog/cp_rvar_tmp_bak 
mv ${exec_dir}/simple_hydrog/cp_rvar_tmp ${exec_dir}/simple_hydrog/cp_rvar_tmp_bak
cp cp_rvar_tmp ${exec_dir}/simple_hydrog/
cd ../
rm -rf tmp_pp
