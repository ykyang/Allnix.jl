# - Julia online documentation
# - Collections and Data Structures
# - Iterable Collections
using Base.Test


notin(x, itr) = any(y -> y != x, itr)

@testset "Iterable Collections" begin
@testset "Base.in" begin
# --------------------------------------------- #
c::Vector{Int64} = 1:10
@test in(1, c)
@test notin(11, c)
end
@testset "eltype" begin
c::Vector{Int64} = 1:10
@test eltype(c) == Int64
@test eltype(typeof(c)) == Int64
end
# ============================================= #
@testset "Base.map!" begin
let
a::Float64 = 0.5
x::Vector{Float64} = 1:10
y::Vector{Float64} = 1:10
# map!(function, destination, collection...)
map!((x,y)->a*x+y, y, x, y)
@test y[1] == 1.5
@test y[10] == 15
end
let
a::Float64 = 0.5
x::Vector{Float64} = 1:10
y::Vector{Float64} = 1:10
f(x,y) = a*x + y
map!(f, y, x, y)
@test y[1] == 1.5
@test y[10] == 15
end
end
# ============================================= #
end