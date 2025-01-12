///|
fn gen(parm0 : Array[String], parm1 : Array[String]) -> Unit {
  for ty in parm0 {
    let s = "pub impl Copy for \{ty} with copy(self) { self }"
    println(s)
  }
  for ty in parm1 {
    let s = "pub impl[A] Copy for \{ty}[A] with copy(self) { self }"
    println(s)
  }
}
