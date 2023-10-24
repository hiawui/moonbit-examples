fn init {
  let arr : @lib.DArray[Int] = @lib.DArray::new()
  println(arr.size())
  arr.push(1)
  arr.push(11)
  arr.push(22)
  var i = 0
  while i < arr.size() {
    let v = match arr[i] {
      None => -1
      Some(e) => e
    }
    print("\(v), ")
    i = i + 1
  }
  println("")
}

