pub fn prime(n : Int) -> Int {
  let maxCnt = 100000
  let arr = Array::make(maxCnt, 0)
  var cnt = 0
  var last = 2
  var i = 2
  while i <= n {
    if cnt >= maxCnt {
      return -1
    }
    var isPrime = true
    var j = 0
    while j < cnt {
      let p = arr[j]
      if i % p == 0 {
        isPrime = false
        break
      }
      j = j + 1
    }
    if isPrime {
      last = i
      arr[cnt] = i
      cnt = cnt + 1
    }
    i = i + 1
  }
  last
}

