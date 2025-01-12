///|
pub impl Clone for Unit with mutability() { Immutable }

///|
pub impl Clone for Bool with mutability() { Immutable }

///|
pub impl Clone for Int with mutability() { Immutable }

///|
pub impl Clone for Int64 with mutability() { Immutable }

///|
pub impl Clone for UInt with mutability() { Immutable }

///|
pub impl Clone for Byte with mutability() { Immutable }

///|
pub impl Clone for String with mutability() { Immutable }

///|
pub impl[T : Clone, E : Clone] Clone for Result[T, E] with mutability() {
  match (T::mutability(), E::mutability()) {
    (Immutable, Immutable) => Immutable
    _ => Mutable
  }
}

///|
pub impl Clone for Bytes with mutability() { Mutable }

///|
pub impl[T : Clone] Clone for Array[T] with mutability() { Mutable }

///|
pub impl[T : Clone] Clone for FixedArray[T] with mutability() { Mutable }

///|
pub impl[T : Clone] Clone for Ref[T] with mutability() { Mutable }

///|
pub impl[T : Clone] Clone for T? with mutability() { T::mutability() }

///|
pub fn get_mutability[T : Clone](_ : T) -> Mutability {
  T::mutability()
}
