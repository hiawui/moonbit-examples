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

pub fn ceil(n : Double) -> Double {
  if n == 0.0 {
    return n
  } else if n > 0.0 && n < 1.0 {
    return 1.0
  } else if n > -1.0 && n < -0.0 {
    return -0.0
  }
  let nInt64 = n.reinterpret_as_i64()
  let exp = nInt64.lsr(52L).land(0x7ffL) - 1023L
  if exp >= 52L {
    return n
  }
  let aligned = nInt64.land(0x8000_0000_0000_0000L.asr(11L + exp)).reinterpret_as_double()
  if aligned == n {
    return n
  }
  if n > 0.0 {
    return aligned + 1.0
  } else {
    return aligned
  }
}

pub fn floor(n : Double) -> Double {
  if n == 0.0 {
    return n
  } else if n > 0.0 && n < 1.0 {
    return 0.0
  } else if n > -1.0 && n < -0.0 {
    return -1.0
  }
  let nInt64 = n.reinterpret_as_i64()
  let exp = nInt64.lsr(52L).land(0x7ffL) - 1023L
  if exp >= 52L {
    return n
  }
  let aligned = nInt64.land(0x8000_0000_0000_0000L.asr(11L + exp)).reinterpret_as_double()
  if aligned == n {
    return n
  }
  if n > 0.0 {
    return aligned
  } else {
    return aligned - 1.0
  }
}

pub fn round(n : Double) -> Double {
  if n == 0.0 {
    return n
  }
  let nInt64 = n.reinterpret_as_i64()
  let exp = nInt64.lsr(52L).land(0x7ffL).to_int() - 1023
  if exp >= 52 {
    return n
  } else if exp < -1 {
    return nInt64.land(0x8000_0000_0000_0000L).reinterpret_as_double()
  } else if exp < 0 {
    return nInt64.land(0x8000_0000_0000_0000L).lor(0x3FF0_0000_0000_0000L).reinterpret_as_double()
  }
  var aligned = nInt64.land(0x7FFF_FFFF_FFFF_FFFFL).land(
    0x8000_0000_0000_0000L.asr(11L + exp.to_int64()),
  ).reinterpret_as_double()
  if nInt64.land(0x8000_0000_0000_0000L.lsr(12L + exp.to_int64())) > 0L {
    aligned = aligned + 1.0
  }
  // aligned
  if n > 0.0 {
    aligned
  } else {
    -aligned
  }
}

fn init {
  ()
}
