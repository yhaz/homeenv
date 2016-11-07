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
	Endpoints:   []string{"localhost:12378", "localhost:22378", "localhost:32378"},
	DialTimeout: 5 * time.Second,
	})
	if err != nil {
	   log.Printf("error")
	}
	defer cli.Close()
}
