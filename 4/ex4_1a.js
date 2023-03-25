// return the factorial value of n using cache
function memoisedFactorial(n, cache) {
    if (cache[n])
        return cache[n]
    return cache[n] = n * memoisedFactorial(n - 1, cache)
}

// reutrn the factorial value of n
function Factorial(n) {
    return memoisedFactorial(n, [1, 1])
}