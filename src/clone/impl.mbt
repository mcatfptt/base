///|
pub impl Clone for Char with clone(self) { self }

///|
pub impl Clone for Char with mutability() { Immutable }

///|
pub impl Clone for Byte with clone(self) { self }

///| 
pub impl Clone for Byte with mutability() { Immutable }

///| modify Bytes is undefined behavior
pub impl Clone for Bytes with clone(self) { self }

///| modify Bytes is undefined behavior
pub impl Clone for Bytes with mutability() { Immutable }

///|
pub impl Clone for Int with clone(self) { self }

///|
pub impl Clone for Int with mutability() { Immutable }

///|
pub impl Clone for Int64 with clone(self) { self }

///|
pub impl Clone for Int64 with mutability() { Immutable }

///|
pub impl Clone for UInt with clone(self) { self }

///|
pub impl Clone for UInt with mutability() { Immutable }

///|
pub impl Clone for UInt64 with clone(self) { self }

///|
pub impl Clone for UInt64 with mutability() { Immutable }

///|
pub impl Clone for Float with clone(self) { self }

///|
pub impl Clone for Float with mutability() { Immutable }

///|
pub impl Clone for Unit with clone(self) { self }

///|
pub impl Clone for Unit with mutability() { Immutable }

///|
pub impl Clone for Bool with clone(self) { self }

///|
pub impl Clone for Bool with mutability() { Immutable }

///|
pub impl Clone for String with clone(self) { self }

///|
pub impl Clone for String with mutability() { Immutable }

///|
pub impl[T : Clone] Clone for FixedArray[T] with mutability() { Mutable }

///|
pub impl[T : Clone] Clone for FixedArray[T] with clone(self) {
  self |> map_mutable(fn(x) { x.map(T::clone) })
}
