// return cached version of fucntion f(wherer f is multi argument function)
const memoize = (f) => {
    let cache = {}
    return (...args) => {
        let args_string = JSON.stringify(args)
        if (args_string in cache) {
            return cache[args_string]
        } else {
            let ret = f(...args)
            cache[args_string] = ret
            return ret
        }
    }
}