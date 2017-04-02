# One Away: There are three types of edits that can be performed on strings: insert a character,
# remove a character, or replace a character. Given two strings, write a function to check if they are
# one edit (or zero edits) away.
# EXAMPLE
# pale, ple -> true
# pales, pale -> true
# pale, bale -> true
# pale, bake -> false

def one_away(str_1, str_2)
  str_1_length = str_1.length
  str_2_length = str_2.length
  # handles more than 1 character difference
  return false if (str_1_length - str_2.length).abs > 1

  # handles if strs already the same
  return true if str_1 == str_2

  if str_1_length >= str_2_length
    larger_or_equal_length_str = str_1
    smaller_or_equal_length_str = str_2
  else
    larger_or_equal_length_str = str_2
    smaller_or_equal_length_str = str_1
  end

  # handles 1 character difference for both same length and 1 char diff
  larger_or_equal_length_str.each_char.with_index do |char, index|
    # handles replace
    if str_1_length == str_2_length
      temp_arr = smaller_or_equal_length_str.dup
      temp_arr[index]=larger_or_equal_length_str[index]
      return true if larger_or_equal_length_str == temp_arr
    # handles remove / insert
    else
      temp_arr = smaller_or_equal_length_str.dup
      temp_arr.insert(index, larger_or_equal_length_str[index])
      return true if larger_or_equal_length_str == temp_arr
    end
  end
  return false
end

puts one_away("pale", "ple")
puts one_away("pales", "pale")
puts one_away("pale", "bale")
puts one_away("pale", "bake")
