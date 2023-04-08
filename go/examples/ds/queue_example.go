package main

import (
	"log"

	"github.com/prpateldev/dojo/go/ds"
)

func RunQueueExample[T any](values []T) {
	log.Println("running Queue example")
	s := ds.Queue[T]{}

	for _, item := range values {
		s.Enqueue(item)
	}

	for {
		t, hasValue := s.Dequeue()
		if !hasValue {
			break
		}

		log.Println(t)
	}

	log.Println("Queue example done")
}
