pub fn pi(n : Int) -> Double {
  return @lib.pi(n)
}

pub fn prime(n : Int) -> Int {
  return @lib.prime(n)
}

pub fn incr(n : Int) -> Int64 {
  var res = 0L
  var i = 1
  while i <= n {
    res = res + i.to_int64()
    i = i + 1
  }
  res
}

pub fn mulDiv(n : Int) -> Double {
  var res = 1.0
  var i = 2
  while i <= n {
    if i % 2 == 0 {
      res = res * i.to_double()
    } else {
      res = res / i.to_double()
    }
    i = i + 1
  }
  res
}

fn init {
  ()
}
