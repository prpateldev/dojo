package main

import (
	"log"

	"github.com/prpateldev/dojo/go/ds"
)

func RunStackExample[T any](values []T) {
	log.Println("running Stack example")
	s := ds.Stack[T]{}

	for _, item := range values {
		s.Push(item)
	}

	for {
		t, hasMore := s.Pop()
		if !hasMore {
			break
		}

		log.Println(t)
	}

	log.Println("Stack example done")
}
