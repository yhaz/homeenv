MY_IP=$1
MY_NAME=$2
etcd2 --name $MY_NAME --initial-advertise-peer-urls http://$MY_IP:2380 \
  --listen-peer-urls http://$MY_IP:2380 \
  --listen-client-urls http://$MY_IP:2379,http://127.0.0.1:2379 \
  --advertise-client-urls http://$MY_IP:2379 \
  --initial-cluster-token etcd-cluster-1 \
  --initial-cluster coreos1=http://10.9.0.1:2380,coreos2=http://10.9.0.2:2380,coreos3=http://10.9.0.3:2380 \
  --initial-cluster-state new
