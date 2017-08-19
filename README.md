# Allnix
## Julia REPL
Use ";" to switch to the shell mode.

## Test
Run tests using the following three options
* From Julia REPL, run `Pkg.test("Allnix")` from package directory
* Not working: From Julia REPL, run `include("runtests.jl")` from within the `test/` directory
* From shell, run `julia ../test/runtests.jl` from within the `src/`.

Use `≈` (type `\approx` and use tab complete) to compare floating numbers or `isapprox()`.
## Directory Structure
### Julia: High Performance Programming
* `test/mod1ch2.jl`: Module 1 Chapter 2
