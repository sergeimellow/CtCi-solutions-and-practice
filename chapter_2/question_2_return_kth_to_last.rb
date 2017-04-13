require 'pp'
require_relative 'singly_linked_list'

# Return Kth to Last: Implement an algorithm to find the kth to last element of a singly linked list.

def kth_to_last(linked_list, kth)
  size = 0
  arr = []
  linked_list.each do |head|
    size += 1
    arr << head
  end
  index =  (size-1) - kth
  arr[index]
end

# randomly generated linked list
random_link_list = SinglyLinkedList.new(1)
# generate a random linked list with 10 elements
10.times do |x|
  random_link_list.push_bottom(rand(1..5))
end
puts "randomly generated linked list"
pp random_link_list
kth = rand(0..10)
puts "returning #{kth} to last element:"
pp kth_to_last(random_link_list, kth)
