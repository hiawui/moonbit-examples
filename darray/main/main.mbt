pub fn test(n : Int) -> Int {
  let arr : @lib.DArray[Int] = @lib.DArray::new(n / 10)
  var i = 0
  while i < n {
    arr.push(i)
    i = i + 1
  }
  match arr[n - 1] {
    None => -1
    Some(e) => e
  }
}

fn init {
  ()
}
