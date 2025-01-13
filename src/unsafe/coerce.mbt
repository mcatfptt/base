///| The function coerce allows you to safely 
/// convert between values of types that have the 
/// same representation with no run-time overhead. 
/// In the simplest case you can use it instead of
/// a newtype constructor.
/// 
/// in moonbit we use type to declare a newtype
/// ```
/// 
type Foo Int derive(Show)

///|
type Bar Foo

test {
  let x : Foo = 99
  let x : Int = coerce(x)
  inspect!(x, content="99")
  let x : Int = (((10 : Int) : Foo) : Bar) |> coerce
  inspect!(x, content="10")
}

///|```
///|
pub fn coerce[A, B](_ : A) -> B = "%identity"
