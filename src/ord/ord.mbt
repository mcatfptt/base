///|
pub typealias Ordering = @ordering.Ordering

///|
trait Ord {
  cmp(Self, Self) -> Ordering
}
