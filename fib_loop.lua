function fib(n)
    local n1, n2 = 1, 0
    while n ~= 0 do
        n1, n2 = n1 + n2, n1
        n = n - 1
    end
    return n2
end

return fib(N)