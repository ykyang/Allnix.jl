module Test

export init

"""
# Deprecated
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

"""
    init!(x, y)

Populate `x, y` with random numbers.

# Arguments
    `x::Vector{T}`: vector to be populated
    `y::Vector{T}`: vector to be populated

"""
function init!{T}(x::Vector{T}, y::Vector{T})
    n::Int64 = length(x)

    srand(17)
    rand!(x)
    rand!(y)
    # for i in 1:n
    #     x[i] = n
    #     y[i] = n
    # end

    return nothing
end

"""
    init!(x, y)

Populate `x, y` with random numbers between 1 and 10.

# Arguments
    `x::Vector{T<:Integer}`: vector to be populated
    `y::Vector{T<:Integer}`: vector to be populated

"""
function init!{T <: Integer}(x::Vector{T}, y::Vector{T})
    n::Int64 = length(x)
    
    srand(17)
    rand!(x, 1:10)
    rand!(y, 1:10)
    # for i in 1:n
    #     x[i] = n
    #     y[i] = n
    # end

    return nothing
end

"""
# Deprecated
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
