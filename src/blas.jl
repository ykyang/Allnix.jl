"""
  daxpy(alpha, x, y)

BLAS daxpy: y = alpha*x + y
"""
function daxpy(a::Float64, x::Vector{Float64}, y::Vector{Float64})
    @inbounds for i in 1:length(x)
        y[i] = a*x[i] + y[i]
    end
end

"""
    axpy(alpha, x, y)

Template version of BLAS axpy: y = alpha*x + y
"""
function axpy{T}(a::T, x::Vector{T}, y::Vector{T})
    @inbounds for i in 1:length(x)
        y[i] = a*x[i] + y[i]
    end
end
