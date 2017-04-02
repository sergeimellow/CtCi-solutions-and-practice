# require 'pry'
# require 'pry-byebug'
# Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4
# bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

# rotate N by N matrix clockwise
def rotate_matrix(n_by_n_matrix)
# largest index
n = n_by_n_matrix.first.count - 1
n_by_n_matrix.each_with_index do |row, row_index|
  row.each_with_index do |col, col_index|
    # swap/flip across diagnoal line where (row_index + col_index) >= (n -1)
    next if row_index + col_index >= n
    # only swap if the values are equal already
    if n_by_n_matrix[row_index][col_index] != n_by_n_matrix[n-col_index][n-row_index]
      n_by_n_matrix[row_index][col_index], n_by_n_matrix[n-col_index][n-row_index] = n_by_n_matrix[n-col_index][n-row_index], n_by_n_matrix[row_index][col_index]
      # 1D array swap example:
      # array = [1, 2, 3, 4]
      # array[0], array[3] = array[3], array[0]
      # array # => [4, 2, 3, 1]
    end
  end
  n_by_n_matrix
end

end

# 1 pixel = 4 bytes = 32 bits = 101010101...(etc)
# using z,y,z as variable to show rotation
n_by_n_matrix = [['x','x','x'],['y','y','y'],['z','z','z']]
puts "before:"
n_by_n_matrix.each{|x| puts x.to_s}
rotated_n_by_n_matrix = rotate_matrix(n_by_n_matrix)
puts "after:"
rotated_n_by_n_matrix.each{|x| puts x.to_s}
