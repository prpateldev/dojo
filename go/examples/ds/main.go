package main

import "log"

func main() {
	log.Println("running data structure examples")
	values := []int{1, 2, 3}
	RunLinkedListExample(values)
	RunDoubleLinkedListExample(values)
	RunStackExample(values)
	RunQueueExample(values)
	RunTreeExample()
	log.Println("done data structure examples")
}
