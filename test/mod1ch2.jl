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

# ------------------------------------------ #
# - Deep copy of array with primitive type - #
# ------------------------------------------ #
@testset "copy" begin
count = 100
v = Vector{Float64}(linspace(1,100,count))
w = copy(v)
# - Expect deep copy - #
@test pointer_from_objref(v) != pointer_from_objref(w)
@test length(w) == count
for i in 1:count
    @test w[i] == v[i]
end
end

@testset "Common Array Operators" begin
count = 100
# source = [1, 2, ... 100]
source = Vector{Float64}(linspace(1,100.,count))

####  append!  ####
v = copy(source)
append!(v, 13.0)
@test length(v) == 1 + count
@test v[1+count] == 13.0

v = copy(source)
b = copy(source)
append!(v, b)
@test length(v) == 2*count
@test v[2] == 2.0
@test v[101] == 1.0
@test v[200] == 100

### push! ###
v = copy(source)
w = push!(v, 101) # return v reference
@test length(v) == count + 1
# w and v point to the same array
@test pointer_from_objref(w) == pointer_from_objref(v)

#### pop! ####
# - Remove the last item and returns it
v = copy(source)
@test pop!(v) == 100.0
@test length(v) == count - 1

### shift! ###
# - Remove the first item and returns it
v = copy(source)
@test shift!(v) == 1.0
# v = 2,...10
@test length(v) == count - 1

### splice! ###
v = copy(source)
splice!(v, 55)
@test v[55] == 56

### in ###
v = copy(source)
@test in(55, v)

### sort ###
v = Vector{Float64}(linspace(100.,1.,count))
@test v[1] == 100.0
sort!(v) # mutable version
@test v[1] == 1.0

v = Vector{Float64}(linspace(100.,1.,count))
@test v[1] == 100.0
t = sort(v) # immutable version
@test v[1] == 100.0
@test t[1] == 1.0
end

@testset "dot operator" begin
v = Vector{Float64}()
Base.resize!(v, 100)

# - Assign value to every element - #
v .= 13.0

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
