# - Julia: High Performance Programming
# - Module 1 Chapter 2

@testset "trunc" begin
    @test trunc(Int64, 3.14) == 3
    @test trunc(Int64, 3.41) == 3
    @test trunc(Int64, 3.51) == 3
    @test trunc(Int64, 3.91) == 3
end
