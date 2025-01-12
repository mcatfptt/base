///| Use clone method intended for cloned object's internal state won't be influenced original object
pub(open) trait Clone {
  mutability() -> Mutability
  clone(Self) -> Self
}

///| immutable 
pub impl Clone for Unit with clone(self) { self }

///|
pub impl Clone for Bool with clone(self) { self }

///|
pub impl Clone for Int with clone(self) { self }

///|
pub impl Clone for Int64 with clone(self) { self }

///|
pub impl Clone for UInt with clone(self) { self }

///|
pub impl Clone for Byte with clone(self) { self }

///|
pub impl Clone for String with clone(self) { self }

// mutable containers

///|
pub fn map_mutable[T : Copy + Clone](x : T, f : (T) -> T) -> T {
  match T::mutability() {
    Mutable => f(x)
    Immutable => x.shallow_copy()
  }
}

///|
pub impl[T : Clone] Clone for Array[T] with clone(self) {
  self |> map_mutable(fn(x) { x.map(T::clone) })
}

///|
pub impl[T : Clone] Clone for FixedArray[T] with clone(self) {
  self |> map_mutable(fn(x) { x.map(T::clone) })
}

///|
pub impl[T : Clone] Clone for Ref[T] with clone(self) {
  self |> map_mutable(fn(x) { x.map(T::clone) })
}

///|
pub impl Clone for Bytes with clone(self) { self.copy() }

// immutable containers

///|
pub impl[T : Clone] Clone for T? with clone(self) {
  self |> map_mutable(fn(x) { x.map(T::clone) })
}

///|
pub impl[T : Clone, E : Clone] Clone for Result[T, E] with clone(self) {
  self
  |> map_mutable(fn(x) {
    match x {
      Ok(x) => Ok(T::clone(x))
      Err(x) => Err(E::clone(x))
    }
  })
}
