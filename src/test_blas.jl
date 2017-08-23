function test_daxpy()
    n = 1000000
    count = 1000
    a::Float64 = 0.5
    x = Array{Float64, 1}(n)
    y = Array{Float64, 1}(n)

    for i in 1:n
        x[i] = i-1
        y[i] = 1.0
    end

    @timev for j in 1:count
        @inbounds for i in 1:n
            y[i] = a*x[i] + y[i]
        end
    end

    println(y[n])
end

#@code_llvm
test_daxpy()
