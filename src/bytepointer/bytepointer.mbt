///|
struct BytePointer {
  mut index : UInt
  memory : FixedArray[Byte]
}

///|
fn add(self : BytePointer, offset : UInt) -> BytePointer {
  self.index = self.index + offset
  self
}

///|
fn sub(self : BytePointer, other : BytePointer) -> UInt {
  self.index - other.index
}

///|
fn get(self : BytePointer) -> Byte {
  self.memory[self.index.reinterpret_as_int()]
}

///|
fn set(self : BytePointer, value : Byte) -> Unit {
  self.memory[self.index.reinterpret_as_int()] = value
}