///|
pub impl Rep for Char with of(self) { self |> into(CharRep(self)) }

///|
pub impl Rep for Char with to(self) {
  match self.representation {
    CharRep(v) => v
    _ => mismatch("Char", self.typename)
  }
}

///|
pub impl Rep for Byte with of(self) { self |> into(ByteRep(self)) }

///|
pub impl Rep for Byte with to(self) {
  match self.representation {
    ByteRep(v) => v
    _ => mismatch("Byte", self.typename)
  }
}

///|
pub impl Rep for Bytes with of(self) { self |> into(BytesRep(self)) }

///|
pub impl Rep for Bytes with to(self) {
  match self.representation {
    BytesRep(v) => v
    _ => mismatch("Bytes", self.typename)
  }
}

///|
pub impl Rep for Int with of(self) { self |> into(IntRep(self)) }

///|
pub impl Rep for Int with to(self) {
  match self.representation {
    IntRep(v) => v
    _ => mismatch("Int", self.typename)
  }
}

///|
pub impl Rep for Int64 with of(self) { self |> into(Int64Rep(self)) }

///|
pub impl Rep for Int64 with to(self) {
  match self.representation {
    Int64Rep(v) => v
    _ => mismatch("Int64", self.typename)
  }
}

///|
pub impl Rep for UInt with of(self) { self |> into(UIntRep(self)) }

///|
pub impl Rep for UInt with to(self) {
  match self.representation {
    UIntRep(v) => v
    _ => mismatch("UInt", self.typename)
  }
}

///|
pub impl Rep for UInt64 with of(self) { self |> into(UInt64Rep(self)) }

///|
pub impl Rep for UInt64 with to(self) {
  match self.representation {
    UInt64Rep(v) => v
    _ => mismatch("UInt64", self.typename)
  }
}

///|
pub impl Rep for Float with of(self) { self |> into(FloatRep(self)) }

///|
pub impl Rep for Float with to(self) {
  match self.representation {
    FloatRep(v) => v
    _ => mismatch("Float", self.typename)
  }
}

///|
pub impl Rep for Unit with of(self) { self |> into(UnitRep(self)) }

///|
pub impl Rep for Unit with to(self) {
  match self.representation {
    UnitRep(v) => v
    _ => mismatch("Unit", self.typename)
  }
}

///|
pub impl Rep for Bool with of(self) { self |> into(BoolRep(self)) }

///|
pub impl Rep for Bool with to(self) {
  match self.representation {
    BoolRep(v) => v
    _ => mismatch("Bool", self.typename)
  }
}

///|
pub impl Rep for String with of(self) { self |> into(StringRep(self)) }

///|
pub impl Rep for String with to(self) {
  match self.representation {
    StringRep(v) => v
    _ => mismatch("String", self.typename)
  }
}
