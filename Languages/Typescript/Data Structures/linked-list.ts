console.log("linked list");

class ListNode {
  public data: number | null;
  public next: ListNode | null;
  constructor(data: number) {
    this.data = data;
    this.next = null;
  }
}

class LinkedList {
  public head: ListNode | null;

  constructor(head: ListNode) {
    this.head = head;
  }

  public print() {
    let temp = this.head;
    while (temp !== null) {
      console.log(temp.data);
      temp = temp.next;
    }
  }

  public push(v: number) {
    let temp = this.head;
    if (temp === null) {
      this.head = new ListNode(v);
    }
    while (temp !== null) {
      temp = temp.next;
      if (temp?.next === null) {
        temp.next = new ListNode(v);
        return;
      }
    }
  }

  public unswitch(v: number) {
    let temp = this.head;
    this.head = new ListNode(v);
    this.head.next = temp;
  }
  public insert(value: number, index: number): void {
    const newNode = new ListNode(value);

    if (index === 0) {
      newNode.next = this.head;
      this.head = newNode;
      return;
    }

    let temp = this.head;
    let i = 0;

    while (temp !== null && i < index - 1) {
      temp = temp.next;
      i++;
    }

    if (temp === null) {
      throw new Error("Index out of bounds");
    }

    newNode.next = temp.next;
    temp.next = newNode;
  }
}

const node1 = new ListNode(1);
const node2 = new ListNode(2);
node1.next = node2;
const linked = new LinkedList(node1);
linked.push(4);
linked.unswitch(0);
linked.insert(3, 2);

linked.print();
