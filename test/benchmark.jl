using Allnix
using BenchmarkTools

function init(n::Int64)
    x = Array{Float64, 1}(n)
    y = Array{Float64, 1}(n)
    for i in 1:n
        x[i] = n
        y[i] = n
    end

    return x, y
end

function init()
    n::Int64 = 1000000
    return init(n)
end


function benchmark()
n = 1000000
a::Float64 = 0.5
x = Array{Float64, 1}(n)
y = Array{Float64, 1}(n)
for i in 1:n
    x[i] = n
    y[i] = n
end
end

b = @benchmarkable Allnix.daxpy(0.5, xy[1], xy[2]) setup=(xy = init(1000000))
t = BenchmarkTools.run(b, samples = 3)
show(STDOUT, "text/plain", t)
println()
# println(y[n])
# b = @benchmark Allnix.daxpy($a,$x,$y)
# println(b)
# println(y[n])
#
# println(minimum(b))
#
# dump(b)
# end

#benchmar()
