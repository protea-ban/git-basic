def fib_yield_for(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
        yield a

for i in fib_yield_for(10):
    print(i, end=' ')