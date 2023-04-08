package main

import (
	"log"

	"github.com/prpateldev/dojo/go/ds"
)

func RunQueueChanExample[T any](values []T) {
	log.Println("running QueueChan example")
	s := ds.QueueChan[T]{
		Items: make(chan T, 5),
	}

	for _, item := range values {
		s.Enqueue(item)
	}

	for {
		item, hasItem := s.Dequeue()
		if !hasItem {
			break
		}
		log.Println(item)
	}

	log.Println("QueueChan example done")
}
