@everywhere include("count_heads.jl")
#a = @spawn count_heads(100000000)
#b = @spawn count_heads(100000000)
#println(fetch(a) + fetch(b))

function par(n::Int64, x::SharedArray{Float64}, y::SharedArray{Float64})
    fe = @inbounds @parallel  for i in 1:n
       y[i] = 0.5*x[i] + y[i]
    end
    return fe
end

function ser(n::Int64, x::SharedArray{Float64}, y::SharedArray{Float64})
    @inbounds for i in 1:n
       y[i] = 0.5*x[i] + y[i]
    end
end

function init(n::Int64, x::SharedArray{Float64}, y::SharedArray{Float64})
    for i in 1:n
        x[i] = i
        y[i] = 1.0
    end
end
count = 10
n = 1000000
y = SharedArray{Float64}(n)
x = SharedArray{Float64}(n)

println(procs(y))

init(n, x, y)

@time for j in 1:count
    @sync begin
        fe = par(n, x, y)
    end
    # for f in fe
    #     fetch(f)
    # end
end


println(y[n])


# for i = 1:n
#    c[i] = 0.
# end
init(n, x, y)

@time for j in 1:count
    ser(n, x, y)
end
println(y[n])
