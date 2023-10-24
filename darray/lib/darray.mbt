let blockSize = 32

struct DArrayBlock[T] {
  value : Array[Option[T]]
  mut next : Option[DArrayBlock[T]]
}

pub struct DArray[T] {
  priv head : DArrayBlock[T]
  priv mut _size : Int
}

pub fn DArray::new[T]() -> DArray[T] {
  let head = { value: Array::make(blockSize, None), next: None }
  let arr = { head, _size: 0 }
  arr
}

pub fn size[T](self : DArray[T]) -> Int {
  self._size
}

fn findBlockByIdx[T](self : DArray[T], idx : Int) -> DArrayBlock[T] {
  var cnt = idx / blockSize
  var last = self.head
  while cnt > 0 {
    cnt = cnt - 1
    match last.next {
      None => {
        let block = { value: Array::make(blockSize, None), next: None }
        last.next = Some(block)
        last = block
      }
      Some(block) => {
        last = block
      }
    }
  }
  last
}

pub fn op_get[T](self : DArray[T], idx : Int) -> Option[T] {
  if idx > self._size - 1 {
    return None
  }
  let last = self.findBlockByIdx(idx)
  last.value[idx % blockSize]
}

pub fn push[T](self : DArray[T], value : T) {
  let last = self.findBlockByIdx(self._size)
  last.value[self._size % blockSize] = Some(value)
  self._size = self._size + 1
}

