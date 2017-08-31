using Base.Test

@testset "Construction and Initialization" begin
# ============================================= #
@testset "reshape" begin
    a::Array{Float64,3} = Array{Float64,3}(3,3,3)

    # - reshape - #
    a = reshape(1:27,3,3,3)
    # - same as the code below
    # value::Int64 = 1
    # for k in 1:3
    #     for j in 1:3
    #         for i in 1:3
    #             a[i,j,k] = value
    #             value += 1
    #         end
    #     end
    # end
    @test a[1,1,1] ≈ 1.
    @test isapprox(a[2,1,1], 2.)
    @test a[3,3,3] ≈ 27.
end
# ============================================= #
# - Comprehension - #
@testset "Comprehensions" begin
    # a =
    # [1.0 4.0 7.0;
    #  2.0 5.0 8.0;
    #  3.0 6.0 9.0]
    # [10.0 13.0 16.0;
    #  11.0 14.0 17.0;
    #  12.0 15.0 18.0]
    # [19.0 22.0 25.0;
    #  20.0 23.0 26.0;
    #  21.0 24.0 27.0]
    a::Array{Float64,3} = Float64[i+3(j-1)+9(k-1) for i=1:3, j=1:3, k=1:3]
    @test a[1,1,1] ≈ 1.
    @test isapprox(a[2,1,1], 2.)
    @test a[3,3,3] ≈ 27.
end
# ============================================= #
end
