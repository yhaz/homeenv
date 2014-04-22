grep Subject $1/*.mail > subject_line
awk -F[ '{print $3 $1}' < subject_line > filename_patch_num
cat filename_patch_num |sort > sorted
cat -v sorted |sed 's/\^M/\n/g' |egrep '0???\.mail' > sorted_filename
cat sorted_filename | awk -F: '{print $1}'

