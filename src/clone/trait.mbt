///|
pub typealias Mutability = @mutability.Mutability

///|
pub(open) trait Clone {
  mutability() -> Mutability
  clone(Self) -> Self
}

///|
pub fn map_mutable[T : @copy.Copy + Clone](x : T, f : (T) -> T) -> T {
  match T::mutability() {
    Mutable => f(x)
    Immutable => x.copy()
  }
}
