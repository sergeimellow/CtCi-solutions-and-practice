# Is Unique: Implement an algorithm to determine if a string has all unique characters.
# What if you cannot use additional data structures?
# 1) loop from str[1] (2nd char) to str[str.length - 2](one before last)
#    (we can ignore looping till the last char because when we get to it we
#     won't need to compare it to anything at that point)
# 2) during each step check if str[index - 1] is included in the substring
#    of str[index] to str[str.length-1] (end of string)
# 3) return false if an inclusion is found in a given sub string
# 4) return true if loop finishes without finding any inclusions

def is_uniq(str)
  str[0..str.length - 2].each_char.with_index(1) do |char, index|
    return false if str[index..str.length-1].include? str[index-1]
  end
  return true
end

puts is_uniq("tesb")
# loop 1) check if 't' is included in "esb", no
# loop 2) check if 'e' is included in "sb", no
# loop 3) check if 's' is included in "b", no
# return true for is_uniq because no inclusions were found in loop

puts is_uniq("hello")

# loop 1) check if 'h' is included in "ello"
# loop 2) check if 'e' is included in "llo"
# loop 3) check if 'l' is incldued in "lo", YES! stop and return false.

