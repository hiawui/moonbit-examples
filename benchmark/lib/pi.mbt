pub fn pi(n : Int) -> Double {
  var f0 = -1.0
  var f1 = 3.0
  var pi = 4.0
  var i = n
  while i > 0 {
    i = i - 1
    pi = pi + f0 * 4.0 / f1
    f0 = -f0
    f1 = f1 + 2.0
  }
  pi
}
