# String Compression: Implement a method to perform basic string compression using the counts
# of repeated characters. For example, the string aabcccccaaa would become a2b1c5a3. If the
# "compressed" string would not become smaller than the original string, your method should return
# the original string. You can assume the string has only uppercase and lowercase letters (a - z).

def string_compression(str)
  temp_char = ''
  ret = ''
  count = 0
  str.each_char.with_index do |char, index|
    # push the first char to start
    if index == 0
      ret += char
      temp_char = char
      count = 1
      next
    end
 
    if temp_char == str[index]
      count += 1
    else
      ret += count.to_s
      temp_char = str[index]
      ret += temp_char
      count = 1
    end
  end
  ret += count.to_s
  return ret
end

puts string_compression("aabcccccaaa")
