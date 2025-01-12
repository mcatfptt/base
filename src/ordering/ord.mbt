///|
pub(open) trait Ord {
  cmp(Self, Self) -> Ordering
}

///|
pub impl Ord for Unit with cmp(self, other) { self.compare(other) |> of }

///|
pub impl Ord for Bool with cmp(self, other) { self.compare(other) |> of }

///|
pub impl Ord for Int with cmp(self, other) { self.compare(other) |> of }

///|
pub impl Ord for Int64 with cmp(self, other) { self.compare(other) |> of }

///|
pub impl Ord for UInt with cmp(self, other) { self.compare(other) |> of }

///|
pub impl Ord for UInt64 with cmp(self, other) { self.compare(other) |> of }

///|
pub impl Ord for Float with cmp(self, other) { self.compare(other) |> of }

///|
pub impl Ord for Byte with cmp(self, other) { self.compare(other) |> of }

///|
pub impl Ord for Bytes with cmp(self, other) {
  let xs = self
  let ys = other
  match xs.length().cmp(ys.length()) {
    Equal => {
      let len = xs.length()
      for i in 0..<len {
        let r = xs[i].cmp(ys[i])
        guard r == Equal else { break r }

      } else {
        Equal
      }
    }
    _ as c => c
  }
}

///| this is core's implentation
pub impl[A : Ord] Ord for Array[A] with cmp(self, other) {
  let xs = self
  let ys = other
  match xs.length().cmp(ys.length()) {
    Equal => {
      let len = xs.length()
      for i in 0..<len {
        let r = xs[i].cmp(ys[i])
        guard r == Equal else { break r }

      } else {
        Equal
      }
    }
    _ as c => c
  }
}

///|
pub impl[A : Ord] Ord for FixedArray[A] with cmp(self, other) {
  let xs = self
  let ys = other
  match xs.length().cmp(ys.length()) {
    Equal => {
      let len = xs.length()
      for i in 0..<len {
        let r = xs[i].cmp(ys[i])
        guard r == Equal else { break r }

      } else {
        Equal
      }
    }
    _ as c => c
  }
}

///|
pub impl[A : Ord] Ord for Ref[A] with cmp(self, other) {
  self.val.cmp(other.val)
}

///|
pub impl[A : Ord] Ord for A? with cmp(self, other) {
  // Some -> Right
  // None -> Left 
  match (self, other) {
    (Some(x), Some(y)) => x.cmp(y)
    (Some(_), None) => Greater
    (None, Some(_)) => Less
    (None, None) => Equal
  }
}

///|
pub impl[A : Ord, B : Ord] Ord for Result[A, B] with cmp(self, other) {
  // Ok -> Right 
  // Err -> Left 
  match (self, other) {
    (Ok(x), Ok(y)) => x.cmp(y)
    (Err(x), Err(y)) => x.cmp(y)
    (Ok(_), Err(_)) => Greater
    (Err(_), Ok(_)) => Less
  }
}
