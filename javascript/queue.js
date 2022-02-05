class Node {
  constructor(data = null, next = null) {
    this.data = data;
    this.next = next;
  }
}

class Queue {
  constructor(front = null) {
    this.front = front;
    this.rear = front;
  }

  // ADD NODE TO BACK OF QUEUE
  // USE DATA TO CREATE A NEW NODE AND ADD IT TO THE QUEUE
  enqueue(data) {
    const newNode = new Node(data)

    if(this.rear !== null){
      this.rear.next = newNode
      this.rear = newNode
    } else {
      this.front = newNode
      this.rear = newNode
    }
  }

  // REMOVE NODE FROM FRONT OF QUEUE AND RETURN IT
  dequeue() {
    let oldFront

    if(this.front && this.front.next){
      oldFront = this.front
      this.front = oldFront.next
    } else if (this.front && !this.front.next) {
      oldFront = this.front
      this.front = null
      this.rear = null
    } else {
      oldFront = null
      this.rear = null
    }

    return oldFront
  }

  // RETURN NODE AT FRONT WITHOUT REMOVING IT
  peek() {
    return this.front
  }

  // RETURN TRUE IF QUEUE IS EMPTY, OTHERWISE FALSE
  isEmpty() {
    return !this.front
  }

  // RETURN NUMBER OF NODES IN QUEUE, E.G. 10
  size() {
    return this.sizeHelper(this.front)
  }

  sizeHelper(node, count=0){
    if(node === null){
      return count
    }

    return this.sizeHelper(node.next, count + 1)
  }

  // RETURN INTEGER REPRESENTING HOW FAR TARGET IS FROM FRONT OF QUEUE
  // IF TARGET ISN'T IN QUEUE, RETURN -1
  search(target) {
    return this.searchHelper(this.front, target)
  }

  searchHelper(node, target, count=0){
    if(!node){
      return -1
    } else if (node.data === target){
      return count
    } else {
      return this.searchHelper(node.next, target, count + 1)
    }
  }
}

if (require.main === module) {
  // add your own tests in here
 
  const queue = new Queue()

  queue.enqueue("first")
  console.log('Expecting: Node { data: "first", next: null }')
  console.log(queue.front)

  console.log('')

  console.log('Expecting: Node { data: "first", next: null }')
  console.log(queue.dequeue())
  console.log('Expecting: null')
  console.log(queue.first)

  console.log('')

  queue.enqueue("first")
  console.log('Expecting: Node { data: "first", next: null }')
  console.log(queue.peek())

  console.log('')



}

module.exports = {
  Node,
  Queue
};

// Write your Big O findings here

// Optional: Please add your pseudocode to this file
// Optional: And a written explanation of your solution
