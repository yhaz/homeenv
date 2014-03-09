
filterout_tab_expected_files()
{
    filterdiff --exclude='*.mk' --exclude='*/datapath/*' $1
}

tab_check_patch_file()
{
	f=$1
	p=$f.plus_only
	o=$f.tab_expanded

	filterout_tab_expected_files $f | grep ^+ - > $p
	cat $p |expand - > $o
	diff $p $o
	rc=$?
	rm -rf $o $p
	return $rc
}

ret=0

for i in 00??-*;
do
	tab_check_patch_file $i
	rc=$?
	if [[ $rc != 0 ]]; then
		ret=-1
		echo "$i: Tab charater is found, return code $rc"
	fi
done

exit $ret

