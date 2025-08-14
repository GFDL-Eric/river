#!/bin/tcsh
set pp_input_files = $1
set pp_exec_path = $2
set pp_out_dir = $3

mkdir -p scratch
cd scratch

echo $#pp_input_files > fort.5
foreach file ($pp_input_files)
   gcp $file .
   echo $file:t >> fort.5
end
echo ""
echo RUN POST-PROCESSOR
cat fort.5
cp_river_vars < fort.5

if ($status != 0) then
    echo ERROR in post-processing, exiting...
    exit
else
    mv *.nc fort.* out.* ${pp_out_dir}/
endif


cd ../
rm -rf scratch

unset pp_out_dir
unset pp_exec_path
unset pp_input_files
