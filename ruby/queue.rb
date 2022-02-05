class Node
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class Queue
  attr_reader :front, :rear

  def initialize(front = nil)
    @front = front
    @rear = front
  end

  # ADD NODE TO BACK OF QUEUE
  # USE DATA TO CREATE A NEW NODE AND ADD IT TO THE QUEUE
  def enqueue(data) 
    new_node = Node.new(data)
    if @rear !=nil
      @rear.next_node = new_node
      @rear = new_node
    else
      @front = new_node
      @rear = new_node
    end
  end

  # REMOVE NODE FROM FRONT OF QUEUE AND RETURN IT
  def dequeue
    first = @front
    
    if @front != nil && @front.next_node != nil
      @front = @front.next_node
    else
      @front = nil
      @rear = nil
    end

    first
  end

  # RETURN NODE AT FRONT WITHOUT REMOVING IT
  def peek
    @front
  end

  # RETURN TRUE IF QUEUE IS EMPTY, OTHERWISE FALSE
  def isEmpty
    @front == nil
  end

  # RETURN NUMBER OF NODES IN QUEUE, E.G. 10
  def size
    size_helper(@front)
  end

  def size_helper(node, counter=0)
    if node == nil
      return counter
    end

    return size_helper(node.next_node, counter + 1)
  end

  # RETURN INTEGER REPRESENTING HOW FAR TARGET IS FROM FRONT OF QUEUE
  # IF TARGET ISN'T IN QUEUE, RETURN -1
  def search(target) 
    search_helper(@front, target)
  end

  def search_helper(node, target, counter=0)
    if node == nil
      return -1
    elsif node.data == target
      return counter
    else 
      return search_helper(node.next_node, target, counter + 1)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  # Add your own tests in here
  queue = Queue.new

  queue.enqueue("first")
  puts 'Expecting: Node, data: first, next_node: nil'
  print queue.front
  puts
  print queue.front.data
  puts
  print queue.front.next_node

  puts
  puts

  puts 'Expecting: Node, data: first, next: nil'
  print queue.rear
  puts
  print queue.rear.data
  puts
  print queue.rear.next_node

  puts
  puts

  puts 'Expecting: Node, data: first, next: nil'
  print queue.dequeue
  puts
  puts 'Expecting: true'
  print !queue.front

  puts
  puts

  queue.enqueue("new_front")
  puts 'Expecting: Node, data: new_front, next_node: nil'
  print queue.front

  puts

  
end

# Write your Big O findings here

# Optional: Please add your pseudocode to this file
# Optional: And a written explanation of your solution
