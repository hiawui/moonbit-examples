pub let e = 2.718281828459045

pub let pi = 3.141592653589793

pub let int32_max = 0x7FFF_FFFF

pub let int32_min = -0x8000_0000

pub let int64_max = 0x7FFF_FFFF_FFFF_FFFFL

pub let int64_min : Int64 = -0x8000_0000_0000_0000L

pub let inf : Double = 0x7FF0_0000_0000_0000L.reinterpret_as_double()

pub fn int64_binary_bytes(n : Int64) -> Bytes {
  let out = Bytes::make(64, 0)
  var i = 0
  while i < 64 {
    if 1L.lsl(i.to_int64()).land(n) != 0L {
      out[i] = 1
    }
    i = i + 1
  }
  out
}

pub fn int32_binary_bytes(n : Int) -> Bytes {
  let out = Bytes::make(32, 0)
  var i = 0
  while i < 32 {
    if (1).lsl(i).land(n) != 0 {
      out[i] = 1
    }
    i = i + 1
  }
  out
}

pub fn ceil(n : Double) -> Double = "(func $ceil (param $n f64) (result f64) (f64.ceil (local.get $n)))"

pub fn floor(n : Double) -> Double = "(func $floor (param $n f64) (result f64) (f64.floor (local.get $n)))"

pub fn round(n : Double) -> Double = "(func $round (param $n f64) (result f64) (f64.nearest (local.get $n)))"

fn init {
  ()
}
