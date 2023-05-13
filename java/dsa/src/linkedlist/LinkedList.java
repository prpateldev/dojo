package linkedlist;

public class LinkedList<T> {
  private Node<T> head;
  private Node<T> tail;
  private int length;

  public LinkedList(T value) {
    Node<T> newNode = new Node<T>(value);
    this.head = newNode;
    this.tail = newNode;
    this.length = 1;
  }

  public void printList() {
    Node<T> temp = this.head;
    while (temp != null) {
      System.out.println(temp.value);
      temp = temp.next;
    }
  }

  public void printHead() {
    System.out.println("Head: " + this.head.value);
  }

  public void printTail() {
    System.out.println("Tail: " + this.tail.value);
  }

  public void printLength() {
    System.out.println("Length: " + this.length);
  }

  public void append(T value) {
    Node<T> newNode = new Node<T>(value);
    if (this.length == 0) {
      this.head = newNode;
    } else {
      this.tail.setNext(newNode);
    }
    this.tail = newNode;
    this.length++;
  }

  public Node<T> removeLast() {
    if (this.length == 0) return null;
    Node<T> temp = this.head;
    Node<T> pre = this.head;

    while (temp.next != null) {
      pre = temp;
      temp = temp.next;
    }

    this.tail = pre;
    this.tail.next = null;
    this.length--;

    if (this.length == 0) {
      this.tail = null;
      this.head = null;
    }

    return temp;
  }

  public void preAppend(T value) {
    Node<T> newNode = new Node<T>(value);
    if (this.length == 0) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      newNode.next = this.head;
      this.head = newNode;
    }
    this.length++;
  }

  public Node<T> get(int index) {
    if (index < 0 || index >= length) return null;

    Node<T> temp = this.head;
    for (int i = 0; i < index; i++) {
      temp = temp.next;
    }

    return temp;
  }

  public Node<T> removeFirst() {
    if (this.length == 0) return null;
    Node<T> temp = this.head;
    this.head = this.head.next;
    temp.next = null;
    this.length++;

    if (this.length == 0) {
      this.tail = null;
    }

    return temp;
  }

  public boolean set(int index, T value) {
    Node<T> n = this.get(index);
    if (n != null) {
      n.value = value;
      return true;
    }
    return false;
  }

  public boolean insert(int index, T value) {
    if (index < 0 || index > this.length) return false;
    if (index == 0) {
      this.preAppend(value);
      return true;
    }

    if (index == this.length) {
      this.append(value);
      return true;
    }

    Node<T> n = new Node<T>(value);
    Node<T> temp = this.get(index);
    n.next = temp.next;
    temp.next = n;
    this.length++;
    return true;
  }

  public Node<T> remove(int index) {
    if (index < 0 || index >= this.length) return null;
    if (index == 0) return this.removeFirst();
    if (index == this.length - 1) return this.removeLast();

    Node<T> prev = this.get(index - 1);
    Node<T> temp = prev.next;

    prev.next = temp.next;
    temp.next = null;
    this.length--;
    return temp;
  }

  public void reverse() {
    Node<T> temp = this.head;
    this.head = this.tail;
    this.tail = temp;
    Node<T> after = temp.next;
    Node<T> before = null;

    for (int i = 0; i < this.length; i++) {
      after = temp.next;
      temp.next = before;
      before = temp;
      temp = after;
    }
  }
}
