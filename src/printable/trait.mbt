///|
typealias BytePointer = @bytepointer.BytePointer

///|
trait Printable {
  size(Self) -> Unit
  unsafe_print(Self, BytePointer) -> Unit
}
