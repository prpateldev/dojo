import linkedlist.LinkedList;

// Press ⇧ twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
  public static void main(String[] args) {
    // Press ⌥⏎ with your caret at the highlighted text to see how
    // IntelliJ IDEA suggests fixing it.
    System.out.print("Running data structures and algorithm examples");

    LinkedList<Integer> ll = new LinkedList<Integer>(23);
    ll.printHead();
    ll.preAppend(5);
    ll.printList();
    ll.printTail();

    ll.append(32);
    ll.append(41);

    ll.printList();

    ll.reverse();
    ll.printList();
  }
}
