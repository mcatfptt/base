///|
pub impl[A : Rep + @tn.TypeName] Rep for FixedArray[A] with of(self) {
  self |> into(FixedArrayRep(self.map(Rep::of)))
}

///|
pub impl[A : Rep + @tn.TypeName] Rep for FixedArray[A] with to(self) {
  match self.representation {
    FixedArrayRep(v) => v.map(Rep::to)
    _ => mismatch("String", self.typename)
  }
}
