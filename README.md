# Allnix
## Julia REPL
Use ";" to switch to the shell mode.
* `methodswith(type)`: Return an array of methods with an argument of type type.

## Test
Run tests using the following three options
* From Julia REPL, run `Pkg.test("Allnix")` from package directory
* Not working: From Julia REPL, run `include("runtests.jl")` from within the `test/` directory
* From shell, run `julia ../test/runtests.jl` from within the `src/`.

Use `≈` (type `\approx` and use tab complete) to compare floating numbers or `isapprox()`.

## Pakcages
Use `Pkg.add("package name")` to install packages.  Some common packages
* `Pkg.add("DataStructures")`

## test/
* `data_structures.jl`: Learn package DataStructures

## Directory Structure
### Julia: High Performance Programming
* `test/mod1ch2.jl`: Module 1 Chapter 2

### Julia Documentation
`test/julia_doc.jl`: General Julia language features from [Julia Documentation](https://docs.julialang.org/en/stable/).
