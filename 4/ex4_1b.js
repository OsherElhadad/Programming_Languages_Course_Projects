// return the fibonacci value in the nth position using cache
function memoisedFibonacci(n, cache) {
	if (cache[n])
		return cache[n]
	return cache[n] = memoisedFibonacci(n - 1, cache) + memoisedFibonacci(n - 2, cache)
}

// return the fibonacci value in the nth position
function Fib(n) {
  return memoisedFibonacci(n, [1,1])
}