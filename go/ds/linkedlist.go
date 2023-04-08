package ds

type Node[T any] struct {
	value T
	next  *Node[T]
}

func (n *Node[T]) SetValue(value T) {
	n.value = value
}

func (n *Node[T]) SetNext(node *Node[T]) {
	n.next = node
}

func (n *Node[T]) GetValue() T {
	return n.value
}

func (n *Node[T]) GetNext() *Node[T] {
	return n.next
}

type LinkedList[T any] struct {
	head *Node[T]
	tail *Node[T]
}

func (l *LinkedList[T]) First() *Node[T] {
	return l.head
}

func (l *LinkedList[T]) Last() *Node[T] {
	return l.tail
}

func (n *Node[T]) Next() *Node[T] {
	return n.next
}

func (l *LinkedList[T]) Push(value T) {
	node := &Node[T]{value: value}
	if l.head == nil {
		l.head = node
	} else {
		l.tail.next = node
	}

	l.tail = node
}
