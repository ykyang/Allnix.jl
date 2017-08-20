# - Julia: High Performance Programming
# - Module 1 Chapter 2

using Allnix: add, power, fpower, fplus
using Base

@testset "add" begin
# int comparison
@test add(1,2) == 3

# - Floating point comparison - #

# type \approx and use tab complete to get ≈
@test add(1.0, 2.0) ≈ 3.0
# or use isapprox() function
@test isapprox(3.0, add(1.0,2.0))

# Exact floating point in some cases
@test add(1.0, 2.0) == 3.0
end

@testset "power" begin
@test power(2,2) == 4
@test power(2.0, 2.0) == 4.0
@test fpower(2.0, 2.0) == 4.0
end

@testset "fplus" begin
@test fplus(1,2,3) == 6
end

# ---------------------- #
# - Variable arguments - #
# ---------------------- #
@testset "varargs" begin
args = [1,2]
# Notice the ellipses
@test add(args...) == 3
end

# --------------------- #
# - Ranges and arrays - #
# --------------------- #
@testset "ones" begin
length = 100
v = ones(Float64, length)
@test Base.length(v) == length
for i in v
    @test i == 1.0
end
end

@testset "zeros" begin
length = 100
v = zeros(Float64, length)
@test Base.length(v) == length
for i in v
    @test i == 0.0
end
end

@testset "linspace" begin
start = 0
stop = 100
# IMPORTANT: n is the number of nodes not intervals
n = 201

@test linspace(start,stop,n) == 0.:0.5:100.
end

@testset "fill" begin
v = Vector{Float64}()
Base.resize!(v, 100)
### - fill! - ###
fill!(v, 13.0)
for i in v
    @test i == 13.0
end
end

@testset "Common Array Operators" begin
b = 2:10
####  append!  ####
v = Vector{Float64}()
append!(v, 13.0)
@test length(v) == 1
@test v[1] == 13.0

append!(v,b)
# v = 13, 2, ..., 10
@test length(v) == 10
@test v[2] == 2.0
@test v[10] == 10.0

### push! ###
tmp = push!(v, 11) # return v reference
@test length(v) == 11
@test pointer_from_objref(tmp) == pointer_from_objref(v)

#### pop! ####
# - Remove the last item and returns it
@test pop!(v) == 11.0
@test length(v) == 10

# v = 13, 2,... 10
@test shift!(v) == 13.0
@test length(v) == 9

end

@testset "dot operator" begin
v = Vector{Float64}()
Base.resize!(v, 100)

# --------- #
v .= 13.0
# --------- #

for i in v
    @test i == 13.0
end

@testset "pointer" begin
a::Vector{Float64} = 1:10.0::Float64
b = a
@test b == a
### pointer_from_objref ###
a_ptr = pointer_from_objref(a)
b_ptr = pointer_from_objref(b)
@test b_ptr == a_ptr

c::Vector{Float64} = 1:10.0::Float64
# compare values
@test b == c
c_ptr = pointer_from_objref(c)
@test b_ptr != c_ptr

@test b[10] == 10.0
a[10] = 13.0
@test b[10] == 13.0
@test b == a


end

end
