// set up
// export GOPATH=/home/azhou/projs/etcd/gopath:/home/azhou/go
package main

import (
	"github.com/coreos/etcd/clientv3"

	"log"
	"time"
)

func main() {
	cli, err := clientv3.New(clientv3.Config{
		Endpoints:   []string{"localhost:2379"},
		DialTimeout: 5 * time.Second,
	})
	if err != nil {
		log.Printf("error")
	}
	log.Printf("connected")
	defer cli.Close()

	ops := []clientv3.Op{
		clientv3.OpPut("put-key", "123"),
		clientv3.OpGet("put-key"),
		clientv3.OpPut("put-key", "435"),
		clientv3.OpPut("message", "test"),
	}

	for _, op := range ops {
		if _, err := cli.Do(context.TODO(), op); err != nil {
			log.Fatal(err)
		}
	}
	log.Printf("done")
}
