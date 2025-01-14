///|
pub(all) type Arrow[A, B] (A) -> B

///|
pub impl[A : @tn.TypeName, B : @tn.TypeName] @tn.TypeName for Arrow[A, B] with typename(

) {
  let a = A::typename()
  let b = B::typename()
  "(\{a}) -> \{b}"
}

///|
pub fn apply[A, B](self : Arrow[A, B], x : A) -> B {
  let f = self._
  f(x)
}

///| 
pub impl[A : Rep + @tn.TypeName, B : Rep + @tn.TypeName] Rep for Arrow[A, B] with of(
  self
) {
  self |> into(LamRep(fn(x) { self.apply(A::to(x)) |> B::of }))
}

///|
pub impl[A : Rep + @tn.TypeName, B : Rep + @tn.TypeName] Rep for Arrow[A, B] with to(
  self
) {
  match self.representation {
    LamRep(f) => fn(x : A) -> B { f.apply(A::of(x)) |> B::to }
    _ => panic()
  }
}

///|
pub fn apply(self : Term, x : Term) -> Term {
  match self.representation {
    LamRep(f) => f.apply(x)
    _ => mismatch("Arrow[\{x.typename}, Term]", self.typename)
  }
}
