module Allnix

function loop(count::Int64 = 1000)
    n = 1000001

    x = Array{Float64,1}(n)
    y = Array{Float64,1}(n)
    a = 0.5::Float64
    for i in 1:n
        x[i] = i-1
        y[i] = 1.0
    end

    #tic()

    @timev for j in 1:count
    #    y = a*x + y # this is slower
         @inbounds for i in 1:n
            y[i] = a*x[i] + y[i]
        end
    end
    #toc()

    println(y[n])
end

# package code goes here
include("mod1ch2.jl")
include("julia_doc.jl")
include("blas.jl")

#@code_llvm loop(1000)



end # module
