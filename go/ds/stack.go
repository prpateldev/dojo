package ds

import "log"

type NilGeneric[T any] interface {
}

type Stack[T any] struct {
	items []T
}

func (s *Stack[T]) Push(item T) {
	s.items = append(s.items, item)
}

// Pop returns value and has more vlaues as boolean to check while doing pop
func (s *Stack[T]) Pop() (T, bool) {
	left := len(s.items)
	log.Println("Left is ", left)
	if left == 0 {
		var zeroValue T
		return zeroValue, false
	}

	item, items := s.items[left-1], s.items[0:left-1]
	s.items = items
	return item, true
}
