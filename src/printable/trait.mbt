///|
typealias BytePointer = @bytepointer.BytePointer

///|
trait Printable {
  size(Self) -> UInt
  unsafe_print(Self, BytePointer) -> Unit
  print(Self, BytePointer) -> Unit
}

///|
impl Printable with unsafe_print(self, it) { self.print(it) }

///|
impl Printable with size(self) { 0 }
