package main

import (
	"fmt"
	"reflect"
)
type  oVSDBSchema struct {
	Name string  `mytag:"1"`
	Version string
	Cksum string
}

func main() {
	var s oVSDBSchema
	s.Name="A1"
	s.Version="B2"
	s.Cksum="C3"
        exposeFields(&s)
}

func exposeFields(s interface{}) error {
	v := reflect.ValueOf(s).Elem()

	for  i:=0; i< v.NumField(); i++ {
		filedInfo := v.Type().Field(i)
		fmt.Printf("Filed: %s:%s\n", filedInfo.Name, v.Field(i))
	}

	return nil
}

