# Allnix
## Julia REPL
Use ";" to switch to the shell mode.
* `methodswith(type)`: Return an array of methods with an argument of type type.
* `whos()`, `workspace()`, `reload("module name")`

## Re-build System for the Hardware
From [7 Julia Gotchas and How to Handle Them](http://www.stochasticlifestyle.com/7-julia-gotchas-handle/), do the following to re-build Julia to optimize for the hardware.
```julia
include(joinpath(dirname(JULIA_HOME),"share","julia","build_sysimg.jl")); build_sysimg(force=true)
```

## Test
Run tests using the following three options
* From Julia REPL, run `Pkg.test("Allnix")` from package directory
* Not working: From Julia REPL, run `include("runtests.jl")` from within the `test/` directory
* From shell, run `julia ../test/runtests.jl` from within the `src/`.

Use `≈` (type `\approx` and use tab complete) to compare floating numbers or `isapprox()`.

## BenchmarkTools
Install `Pkg.add("BenchmarkTools")`

Usage
```julia
t::BenchmarkTools.Trial = @benchmark sin(1)
show(STDOUT, "text/plain", t)
```
to show the full report from code.

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

### Jupyter
Install `IJulia` by `Pkg.add("IJulia")`.  In Julia REPL,
```julia
using IJulia
notebook()
```
