///|
pub(all) struct TypeInfo {
  name : String
  args : Array[TypeInfo]
} derive(Eq)


///|
pub impl Show for TypeInfo with output(self, logger) {
  logger.write_string(self.name)
  if not(self.args.is_empty()) {
    logger.write_char('[')
    let x = self.args[0]
    logger.write_string(x.to_string())
    for x in self.args[1:] {
      logger.write_string(", ")
      logger.write_string(x.to_string())
    }
    logger.write_char(']')
  }
  // TODO: use Lazy to impl this function
}

///|
pub(open) trait Type {
  typeinfo() -> TypeInfo
}

///|
pub fn noparm(name : String) -> TypeInfo {
  parm(name, [])
}

///|
pub fn parm(name : String, args : Array[TypeInfo]) -> TypeInfo {
  { name, args }
}

///|
pub impl Type for Unit with typeinfo() { noparm("Unit") }

///|
pub impl Type for Bool with typeinfo() { noparm("Bool") }

///|
pub impl Type for Int with typeinfo() { noparm("Int") }

///|
pub impl Type for Int64 with typeinfo() { noparm("Int64") }

///|
pub impl Type for Float with typeinfo() { noparm("Float") }

///|
pub impl Type for UInt with typeinfo() { noparm("UInt") }

///|
pub impl Type for UInt64 with typeinfo() { noparm("UInt64") }

///|
pub impl Type for Byte with typeinfo() { noparm("Byte") }

///|
pub impl Type for Bytes with typeinfo() { noparm("Bytes") }

///|
pub impl Type for String with typeinfo() { noparm("String") }

///|
pub impl[A : Type] Type for Array[A] with typeinfo() {
  parm("Array", [A::typeinfo()])
}

///|
pub impl[A : Type] Type for A? with typeinfo() {
  parm("Option", [A::typeinfo()])
}

///|
pub impl[A : Type] Type for Ref[A] with typeinfo() {
  parm("Ref", [A::typeinfo()])
}

///|
pub impl[A : Type] Type for FixedArray[A] with typeinfo() {
  parm("FixedArray", [A::typeinfo()])
}

///|
pub impl[A : Type, B : Type] Type for Result[A, B] with typeinfo() {
  parm("Result", [A::typeinfo(), B::typeinfo()])
}

///|
pub fn tyinfo[A : Type](_ : A) -> TypeInfo {
  A::typeinfo()
}
