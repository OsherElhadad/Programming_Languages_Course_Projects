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