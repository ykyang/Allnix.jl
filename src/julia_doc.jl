
# - Parametric type - #
type Point{T}
    x::T
    y::T
end

# - Passing parametric type argument - #
function norm{T<:Real}(point::Point{T})
    sqrt(point.x^2 + point.y^2)
end

function distance{T<:Real}(a::Point{T}, b::Point{T})
    sqrt((a.x - b.x)^2 + (a.y - b.y)^2)
end
