///|
pub impl Copy for Byte with copy(self) { self }

///|
pub impl Copy for Bytes with copy(self) { self }

///|
pub impl Copy for Int with copy(self) { self }

///|
pub impl Copy for Int64 with copy(self) { self }

///|
pub impl Copy for UInt with copy(self) { self }

///|
pub impl Copy for UInt64 with copy(self) { self }

///|
pub impl Copy for Float with copy(self) { self }

///|
pub impl Copy for Unit with copy(self) { self }

///|
pub impl Copy for Bool with copy(self) { self }

///|
pub impl Copy for String with copy(self) { self }

///|
pub impl[A] Copy for FixedArray[A] with copy(self) { self.copy() }
