. env.conf

ovs_vsctl_set_column ()
{
   table=$1
   sel=$2
   column=$3
   value=$4

   if test ! -z "$table" && test ! -z "$sel" \
        && test ! -z "$column" && test ! -z "$value"; then

       ovs-vsctl set "$table" "$sel" "$column"="$value"

   fi 
}

if_dbg ()
{
  if test ! -z "$DEBUG"; then
      $1
  fi
}

if_dbg "ovs-appctl -t ovsdb-server vlog/set ::dbg"

ovs-vsctl set-manager ptcp:$PORT
ovs-appctl -t ovsdb-server ovsdb-server/add-remote db:Open_vSwitch,Open_vSwitch,manager_options
ovs_vsctl_set_column Manager ptcp:$PORT inactivity_probe "$PROBE"
ovs-vsctl list Manager
