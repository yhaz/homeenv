package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	readFile(os.Args[1])
}

func readFile(fn string) error {
	if data, err := ioutil.ReadFile(fn); err != nil {
		return err
	} else {
		fmt.Printf("%s", data)
	}

	return nil
}
