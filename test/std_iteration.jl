# - Julia online documentation
# - Collections and Data Structures
# - Iteration

using Base.Test
# ============================================= #
# -
# - Base.start(collection) -> iterator
# -
# - I personally do not like the terminology
# - used in Julia documentation.
# -
@testset "Base.start" begin
# --------------------------------------------- #
c = 1:5
# println(c) -> 1:5
@test length(c) == 5

it = Base.start(c)
@test it == 1::Int64
# println(typeof(state)) -> Int64

# --------------------------------------------- #
c = [1;2;3]
@test typeof(c) == Array{Int64, 1}
# println(c) -> [1, 2, 3] # Vector
@test length(c) == 3
@test ndims(c) == 1
@test size(c) == (3,) # tailing comma makes it a tuple

it = Base.start(c)
@test it == 1::Int64

# --------------------------------------------- #
c = [1 2 3]
@test typeof(c) == Array{Int64, 2}
# println(c) -> [1 2 3] # 1x3 matrix
@test length(c) == 3
@test ndims(c) == 2
@test size(c) ==(1,3)
@test size(c,1) == 1
@test size(c,2) == 3

it = Base.start(c)
@test it == 1::Int64

# --------------------------------------------- #
c = [3;2;1]
@test typeof(c) == Array{Int64, 1}
# println(c) -> [1, 2, 3] # Vector
@test length(c) == 3
@test ndims(c) == 1
@test size(c) == (3,) # tailing comma makes it a tuple

it = Base.start(c)
@test it == 1::Int64
end
# ============================================= #
# -
# - Base.done(collection, iterator) -> Bool
# -
@testset "Base.done" begin
c::Vector{Int64} = 1:5

# - done() returns true when
# - iterator is 1 pass the last index
it = 6::Int64
@test Base.done(c, it) == true

# - 2 pass the end is false
it = 7::Int64
@test Base.done(c, it) == false

# - Before the last index is definitely false
it = 3::Int64
@test Base.done(c, it) == false

it = 5::Int64
@test Base.done(c, it) == false
end
# ============================================= #
# - Base.next(collection, iterator) ->
# -   (item pointed by iterator, next_iterator)
@testset "Base.next" begin
c::Vector{Int64} = 5:-1:1
it = Base.start(c)
@test it == 1

item, it = Base.next(c, it)
@test item == 5
@test it == 2

# assign to a tuple
t = Base.next(c, it)
@test t[1] == 4 # item
@test t[2] == 3 # next iterator
end
# ============================================= #
@testset "Base iterator" begin
c::Vector{Int64} = 5:-1:1
@test Base.iteratorsize(c) == Base.HasShape()

@test Base.iteratoreltype(c) == Base.HasEltype()
end



# ============================================= #
# --------------------------------------------- #
