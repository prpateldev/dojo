package main

import (
	"log"

	"github.com/prpateldev/dojo/go/ds"
)

func RunDoubleLinkedListExample[T any](values []T) {
	log.Println("running DoubleLinkedList example")
	l := ds.DoubleLinkedList[T]{}

	for _, item := range values {
		l.Push(item)
	}

	item := l.Last()
	for {
		log.Println(item.GetValue())
		item = item.GetPrevious()
		if item == nil {
			break
		}
	}

	log.Println("DoubleLinkedList example done")
}
