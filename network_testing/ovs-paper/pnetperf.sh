

# I take it you want to have N concurrent connections going at the same
# time yes?  With netperf classic (aka netperf2) there is no explicit
# support for multi-session testing.  However, one can often get results
# that are "good enough" by doing something along the lines of:

# for i in 1 2 3 ... N
# do
#	 netperf ... -P 0 -v 0 -i 10 ... &
# done

# The -P 0 shuts-off the test banners, the -v 0 says just report the
# single-figure of merit, and the -i says to repeat the run 10 times.

# If you don't get any confidnece interval warnings, you can ass-u-me that
#	 issues of start/stop skew were minimal.  If you do get confidence
#	 interval warnings, you can increase the -i option as far as 30 and/or
#	 increase the individual data point run times with the -l option until
#	 you do.
#
#	 The "best" thing to do for multiple, concurrent tests is to also start
#	 working with netperf4:
#
#	 http://www.netperf.org/svn/netperf4/trunk

#	 and you would edit its XML ocnfig file accordingly.  Netperf4 has
#	 explicit LOAD, MEASURE etc synchronization in it among other things.
#	 Depends on a reasonably new libxml2 and glib-2.0.  IIRC the libxml2 in
#	 Solaris10 is sufficient, but the glib is not.  See the README.solaris
#	 file for details.

#	 happy benchmarking,

#	 rick jones

mkdir -p /tmp/pnetperf
rm -rf /tmp/pnetperf/*

RUNS=`seq 1 200`
for i in $RUNS 
do
	netperf -H 9.1.1.1 -P 0 -v 0 >/tmp/pnetperf/$i & 
done
sleep 11

SUM="0.0"
for i in $RUNS
do
	n=`cat /tmp/pnetperf/$i`
	SUM=$(echo "$SUM + $n" | bc)
done
echo $SUM



