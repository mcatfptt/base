test {
  let info = tyinfo(())
  inspect!(info, content="Unit")
  let info = [[1]] |> tyinfo()
  inspect!(info, content="Array[Array[Int]]")
  let info = (Ok("hello") : Result[String, Int]) |> tyinfo()
  inspect!(info, content="Result[String, Int]")
}
