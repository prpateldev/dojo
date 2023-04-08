package ds

type Queue[T any] struct {
	items []T
}

func (q *Queue[T]) Enqueue(item T) {
	q.items = append(q.items, item)
}

// value, true if found and empty value, false if not found
func (q *Queue[T]) Dequeue() (T, bool) {
	size := len(q.items)
	if size == 0 {
		var zeroValue T
		return zeroValue, false
	}
	item, items := q.items[0], q.items[1:]
	q.items = items
	return item, true
}
