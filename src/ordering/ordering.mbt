///|
pub enum Ordering {
  Less
  Equal
  Greater
} derive(Eq, Show)

///|
pub fn to_int(self : Ordering) -> Int {
  match self {
    Less => -1
    Equal => 0
    Greater => 1
  }
}

///|
pub fn of(x : Int) -> Ordering {
  if x < 0 {
    Less
  } else if x == 0 {
    Equal
  } else {
    Greater
  }
}
