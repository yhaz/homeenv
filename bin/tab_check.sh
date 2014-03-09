
for i in $*;
do
  cat $1 | expand - > $i.expanded
  diff $i $i.tab.expanded
  rc=$?
  rm -rf $i.tab.expanded
  if [[ $rc != 0 ]]; then
	 exit $rc
  fi
done
 
