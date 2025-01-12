// refs: https://github.com/cppfastio/fast_io/tree/master/include/fast_io_core_impl/concepts
///|
pub type USize UInt

///|
struct Pointer {
  mut index : UInt
  memory : FixedArray[Char]
}


// refs : https://github.com/cppfastio/fast_io/blob/master/include/fast_io_core_impl/concepts/operation.h
// TODO 

///|
pub(open) trait ReservePrintable {
  reserve_size(Self) -> USize
  reserve_define(Self, Pointer) -> Pointer
}
