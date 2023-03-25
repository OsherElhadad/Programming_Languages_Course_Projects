// return cached version of fucntion f(wherer f is single argument function)
const memoize = (f) => {
    let cache = {}
    return (n) => {
        if (n in cache) {
            return cache[n]
        } else {
            let ret = f(n)
            cache[n] = ret
            return ret
        }
    }
}

const factorial = memoize(
    (n) => {
        if (n === 0) {
            return 1
        } else {
            return n * factorial(n - 1)
        }
    }
)