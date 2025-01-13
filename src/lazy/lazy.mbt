///| a lazy reprentation
pub enum Lazy[A] {
  Thunk(() -> A)
  Value(A)
}

///| extract value 
pub fn extract[A](self : Lazy[A]) -> A {
  match self {
    Thunk(_) => panic()
    Value(v) => v
  }
}

///| run procedure
pub fn force[A](self : Lazy[A]) -> Lazy[A] {
  match self {
    Thunk(f) => Value(f())
    v => v
  }
}
