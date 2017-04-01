# Check Permutation: Given two strings, write a method to decide if one is a
# permutation of theother.

def check_permutation(str_a, str_b)
  return false if str_a.length != str_b.length
  str_a.chars.sort.join == str_b.chars.sort.join ? true : false
end

