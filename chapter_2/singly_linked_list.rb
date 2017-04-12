# possibly modified but original implementation from:
# https://github.com/careercup/ctci/blob/master/ruby/lib/data-structures/linked-list/node.rb
class Node
  attr_reader :data
  attr_accessor :next, :prev
  def initialize data
    @data = data
    @next = nil
  end
end

# possibly modified but original implemention from:
# https://github.com/careercup/ctci/blob/master/ruby/lib/data-structures/linked-list/singly_linked_list.rb
class SinglyLinkedList
  include Enumerable
  attr_reader :head, :tail
  def initialize head=nil
    @head = @tail = Node.new head unless head.nil?
  end

  def push_bottom node
    @tail = @head = Node.new(node) and return if @head.nil?
    @tail.next = Node.new(node)
    @tail = @tail.next
  end

  def push_top node
    node = Node.new(node)
    @tail = @head = node and return if @head.nil?
    node.next = @head
    @head = node
  end

  def find data
    self.detect {|node| node.data == data }
  end

  def each
    return @head if @head.nil?
    current_node = @head
    until current_node.nil?
      yield current_node
      current_node = current_node.next
    end
  end

  def remove data
    @head = @head.next and return if @head.data == data
    prev = @head
    self.each do |node|
      if node.data == data
        return prev.next = node.next
      end
      prev = node
      node = node.next
    end
  end
end