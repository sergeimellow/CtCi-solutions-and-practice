# Zero Matrix: Write an algorithm such that if an element in an MxN matrix is 0, its entire row and
# column are set to O

# 1) iterate over every element in array
# 2) keep track of columns and rows that will be zeroed out
# 3) skip any row / column gathered that are going to be zeroed out at the end
# 4) zero out all rows and colums once done iterating through array

def zero_matrix m_by_n_matrix
  m_length = m_by_n_matrix.count
  n_length = m_by_n_matrix.first.count
  rows = []
  cols = []
  m_by_n_matrix.each_with_index do |row, m|
    next if rows.include? row
    row.each.with_index do |col, n|
      next if cols.include? col
      if m_by_n_matrix[m][n] == 0
        rows << m
        cols << n
      end
     end
  end

  # zero out the detected columns
  cols.uniq.each do |col|
    m_length.times do |row|
      m_by_n_matrix[row][col] = 0
    end
  end

  # zero out the detected rows
  rows.uniq.each do |row|
    n_length.times do |col|
      m_by_n_matrix[row][col] = 0
    end
  end
  m_by_n_matrix
end
three_by_four = [[1,1,2,3],[5,6,0,8],[9,10,11,12]]
puts "Before:"
three_by_four.each{|arr| puts arr.to_s}
puts "After:"
three_by_four_after = zero_matrix(three_by_four)
three_by_four_after.each{|arr| puts arr.to_s}
