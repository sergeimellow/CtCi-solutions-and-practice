# Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palin-
# drome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation
# is a rea rrangement of letters. The palindrome does not need to be limited to just dictionary words.
# EXAMPLE
# Input: Tact Coa
# Output: True (permutations: "taco cat". "atco cta". etc.)

def palindrome_permutation str
  str_1 = str.chars.sort.join
  str_2 = str.chars.sort.join.reverse
  for i in 0..str.length/2
    return false if str[i] != str[str.length-i-1]
  end
  return true
end

palindrome_permutation("Tact Coa")
