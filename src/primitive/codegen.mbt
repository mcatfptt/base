///|
let parm0 : Array[String] = {
  let int = ["Char", "Byte", "Bytes", "Int", "Int64", "UInt", "UInt64"]
  let float = ["Float"]
  let base = ["Unit", "Bool", "String"]
  let all = []
  all.append(int)
  all.append(float)
  all.append(base)
  all
}

///|
let parm1 : Array[String] = {
  let all = ["FixedArray"]
  all
}

///|
fn derive_typename() -> Unit {
  for x in parm0 {
    let s = "impl TypeName for \{x} with typename() { \"\{x}\" } "
    println(s)
  }
  for x in parm1 {
    let s = "impl[A : TypeName] TypeName for FixedArray[A] with typename() { \"FixedArray[\\{A::typename()}]\" }"
    println(s)
  }
}

///|
fn derive_clone() -> Unit {
  let immutable = parm0
  for ty in immutable {
    let s1 = "pub impl Clone for \{ty} with clone(self) { self }"
    let s2 = "pub impl Clone for \{ty} with mutability() { Immutable }"
    println(s1)
    println(s2)
  }
}

///|
fn derive_copy(parm0 : Array[String], parm1 : Array[String]) -> Unit {
  for ty in parm0 {
    let s = "pub impl Copy for \{ty} with copy(self) { self }"
    println(s)
  }
  for ty in parm1 {
    let s = "pub impl[A] Copy for \{ty}[A] with copy(self) { self }"
    println(s)
  }
}

///|
fn derive_ord() -> Unit {
  for ty in parm0.filter(fn(x) { x != "Bytes" }) {
    let s = "impl Ord for \{ty}_ with cmp(self, other) { self._.compare(other._) |> @ordering.of } "
    println(s)
  }
}

///|
fn derive_rep() -> Unit {
  for ty in parm0 {
    let s = "type! \{ty}Rep \{ty}"
    println(s)
  }
}

///|
fn derive_rep_impl() -> Unit {
  let s =
    #| 
    #|pub impl Rep for XYZ with of(self) { self |> into(XYZRep(self)) }
    #|
    #|pub impl Rep for XYZ with to(self) {
    #|  match self.representation {
    #|    XYZRep(v) => v
    #|    _ => mismatch("XYZ", self.typename)
    #|  }
    #|}
    #|
    #|
  for ty in parm0 {
    let r = s.replace_all(old="XYZ", new=ty)
    println(r)
  }
}

test {
  derive_rep_impl()
}
