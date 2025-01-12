///|
pub(open) trait Copy {
  shallow_copy(Self) -> Self
}

/// immutable

///|
impl Copy for Unit with shallow_copy(self) { self }

///|
impl Copy for Bool with shallow_copy(self) { self }

///|
impl Copy for Int with shallow_copy(self) { self }

///|
impl Copy for Int64 with shallow_copy(self) { self }

///|
impl Copy for Int16 with shallow_copy(self) { self }

///|
impl Copy for UInt with shallow_copy(self) { self }

///|
impl Copy for UInt64 with shallow_copy(self) { self }

///|
impl Copy for UInt16 with shallow_copy(self) { self }

///|
impl Copy for Byte with shallow_copy(self) { self }

///|
impl Copy for String with shallow_copy(self) { self }

///|
impl[V, E] Copy for Result[V, E] with shallow_copy(self) { self }

///|
impl[A] Copy for A? with shallow_copy(self) { self }

///| mutable 
impl Copy for Bytes with shallow_copy(self) { self.copy() }

///|
impl[A] Copy for Ref[A] with shallow_copy(self) { @ref.new(self.val) }

///|
impl[A] Copy for Array[A] with shallow_copy(self) { self.copy() }

///|
impl[A] Copy for FixedArray[A] with shallow_copy(self) { self.copy() }
