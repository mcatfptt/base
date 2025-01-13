///|
pub typealias Ordering = @ordering.Ordering

///|
trait Ord {
  cmp(Self, Self) -> Ordering
  less(Self, Self) -> Bool
  less_equal(Self, Self) -> Bool
  equal(Self, Self) -> Bool
  not_equal(Self, Self) -> Bool
  greater(Self, Self) -> Bool
  greater_equal(Self, Self) -> Bool
}

///|
impl Ord with less(self, y) -> Bool {
  let x = self
  match x.cmp(y) {
    Less => true
    _ => false
  }
}

///|
impl Ord with greater_equal(self, y) -> Bool { self.less(y) |> not }

///|
impl Ord with less_equal(self, y) -> Bool { self.greater(y) |> not }

///|
impl Ord with equal(self, y) -> Bool {
  let x = self
  match x.cmp(y) {
    Equal => true
    _ => false
  }
}

///|
impl Ord with not_equal(self, y) -> Bool { self.equal(y) |> not }

///|
impl Ord with greater(self, y) -> Bool {
  let x = self
  match x.cmp(y) {
    Greater => true
    _ => false
  }
}
