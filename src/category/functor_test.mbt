test  {
  let f = @rep.Rep::of(@rep.Arrow(fn(x : Int) -> FixedArray[Int] { [x] }))

  let xs : FixedArray[Int] = [1,2,3,4]

  let val = xs |> Functor::map(f)
  let extract = (@rep.Rep::to : (Term) -> FixedArray[FixedArray[Int]])

  inspect!(extract(val),content="[[1], [2], [3], [4]]")
}