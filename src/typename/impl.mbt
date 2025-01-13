///|
pub impl TypeName for Char with typename() { "Char" }

///|
pub impl TypeName for Byte with typename() { "Byte" }

///|
pub impl TypeName for Bytes with typename() { "Bytes" }

///|
pub impl TypeName for Int with typename() { "Int" }

///|
pub impl TypeName for Int64 with typename() { "Int64" }

///|
pub impl TypeName for UInt with typename() { "UInt" }

///|
pub impl TypeName for UInt64 with typename() { "UInt64" }

///|
pub impl TypeName for Float with typename() { "Float" }

///|
pub impl TypeName for Unit with typename() { "Unit" }

///|
pub impl TypeName for Bool with typename() { "Bool" }

///|
pub impl TypeName for String with typename() { "String" }

///|
pub impl[A : TypeName] TypeName for FixedArray[A] with typename() {
  "FixedArray[\{A::typename()}]"
}
