-- Write a function called ends_in_3(num) that returns true if the final digit of num is 3, and
-- false otherwise.

function ends_in_3(num) do
  return string.sub(num, -1) == '3'
end

-- Now, write a similar function called is_prime(num) to test if a number is prime
-- (that is, it’s divisible only by itself and 1).

function is_prime(num)
  for i = 2, num - 1 do
    if num % i == 0 then
      return false
    end
  end

  return true
end

-- Create a program to print the first n prime numbers that end in 3.

function first_n_prime_numbers_ending_in_3(n)
  local count = 0
  local i = 0
  while count < n do
    if is_prime(i) and ends_in_3(i) then
      print(i)
      count = count + 1
    end
    i = i + 1
  end
end

