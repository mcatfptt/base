///|
pub(all) struct Term {
  typename : String
  representation : Error
}

///|
pub fn mismatch[A](expected : String, actual : String) -> A {
  abort(
    "Couldn't match expected type ‘\{expected}’ with actual type ‘\{actual}’",
  )
}

///|
pub fn into[A : @tn.TypeName](x : A, r : Error) -> Term {
  { typename: A::typename(), representation: r }
}

///| 
pub fn tynm[A : @tn.TypeName](_ : A) -> String {
  A::typename()
}

///|
pub(open) trait Rep {
  of(Self) -> Term
  to(Term) -> Self
}

///|
pub impl Rep for Term with of(self) { self }

///|
pub impl Rep for Term with to(self) { self }

///|
pub impl @tn.TypeName for Term with typename() { "unknown" }
