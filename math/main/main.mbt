pub fn round(n : Int) -> Double {
  var i = n.to_double()
  var r = 0.0
  while i > 0.0 {
    i = i - 1.0
    r = r + @lib.round(2251799813685248.5 + i)
  }
  r
}

pub fn ceil(n : Int) -> Double {
  var i = n.to_double()
  var r = 0.0
  while i > 0.0 {
    i = i - 1.0
    r = r + @lib.ceil(2251799813685248.5 + i)
  }
  r
}

fn init {
  ()
}
