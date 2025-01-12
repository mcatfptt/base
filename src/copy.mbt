///|
pub(open) trait Copy {
  shallow_copy(Self) -> Self
}

/// immutable

///|
pub impl Copy for Unit with shallow_copy(self) { self }

///|
pub impl Copy for Bool with shallow_copy(self) { self }

///|
pub impl Copy for Float with shallow_copy(self) { self }

///|
pub impl Copy for Int with shallow_copy(self) { self }

///|
pub impl Copy for Int64 with shallow_copy(self) { self }

///|
pub impl Copy for Int16 with shallow_copy(self) { self }

///|
pub impl Copy for UInt with shallow_copy(self) { self }

///|
pub impl Copy for UInt64 with shallow_copy(self) { self }

///|
pub impl Copy for UInt16 with shallow_copy(self) { self }

///|
pub impl Copy for Byte with shallow_copy(self) { self }

///|
pub impl Copy for String with shallow_copy(self) { self }

///|
pub impl[V, E] Copy for Result[V, E] with shallow_copy(self) { self }

///|
pub impl[A] Copy for A? with shallow_copy(self) { self }

///  mutable

///|
/// 
pub impl Copy for Bytes with shallow_copy(self) { self.copy() }

///|
pub impl[A] Copy for Ref[A] with shallow_copy(self) { @ref.new(self.val) }

///|
pub impl[A] Copy for Array[A] with shallow_copy(self) { self.copy() }

///|
pub impl[A] Copy for FixedArray[A] with shallow_copy(self) { self.copy() }
