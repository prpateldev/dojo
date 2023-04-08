package main

import (
	"log"

	"github.com/prpateldev/dojo/go/ds"
)

func RunTreeExample() {
	log.Println("runnig tree example")
	t := ds.Tree{}

	t.Insert(10).Insert(19).Insert(15).Insert(4).Insert(23).Insert(21)

	ds.PrintNode(t.GetNode())

	log.Println(t.GetNode().Exists(19))

	log.Println("tree example completed")
}
