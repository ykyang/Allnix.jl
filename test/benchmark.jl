using Allnix: axpy
using Allnix.Test: init
using BenchmarkTools


# b = @benchmarkable Allnix.daxpy(0.5, xy[1], xy[2]) setup=(xy = init{Float64}())
# t = BenchmarkTools.run(b, samples = 3)
# show(STDOUT, "text/plain", t)
# println()

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

function run_axpy{T}(n::Int64, α::T)
#    t = typeof(α)
    println("Testing axpy with typeof $(typeof(α))")
    x = Vector{T}(n)
    y = Vector{T}(n)

    b = @benchmarkable axpy($α, $x, $y) setup=(init($x,$y))
    t = BenchmarkTools.run(b, samples = 3)
    show(STDOUT, "text/plain", t)
    print("\n\n")
    # println(y[n])
end


function run()
    n::Int64 = 1000000
    run_axpy(n, 0.5)
    run_axpy(n, Float32(0.5))
    run_axpy(n, 2)
    run_axpy(n, Int32(2))
end

run()
