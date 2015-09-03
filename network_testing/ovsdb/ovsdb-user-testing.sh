# run the following as regular user
#  ovsdb-tool create run/conf.db ./vswitchd/vswitch.ovsschema
#running as root, launch ovsdb from the 'ovs' directory

export OVS_RUNDIR=`pwd`/run
export OVS_LOGDIR=`pwd`/run
export OVS_DBDIR=`pwd`/run
export OVS_SYSCONF=`pwd`/run

OVSDB_SERVER=./ovsdb/ovsdb-server

$OVSDB_SERVER  --detach --no-chdir --pidfile --log-file --remote=punix:"$OVS_RUNDIR"/db.sock --monitor  --user=:sudo 
