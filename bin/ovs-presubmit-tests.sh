
cmd_ok()
{
   echo "running $1"
   $1
   rc=$?
   if [[ $rc != 0 ]]; then 
	   echo "presubmit Failed: $*"
	   exit $rc
   fi
}

cmd_no_warnings()
{
   cmd_return_0 $1 | grep -i warning  > /tmp/warnings
   lines= `wc -l /tmp/warnings` |awk '{print $1}'
   if [ $lines != 0 ]
   then
	cat /tmp/warnings
	exit -1
   fi
} 

cmd_ok 'v conf'
cmd_ok 'make -j8 check'
cmd_ok 'make clean'
cmd_no_warnings 'make -j8 C=1'
cmd_ok './configure CC=clang'
cmd_ok 'make -j8'
cmd_ok 'patch-tab-check.sh 00??*'
