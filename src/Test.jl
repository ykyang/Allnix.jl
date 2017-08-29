module Test

export init

"""
    init(n)

Generate two `Vector{Float64}` with some values for use in
array operation testing.

# Arguments
    `n::Int64`: length of the generated arrays

### Returns
    `(x::Vector{Float64}, y::Vector{Float64})`: Two arrays in a tuple
"""
function init(n::Int64)
    x = Array{Float64, 1}(n)
    y = Array{Float64, 1}(n)
    for i in 1:n
        x[i] = n
        y[i] = n
    end

    return x, y
end

function init{T}(x::Vector{T}, y::Vector{T})
    n::Int64 = length(x)

    for i in 1:n
        x[i] = n
        y[i] = n
    end

    return nothing
end

"""
    init()
Generate two `Vector{Float64}` with a size of `1,000,000`.

### returns
    `(x, y)`: Two arrays in a tuple
"""
function init()
    n::Int64 = 1000000
    return init(n)
end

end
