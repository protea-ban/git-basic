
def fib(n):
    if n <= 0:
        return None
    if n == 1:
        return [1]
    if n == 2:
        return [1, 1]
    fibs = [1, 1] # fibs初始化不应为空
    for i in range(2, n):
        fibs.append(fibs[i - 1] + fibs[i - 2])
    return fibs
