///|
fn gen() -> Unit {
  let immutable = @primitive.parm0
  for ty in immutable {
    let s1 = "pub impl Clone for \{ty} with clone(self) { self }"
    let s2 = "pub impl Clone for \{ty} with mutability() { Immutable }"
    println(s1)
    println(s2)
  }
}
