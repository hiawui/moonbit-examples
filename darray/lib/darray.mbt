let defaultInitialSize = 50

struct DArrayBlock[T] {
  value : Array[Option[T]]
  mut next : Option[DArrayBlock[T]]
}

pub struct DArray[T] {
  priv head : DArrayBlock[T]
  priv mut _size : Int
  priv mut _capacity : Int
}

pub fn DArray::new[T](initialSize : Int) -> DArray[T] {
  let initSize = if initialSize < defaultInitialSize {
    defaultInitialSize
  } else {
    initialSize
  }
  let head = { value: Array::make(initSize, None), next: None }
  let arr = { head, _size: 0, _capacity: initSize }
  arr
}

pub fn size[T](self : DArray[T]) -> Int {
  self._size
}

pub fn capacity[T](self : DArray[T]) -> Int {
  self._capacity
}

fn findBlockByIdx[T](self : DArray[T], idx : Int) -> (DArrayBlock[T], Int) {
  var blockStartIdx = 0
  var currBlock = self.head
  while true {
    if blockStartIdx + currBlock.value.length() > idx {
      break
    }
    blockStartIdx = blockStartIdx + currBlock.value.length()
    currBlock = match currBlock.next {
      None => {
        let block = {
          value: Array::make(blockStartIdx.asr(1), None),
          next: None,
        }
        currBlock.next = Some(block)
        self._capacity = self._capacity + block.value.length()
        block
      }
      Some(block) => block
    }
  }
  (currBlock, idx - blockStartIdx)
}

pub fn op_get[T](self : DArray[T], idx : Int) -> Option[T] {
  if idx > self._size - 1 {
    return None
  }
  let (block, idx0) = self.findBlockByIdx(idx)
  block.value[idx0]
}

pub fn push[T](self : DArray[T], value : T) {
  let (block, idx0) = self.findBlockByIdx(self._size)
  block.value[idx0] = Some(value)
  self._size = self._size + 1
}

fn init {
  ()
}

