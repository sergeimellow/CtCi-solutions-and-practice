require 'pp'
require_relative 'singly_linked_list'
# Remove Dups: Write code to remove duplicates from an unsorted linked list.

# FOLLOW UP
# How would you solve this problem if a temporary buffer is not allowed?

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


