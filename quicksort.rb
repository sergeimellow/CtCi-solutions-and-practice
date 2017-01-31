# Quicksort (sometimes called partition-exchange sort) is an efficient sorting
# algorithm, serving as a systematic method for placing the elements of an
# array in order. Developed by Tony Hoare in 1959, with his work published
# in 1961, it is still a commonly used algorithm for sorting. When implemented
# well, it can be about two or three times faster than its main competitors,
# merge sort and heapsort.  - Wikipedia
###############################################################################
# Algorithm: 
# Quicksort is a divide and conquer algorithm. Quicksort first divides a large
# array into two smaller sub-arrays: the low elements and the high elements.
# Quicksort can then recursively sort the sub-arrays.
###############################################################################
# Algorithm steps:

# 1) Pick an element, called a pivot, from the array.

# 2) Partitioning: reorder the array so that all elements with values less than
#    the pivot come before the pivot, while all elements with values greater
#    than the pivot come after it (equal values can go either way). After this
#    partitioning, the pivot is in its final position. This is called the
#    partition operation.
#
# 3) Recursively apply the above steps to the sub-array of elements with
#    smaller values and separately to the sub-array of elements with greater
#    values.
###############################################################################
# The base case of the recursion is arrays of size zero or one, which never
# need to be sorted.
# The pivot selection and partitioning steps can be done in several different
# ways; the choice of specific implementation schemes greatly affects the
# algorithm's performance.

# Pseudo Code:

# algorithm quicksort(A, lo, hi) is
#  if lo < hi then
#        p := partition(A, lo, hi)
#        quicksort(A, lo, p)
#        quicksort(A, p + 1, hi)

# algorithm partition(A, lo, hi) is
#   pivot := A[hi]
#   i := lo     // place for swapping
#   for j := lo to hi – 1 do
#     if A[j] ≤ pivot then
#       swap A[i] with A[j]
#       i := i + 1
#   swap A[i] with A[hi]
#   return i

# Sorting the entire array is accomplished by quicksort(A, 1, length(A)).

# (WIP) Ruby implementation of quicksort
def quicksort(array, lo, hi)
  # TODO: programmer golf solution
  # array. >= 2 ? quicksort(array[0..(array.length/2).floor]) + quicksort(array[(array.length/2).floor..array.length]) : ret + array[0]
  #puts 'quicksort:~~~~~~~~~~~~~~~~'
  #puts array.to_s
  #puts lo
  #puts hi
  #puts '~~~~~~~~~~~~~~~~~~~~~~~~~~'
  if lo < hi
    p = partition(array, lo, hi)
    quicksort(array, lo, p - 1)
    quicksort(array, p + 1, hi)
  end
  return array 
end

def partition(array, lo, hi)
  pivot = array[hi]
  i = lo
  (lo..hi-1).each_with_index do |j|
    #puts 'Parition:~~~~~~~~~~~~~~~~'
    #puts array.to_s
    #puts lo
    #puts hi
    #puts j
    #puts '~~~~~~~~~~~~~~~~~~~~~~~~~'
    if array[j] <= pivot
      # swap A[i] with A[j]
      array[i], array[j] = array[j], array[i]
      i = i + 1
    end
  end
  # swap A[i] with A[hi]
  array[i], array[hi] = array[hi], array[i]
  return i
end

test_array_1 = [11, 22, -11, 55, 444, -111, 2000, -100, 1]
# print original array
puts "Original Array:" 
puts test_array_1.to_s
# solution
puts "Sorted Array:"
puts quicksort(test_array_1, 0, test_array_1.length - 1).to_s

