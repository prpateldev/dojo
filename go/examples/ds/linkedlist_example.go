package main

import (
	"log"

	"github.com/prpateldev/dojo/go/ds"
)

func RunLinkedListExample[T any](values []T) {
	log.Println("running LinkedList example")
	l := ds.LinkedList[T]{}

	for _, item := range values {
		l.Push(item)
	}

	item := l.First()
	for {
		log.Println(item.GetValue())
		if item.GetNext() == nil {
			break
		}

		item = item.GetNext()
	}

	log.Println("LinkedList example done")
}
