pub fn test_str() -> @builtin.Js_string {
  return @builtin.Js_string::new("test str")
}

pub fn test_int(p : Int) -> Int {
  return p + 1
}

pub fn test_int64(p : Int64) -> Int64 {
  return p + 2L
}

pub fn test_float(p : Double) -> Double {
  return p + 3.0
}

struct T0 {
  a : Int
  b : Int
}

fn init {
  let a = 1
  a.lsl(2)
  let x = "abc"
  print(x)
  let y = { a: 1, b: 2 }
  let z = { a: 11, b: 22 }
  let c = y.a + y.b
  let d = z.a + z.b
  println(c)
  println(d)
}

