using DataStructures: Deque

@testset "Deque" begin
a = Deque{Float64}()

@test isempty(a)
@test length(a) == 0

push!(a, 13)

@test !isempty(a)
@test length(a) == 1

end
