package linkedlist;

public class Node<T> {
    public T value;
    public Node<T> next;

    Node(T value) {
        this.value = value;
    }

    public void setNext(Node<T> node) {
        this.next = node;
    }
}
