grep Subject $1/*.mail > subject_line
awk '{print $1 $4}' < subject_line > filename_patch_num
awk -F: '{print $3 " " $1}' < filename_patch_num |sort > sorted
awk '{print $2}' < sorted

