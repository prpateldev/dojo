package ds

type DLLNode[T any] struct {
	value    T
	next     *DLLNode[T]
	previous *DLLNode[T]
}

func (n *DLLNode[T]) SetValue(value T) {
	n.value = value
}

func (n *DLLNode[T]) SetNext(node *DLLNode[T]) {
	n.next = node
}

func (n *DLLNode[T]) SetPrevious(node *DLLNode[T]) {
	n.previous = node
}

func (n *DLLNode[T]) GetValue() T {
	return n.value
}

func (n *DLLNode[T]) GetNext() *DLLNode[T] {
	return n.next
}

func (n *DLLNode[T]) GetPrevious() *DLLNode[T] {
	return n.previous
}

type DoubleLinkedList[T any] struct {
	head *DLLNode[T]
	tail *DLLNode[T]
}

func (l *DoubleLinkedList[T]) First() *DLLNode[T] {
	return l.head
}

func (l *DoubleLinkedList[T]) Last() *DLLNode[T] {
	return l.tail
}

func (n *DLLNode[T]) Next() *DLLNode[T] {
	return n.next
}

func (n *DLLNode[T]) Previous() *DLLNode[T] {
	return n.previous
}

func (l *DoubleLinkedList[T]) Push(value T) {
	node := &DLLNode[T]{value: value}
	if l.head == nil {
		l.head = node
	} else {
		l.tail.next = node
		node.previous = l.tail
	}

	l.tail = node
}
