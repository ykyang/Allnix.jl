@testset "trunc" begin

@test trunc(Int64, 3.14) == 3
@test trunc(Int64, 3.41) == 3
@test trunc(Int64, 3.51) == 3
@test trunc(Int64, 3.91) == 3

end

@testset "round" begin
@test round(1.4) == 1
@test round(1.5) == 2
end

@testset "parse" begin
@test parse(Int64, "13") == 13
# Why would this work???
@test parse(Float64, "13.1415926") == 13.1415926
end
