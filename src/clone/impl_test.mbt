test {
  let xs : FixedArray[FixedArray[Int]] = [[0], [1], [2]]
  let ys = Clone::clone(xs)
  xs[0] = [99]
  inspect!(xs, content="[[99], [1], [2]]")
  inspect!(ys, content="[[0], [1], [2]]")
}
