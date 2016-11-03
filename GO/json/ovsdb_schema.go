package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
)

func main() {
	readSchemaFile(os.Args[1])
}

func readFile(fn string) error {
	if data, err := ioutil.ReadFile(fn); err != nil {
		return err
	} else {
		fmt.Printf("%s", data)
	}

	return nil
}

type  oVSDBSchema struct {
	Name string 
	Version string
	Cksum string
}

func readSchemaFile(fn string) error {
	file, err := ioutil.ReadFile(fn)
	if err != nil {
		return err
	}

	var s oVSDBSchema
	if err := json.Unmarshal(file, &s); err != nil {
		log.Fatalf("Json unmarshaling failed: %s", err)
	}
	fmt.Printf("Results: %s, %s, %s\n", s.Name, s.Version, s.Cksum);

	return nil
}
