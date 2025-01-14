///|
pub impl Ord for Byte with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
pub impl Ord for Int with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
pub impl Ord for Int64 with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
pub impl Ord for UInt with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
pub impl Ord for UInt64 with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
pub impl Ord for Float with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
pub impl Ord for Unit with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
pub impl Ord for Bool with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
pub impl Ord for String with cmp(self, other) {
  self.compare(other) |> @ordering.of
}

///|
fn min(x : Int, y : Int) -> Int {
  if x < y {
    x
  } else {
    y
  }
}

///|
pub impl Ord for Bytes with cmp(self, other) {
  let xs = self
  let ys = other
  let len = min(xs.length(), ys.length())
  let r = for i in 0..<len {
    let r = xs[i].compare(ys[i])
    guard r == 0 else { break r }

  } else {
    0
  }
  let r = if r != 0 { r } else { xs.length() - ys.length() }
  r |> @ordering.of
}

///|
pub impl[A : Ord] Ord for FixedArray[A] with cmp(self, other) {
  let xs = self
  let ys = other
  let len = min(xs.length(), ys.length())
  let r = for i in 0..<len {
    let r = xs[i].cmp(ys[i])
    guard r == @ordering.Equal else { break r }

  } else {
    @ordering.Equal
  }
  match r {
    @ordering.Equal => xs.length() - ys.length() |> @ordering.of
    _ => r
  }
}

test {
  let xs : FixedArray[Int] = [1, 2]
  let ys : FixedArray[Int] = [1, 2, 0]
  inspect!(xs.cmp(ys), content="Less")
  let xs : FixedArray[Int] = [1, 2]
  let ys : FixedArray[Int] = [1, 2]
  inspect!(xs.cmp(ys), content="Equal")
  let xs : FixedArray[Int] = [1, 2, 0]
  let ys : FixedArray[Int] = [1, 2]
  inspect!(xs.cmp(ys), content="Greater")
}
