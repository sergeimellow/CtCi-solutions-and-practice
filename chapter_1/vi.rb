# VI.1 
# The following code computes the product of a and b. What is its runtime?
def product(a, b)
  sum = a
  for i in 0..b
    sum += a
  end
  sum
end
# runtime: O(b)

# VI.2
# The following code computes a^b. What is its runtime?
def power(a, b)
  if b < 0
    0
  elsif b == 0
    1
  else
    a * power(a, b - 1)
  end
end
# runtime: O(b)

# VI.3
# The following code computes a % b. What is its runtime?
def mod(a, b)
  if b <= 0
    -1
  div = a / b
  a - div * b
end
# runtime: O(1)

# VI.4
# The following code performs integer division. What is its runtime (assume a and b are both positive)?
def div(a, b)
  count = 0
  sum = b
  while sum <= a do
    sum += b
    count++
  end
  count
end
# runetime: O(a/b)

