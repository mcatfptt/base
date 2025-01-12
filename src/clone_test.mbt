test "Array[Int]::clone" {
  let xs = [1, 2, 3, 4, 5]
  let ys = xs |> Clone::clone
  xs[0] = 99
  inspect!(xs, content="[99, 2, 3, 4, 5]")
  inspect!(ys, content="[1, 2, 3, 4, 5]")
}

test "Array[Ref[Int]]::clone" {
  let xs = [1, 2, 3, 4, 5].map(fn(x) { { val: x } })
  let ys = xs |> Clone::clone
  xs[0].val = 99
  inspect!(xs, content="[{val: 99}, {val: 2}, {val: 3}, {val: 4}, {val: 5}]")
  inspect!(ys, content="[{val: 1}, {val: 2}, {val: 3}, {val: 4}, {val: 5}]")
}

test "FixedArray[Int]::clone" {
  let xs : FixedArray[Int] = [1, 2, 3, 4, 5]
  let ys = xs |> Clone::clone
  xs[0] = 99
  inspect!(xs, content="[99, 2, 3, 4, 5]")
  inspect!(ys, content="[1, 2, 3, 4, 5]")
}

test "FixedArray[Ref[Int]]::clone" {
  let xs = ([1, 2, 3, 4, 5] : FixedArray[Int]).map(fn(x) { { val: x } })
  let ys = xs |> Clone::clone
  xs[0].val = 99
  inspect!(xs, content="[{val: 99}, {val: 2}, {val: 3}, {val: 4}, {val: 5}]")
  inspect!(ys, content="[{val: 1}, {val: 2}, {val: 3}, {val: 4}, {val: 5}]")
}

test "Ref[Int]::clone" {
  let x = { val: 0 }
  let y = x |> Clone::clone
  x.val = 10
  inspect!(x, content="{val: 10}")
  inspect!(y, content="{val: 0}")
}

test "Bytes::clone" {
  let xs = b"\x12\x34"
  let ys = xs |> Clone::clone
  xs[0] = b'\x00'
  let xss =
    #|b"\x00\x34"
  let yss =
    #|b"\x12\x34"
  inspect!(xs, content=xss)
  inspect!(ys, content=yss)
}

test "Ref[Int]?::clone" {
  let x = Some({ val: 0 })
  let y = x |> Clone::clone
  x.unwrap().val = 99
  inspect!(x, content="Some({val: 99})")
  inspect!(y, content="Some({val: 0})")
}

test "Result[Ref[Int],Ref[String]]::clone" {
  let x : Result[Ref[Int], Ref[String]] = Ok({ val: 1 })
  let y = x |> Clone::clone
  match x {
    Ok(x) => x.val = 99
    Err(x) => x.val = "OvO"
  }
  inspect!(x, content="Ok({val: 99})")
  inspect!(y, content="Ok({val: 1})")
  let x : Result[Ref[Int], Ref[String]] = Err({ val: "mooncake" })
  let y = x |> Clone::clone
  match x {
    Ok(x) => x.val = 99
    Err(x) => x.val = "OvO"
  }
  inspect!(x, content="Err({val: \"OvO\"})")
  inspect!(y, content="Err({val: \"mooncake\"})")
}

test "mutability" {

  // immutable 
  let oi = Some(0)
  inspect!(get_mutability(oi), content="Immutable")
  let ris : Result[Int, String] = Ok(32)
  inspect!(get_mutability(ris), content="Immutable")
  // TODO, we need to test reference equal

  // mutable 
  let ri : Ref[Int] = { val: 0 }
  let ari = [ri]
  let aoi = [oi]
  inspect!(get_mutability(ri), content="Mutable")
  inspect!(get_mutability(ari), content="Mutable")
  inspect!(get_mutability(aoi), content="Mutable")
}
