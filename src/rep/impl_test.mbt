test {
  let x = 10 |> Rep::of
  let f = @rep.Arrow(fn(x : Int) { x * 2 }) |> Rep::of
  let val = f.apply(x)
  let v = (Rep::to : (Term) -> Int)(val)
  inspect!(v, content="20")

}


test {
  let x = 10 |> Rep::of
  let f = @rep.Arrow(fn(x : Int) -> FixedArray[Int] { [x] }) |> Rep::of
  let val = f.apply(x)
  let v = (Rep::to : (Term) -> FixedArray[Int])(val)
  inspect!(v, content="[10]")

}


