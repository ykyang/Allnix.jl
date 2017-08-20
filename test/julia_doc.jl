using Allnix: Point, norm, distance

@testset "throw" begin
@test_throws DomainError throw(DomainError())
@test_throws ErrorException error("I am an ErrorException")
# try
#     error("Error")
# catch e
#     println(e)
# end
end

@testset "isa" begin
@test isa(13.0, Float64)
@test isa(13, Int64)
end

@testset "types" begin
@test 3 == (1+2)::Int64
@test_throws TypeError 3 == (1.0 + 2.0)::Int64
end

@testset "Point" begin
a::Point{Float64} = Point{Float64}(1,1)
b::Point{Float64} = Point{Float64}(2,2)

@test sqrt(2) == norm(a)
@test sqrt(8) == norm(b)

@test sqrt(2) == distance(a,b)
end


@testset "Vector" begin
a = Vector{Float64}()
length = 101

@test Base.length(a) == 0
@test isempty(a)

resize!(a, length)

@test Base.length(a) == length

# - zero an array - #
a[:] = zero(Float64)

for x in a
    @test x == 0
end

a[1] = 1325
a[length] = 0.123
@test a[1] == 1325
@test a[length] == 0.123

# - another way to zero an array - #
fill!(a, 0.::Float64)

for x in a
    @test x == 0
end

# - yet another way - #

a[1] = 1325
a[length] = 0.123
@test a[1] == 1325
@test a[length] == 0.123

# TODO: broadcast!
a .= 0
for x in a
    @test x == 0
end

end
