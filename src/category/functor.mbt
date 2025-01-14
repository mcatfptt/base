///|
pub typealias Term = @rep.Term

///|
pub(open) trait Functor {
  map(Self, Term) -> Term
}

///|
pub impl[A : @rep.Rep + @tn.TypeName] Functor for FixedArray[A] with map(
  self,
  f
) -> Term {
  self.map(fn(x) { f.apply(@rep.Rep::of(x)) }) |> @rep.Rep::of
}
