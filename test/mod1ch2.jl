# - Julia: High Performance Programming
# - Module 1 Chapter 2

@testset "trunc" begin

@test trunc(Int64, 3.14) == 3
@test trunc(Int64, 3.41) == 3
@test trunc(Int64, 3.51) == 3
@test trunc(Int64, 3.91) == 3

end

@testset "add" begin
@test add(1,2) == 3
@test add(1.0, 2.0) ≈ 3.0 # type \approx and use tab complete
@test isapprox(3.0, add(1.0,2.0))
end
