package ds

type QueueChan[T any] struct {
	Items chan T
}

func (q *QueueChan[T]) Enqueue(item T) {
	q.Items <- item
}

func (q *QueueChan[T]) Dequeue() (T, bool) {
	totalItems := len(q.Items)
	if totalItems == 0 {
		var zv T
		return zv, false
	}
	item := <-q.Items
	return item, true
}
