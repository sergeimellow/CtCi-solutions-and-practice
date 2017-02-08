###################################################################################
# Bubble sort, sometimes referred to as sinking sort, is a simple sorting         #
# algorithm that repeatedly steps through the list to be sorted, compares each    #
# pair of adjacent items and swaps them if they are in the wrong order. The pass  #
# through the list is repeated until no swaps are needed, which indicates that    #
# the list is sorted. The algorithm, which is a comparison sort, is named for     # 
# the way smaller or larger elements "bubble" to the top of the list. Although    #
# the algorithm is simple, it is too slow and impractical for most problems even  #
# when compared to insertion sort.[1] It can be practical if the input is usually #
# in sorted order but may occasionally have some out-of-order elements nearly in  #
# position.  -Wikipedia                                                           #
###################################################################################
#                                                                                 #
# Pseudocode implementation                                                       #
# The algorithm can be expressed as (0-based array):                              #
#                                                                                 #
# procedure bubbleSort( A : list of sortable items )                              #
#    n = length(A)                                                                #
#    repeat                                                                       #
#      swapped = false                                                            #
#      for i = 1 to n-1 inclusive do                                              #
#        /* if this pair is out of order */                                       #
#        if A[i-1] > A[i] then                                                    #
#          /* swap them and remember something changed */                         #
#          swap( A[i-1], A[i] )                                                   #  
#          swapped = true                                                         #  
#        end if                                                                   #
#      end for                                                                    #
#    until not swapped                                                            #
# end procedure                                                                   #
###################################################################################
# Worst-case performance      O(n^2)
# Best-case performance	      O(n)
# Average performance	      O(n^2)
# Worst-case space complexity O(1)

def bubble_sort array
  n = array.length
  swapped = true
  while swapped == true
    puts array.to_s
    swapped = false
    (1..n-1).each do |i|
      if array[i-1] > array[i]
        # swap( A[i-1], A[i] )
        array[i-1], array[i] = array[i], array[i-1]
        swapped = true
      end
    end
  end
  return array
end
###################################################################################
# Test Example 
arr = []
# unsorted array of length 10 with random numbers between 0-99
10.times{ arr << rand(100) }
puts "unsorted array:" + arr.to_s + "\nsorting in progress..."
arr = bubble_sort(arr)
puts "done\n" + "sorted array:" + arr.to_s
