using Allnix: axpy
using Allnix.Test: init!
using BenchmarkTools
using Base.Test


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

    # - Calculate the answer - #
    # - I want to double check the calculation is actually
    # - done in the benchmark code.
    init!(x, y)
    ans_1 = α*x[1] + y[1]
    ans_n = α*x[n] + y[n]

    b = @benchmarkable axpy($α, $x, $y) setup=(init!($x,$y))
    t = BenchmarkTools.run(b, samples = 3)
    show(STDOUT, "text/plain", t)
    print("\n\n")

    @test ans_1 == y[1]
    @test ans_n == y[n]
end

function axpy_ifelse(α::Float64, x::Vector{Float64}, y::Vector{Float64})
    @inbounds for i in 1:length(x)
        if x[i] < 0.5
            y[i] = α*x[i] + y[i]
        else
            y[i] = α*x[i] - y[i]
        end
    end
end

function run_axpy_ifelse(n::Int64, α::Float64)
    println("Testing axpy with if-else")
    x = Vector{Float64}(n)
    y = Vector{Float64}(n)

    b = @benchmarkable axpy_ifelse($α, $x, $y) setup(init!($x, $y))
    t = BenchmarkTools.run(b, samples = 3)
    show(STDOUT, "text/plain", t)
    print("\n\n")
end

function run()
    n::Int64 = 1000000
    run_axpy(n, 0.5)
    run_axpy(n, Float32(0.5))
    run_axpy(n, 2)
    run_axpy(n, Int32(2))

    run_axpy_ifelse(n, 0.5)
end

run()
