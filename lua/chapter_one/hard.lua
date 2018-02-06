-- Write a function reduce(max, init, f) that calls a function f() over the integers from 1 to max
-- like so:

function reduce(max, init, f)
  for i = 1, max do
    init = f(init, i)
  end
  return init
end

function factorial(num)
  return reduce(num, 1, function (a, b) return a * b end)
end
