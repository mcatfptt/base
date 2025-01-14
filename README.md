# Base

The purpose of this base package is to explore the abstraction capabilities of moonbit and to design elegant APIs, where performance is not a priority. 

We try to rewrite `Haskell` code to `MoonBit`, like `Functor`, `Applicative`, `Monad`, without `HKT`.

## Feature

### traits
* Copy trait
* Clone trait
* Ord trait
* Rep trait 
* TypeName trait         use recursive poly impl

### intrinsic 
* @unsafe.coerce         use it carefully, `newtype` also is the same representation, 

compiletime mutability' property, I'm believe the compiler will optimize and inline this compile-time constant

## Tips

run below shell command, before pull request

```shell
moon fmt; moon test; moon test --doc; moon check;
```