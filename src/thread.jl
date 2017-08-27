function print_id()
    a::Array{Int64} = zeros(10)

    Threads.@threads for i = 1:10
        a[i] = Threads.threadid()
    end
    println(a)
end

function init(n::Int64, x::Vector{Float64}, y::Vector{Float64})
    for i in 1:n
        x[i] = i-1
        y[i] = 1.0
    end
end

function taxpy(n::Int64, a::Float64, x::Vector{Float64}, y::Vector{Float64})
    @inbounds Threads.@threads for i in 1:n
        if x[i] < n/2.
            y[i] = a*x[i] + y[i]
        else
            y[i] = a*x[i] + y[i] + 10.
        end
    end
end

function saxpy(n::Int64, a::Float64, x::Vector{Float64}, y::Vector{Float64})
    @inbounds for i in 1:n
        if x[i] < n/2.
            y[i] = a*x[i] + y[i]
        else
            y[i] = a*x[i] + y[i] + 10.
        end
    end
end

function driver()
    println("Thread count = $(Threads.nthreads())")
    count = 1000
    n::Int64 = 1000000
    a::Float64 = 0.5
    y::Array{Float64} = Array{Float64}(n)
    x::Array{Float64} = Array{Float64}(n)

    init(n, x, y)

    @time for j in 1:count
        taxpy(n, a, x, y)
    end

    println("y = $(y[n])")

    init(n, x, y)

    @time for j in 1:count
        saxpy(n, a, x, y)
    end

    println("y = $(y[n])")
end

#print_id()
driver()
