# require 'pry'
# require 'pry-byebug'
# Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4
# bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

# rotate N by N matrix clockwise
def rotate_matrix(n_by_n_matrix)
  # largest index
  n = n_by_n_matrix.first.count - 1
  half_of_n = (n_by_n_matrix.first.count/2).floor
  half_of_n.times do |c| # c = cycle
    v = n-(c*2) # v = vars to rotate
    v.times do |r| # r = rotation
      n_by_n_matrix[c][c+r], n_by_n_matrix[v+c-r][c] = n_by_n_matrix[v+c-r][c], n_by_n_matrix[c][c+r]
      n_by_n_matrix[v+c-r][c], n_by_n_matrix[v+c][v+c-r] = n_by_n_matrix[v+c][v+c-r], n_by_n_matrix[v+c-r][c]
      n_by_n_matrix[v+c][v+c-r], n_by_n_matrix[c+r][v+c] = n_by_n_matrix[c+r][v+c], n_by_n_matrix[v+c][v+c-r]
    end
  end
  n_by_n_matrix
end

# 1 pixel = 4 bytes = 32 bits = 101010101...(etc)
puts "Example 1, n=5"
n_by_n_matrix = [[0,1,2,3,4],[5,6,7,8,9],[10,11,12,13,14],[15,16,17,18,19],[20,21,22,23,24]]
puts "before:"
n_by_n_matrix.each{|x| puts x.to_s}
rotated_n_by_n_matrix = rotate_matrix(n_by_n_matrix)
puts "after:"
rotated_n_by_n_matrix.each{|x| puts x.to_s}
puts "Example 2. n=4"
n_by_n_matrix = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15]]
puts "before:"
n_by_n_matrix.each{|x| puts x.to_s}
rotated_n_by_n_matrix = rotate_matrix(n_by_n_matrix)
puts "after:"
rotated_n_by_n_matrix.each{|x| puts x.to_s}
