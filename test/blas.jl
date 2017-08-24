using Allnix

@testset "for" begin
n = 10000000
count = 100
a::Float64 = 0.5
x = Array{Float64, 1}(n)
y = Array{Float64, 1}(n)
z = Array{Float64, 1}(n)
for i in 1:n
    x[i] = i - 1
    y[i] = 0.0
    z[i] = 1.5 * (i+1)
end

d::Float64 = 1./13.
println("for-loop")
@timev for j in 1:count
#     y = x/13. + z - 10.
#     y .+= z
#     y .-= 10.
     @inbounds for i = 1:n
#         y[i] = x[i]/13. + z[i] - 10.
         if z[i] < 1500.
             y[i] = x[i]/13. + z[i] - 10.
         else
             y[i] = x[i]/13. + z[i] + 10.
         end
    end
end
println("y = $(y[n])")
end

# Test daxpy
@testset "daxpy" begin
n = 1000000
count = 1000
a::Float64 = 0.5
x = Array{Float64, 1}(n)
y = Array{Float64, 1}(n)
for i in 1:n
    x[i] = i - 1
    y[i] = 1.0
end

val, t, bytes, gctime, memallocs = @timed for i in 1:count
    Allnix.daxpy(a,x,y)
end

println("daxpy time: $t")
# my Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz takes less than one second
@test t <= 1.0
end

@testset "axpy" begin
# - Float64 axpy - #
@testset "Float64" begin
n = 1000000
count = 1000
a::Float64 = 0.5
x = Array{Float64, 1}(n)
y = Array{Float64, 1}(n)
for i in 1:n
    x[i] = i - 1
    y[i] = 1.0
end

val, t, bytes, gctime, memallocs = @timed for i in 1:count
    Allnix.axpy(a,x,y)
end

println("axpy{Float64} time: $t")
@test t <= 1.0
end
# - Float32 axpy - #
@testset "Float32" begin
n = 1000000
count = 1000
a::Float32 = 0.5
x = Array{Float32, 1}(n)
y = Array{Float32, 1}(n)
for i in 1:n
    x[i] = i - 1
    y[i] = 1.0
end

val, t, bytes, gctime, memallocs = @timed for i in 1:count
    Allnix.axpy(a,x,y)
end

println("axpy{Float32} time: $t")
# I guess this is slower than Float64 because Julia uses
# Float64 internally
@test t <= 3.0
end

# - Int64 axpy - #
@testset "Int64" begin
n = 1000000
count = 1000
a::Int64 = 2
x = Array{Int64, 1}(n)
y = Array{Int64, 1}(n)
for i in 1:n
    x[i] = i - 1
    y[i] = 1
end

val, t, bytes, gctime, memallocs = @timed for i in 1:count
    Allnix.axpy(a,x,y)
end

println("axpy{Int64} time: $t")
@test t <= 1.2
end
# - Int32 axpy - #
@testset "Int32" begin
n = 1000000
count = 1000
a::Int32 = 2
x = Array{Int32, 1}(n)
y = Array{Int32, 1}(n)
for i in 1:n
    x[i] = i - 1
    y[i] = 1
end

val, t, bytes, gctime, memallocs = @timed for i in 1:count
    Allnix.axpy(a,x,y)
end

println("axpy{Int32} time: $t")
@test t <= 1.0
end
end
