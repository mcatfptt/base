///|
fn gen() -> Unit {
  for ty in @primitive.parm0.filter(fn(x) { x != "Bytes" }) {
    let s = "impl Ord for \{ty}_ with cmp(self, other) { self._.compare(other._) |> @ordering.of } "
    println(s)
  }
}
