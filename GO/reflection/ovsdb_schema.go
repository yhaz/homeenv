package main

import (
	"fmt"
	"reflect"
)
type  oVSDBSchema struct {
	Name string  `mytag:"1"`
	Version int
	Cksum  bool
}

type  oVSDBSchemaJSON struct {
	Name *string
	Version *int
	Cksum *bool
}

func CloneValue(s interface{}, d interface{}) {
	x := reflect.ValueOf(s)
	y := reflect.ValueOf(d)
	if  x.Kind() == reflect.Ptr && y.Kind() == x.Kind() && !y.IsNil() {
		y.Elem().Set(x.Elem())
	} else {
		fmt.Printf("Don't know about this type\n")
	}
}

func main() {
	var s oVSDBSchema
        var j oVSDBSchemaJSON
	var v int = 100
	var t bool = true
	var u string = "test"
	j.Name=&u;
	j.Version= &v
	j.Cksum=&t
        exposeFields(&j)
	s.Name="B1"
	s.Version=3
	s.Cksum=false

        exposeFields(&s)
	fmt.Printf("Start CloneValue\n")

	CloneValue(j.Name, &s.Name)
	CloneValue(j.Version, &s.Version)
	CloneValue(j.Cksum, &s.Cksum)
        exposeFields(&s)
}

func exposeFields(s interface{}) error {
	v := reflect.ValueOf(s).Elem()

	for  i:=0; i< v.NumField(); i++ {
		filedInfo := v.Type().Field(i)
		fmt.Printf("Filed: %s: %v\n", filedInfo.Name, v.Field(i))
	}

	return nil
}

