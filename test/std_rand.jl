using Base
using Base.Test

@testset "Random Integer" begin
    src::Vector{Int64} = [62,21,65,27,78,23,97,53,38,67]
    count::Int64 = 10
    seed::UInt32 = 17
    r::UnitRange{Int64} = 1:100


    # - Generate a new array - #
    srand(seed) # - Seed the GLOBAL_RNG
    x::Vector{Int64} = rand(r, count)
    @test x == src

    # - In-place generation - #
    srand(seed) # - Seed the GLOBAL_RNG
    x = ones(x) # - Reset
    rand!(x, r)
    @test x == src
end

@testset "Random Float64" begin
    src::Vector{Float64} = [
        0.08110913680564935, 0.5205151824383689, 0.3607870878129784,
        0.5461467030095473, 0.9463823998310394, 0.004177010042717644,
        0.5210377372245407, 0.6744743681550878, 0.8823899341292194,
        0.3139038622430719]

    count::Int64 = 10
    seed::UInt32 = 17

    # - new array - #
    srand(seed)
    x::Vector{Float64} = rand(Float64, count)
    @test x == src

    # - In-place generation - #
    srand(seed)
    rand!(x)
    @test x == src
end
