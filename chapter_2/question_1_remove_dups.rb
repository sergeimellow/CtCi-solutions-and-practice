require 'pp'

# Remove Dups: Write code to remove duplicates from an unsorted linked list.

# FOLLOW UP
# How would you solve this problem if a temporary buffer is not allowed?

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

# started implementing linked list then grabbed an existing implementation...
# class Node
#   attr_accessor :node, :next
#   def initialize(node)
#     @node = node
#   end
#   def self.last(node)
#     return node if node.next.nil?
#     node = last(node.next)
#   end
# end

# initial solution
def remove_dups_with_buffer(linked_list)
  dup_arr = []
  prev_node = nil
  linked_list.each do |head|
    if dup_arr.include? head.data
      prev_node.next = head.next
    else
      dup_arr.push(head.data)
      prev_node = head
    end
  end
  linked_list
end

# follow up question solution
def remove_dups_no_buffer(linked_list)
  cur = linked_list.head;
  while cur != nil
    # Remove all future nodes that have the same value
    enum = cur
    while enum.next != nil do
      if enum.next.data == cur.data
        enum.next = enum.next.next
      else
       enum = enum.next
      end
    end
    cur = cur.next
  end
end

# test linked list data for initial solution
test_input_1 = SinglyLinkedList.new(1)
# generate a random linked list with 10 elements
10.times do |x|
  test_input_1.push_bottom(rand(1..5))
end

# test linked list data for follow up solution
test_input_2 = test_input_1.dup

# initial problem
# puts "list before using buffer:"
# pp test_input_1
# test_input_1 = remove_dups_with_buffer(test_input_1)
# puts "list after using buffer:"
# pp test_input_1

# follow up
puts "list before using no buffer:"
pp test_input_2
remove_dups_no_buffer(test_input_2)
puts "list after using no buffer:"
pp test_input_2

