# - Julia: High Performance Programming
# - Module 1 Chapter 2

using Allnix: add, power, fpower, fplus

@testset "add" begin
# int comparison
@test add(1,2) == 3

# - Floating point comparison - #

# type \approx and use tab complete to get ≈
@test add(1.0, 2.0) ≈ 3.0
# or use isapprox() function
@test isapprox(3.0, add(1.0,2.0))

# Exact floating point in some cases
@test add(1.0, 2.0) == 3.0
end

@testset "power" begin
@test power(2,2) == 4
@test power(2.0, 2.0) == 4.0
@test fpower(2.0, 2.0) == 4.0
end

@testset "fplus" begin
@test fplus(1,2,3) == 6
end

# ---------------------- #
# - Variable arguments - #
# ---------------------- #
@testset "varargs" begin
args = [1,2]
# Notice the ellipses
@test add(args...) == 3
end
