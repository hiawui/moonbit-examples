pub fn test_str(p : String) -> String {
  return p + "|0"
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

fn init {
  let x = Bytes::make(5, 1024)
  let v = x.length()
  print_string("\(v)")
}

