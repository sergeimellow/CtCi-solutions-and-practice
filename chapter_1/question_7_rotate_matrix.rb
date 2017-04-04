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
      n_by_n_matrix[v+c][v+c-r], n_by_n_matrix[c+r][v] = n_by_n_matrix[c+r][v], n_by_n_matrix[v+c][v+c-r]
    end
  end
  n_by_n_matrix
end

# 1 pixel = 4 bytes = 32 bits = 101010101...(etc)
# using z,y,z as variable to show rotation
n_by_n_matrix = [[0,1,2],[3,4,5],[6,7,8]]
puts "before:"
n_by_n_matrix.each{|x| puts x.to_s}
rotated_n_by_n_matrix = rotate_matrix(n_by_n_matrix)
puts "after:"
rotated_n_by_n_matrix.each{|x| puts x.to_s}
