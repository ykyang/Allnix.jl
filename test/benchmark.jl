using Allnix
using Allnix.Test: init
using BenchmarkTools


b = @benchmarkable Allnix.daxpy(0.5, xy[1], xy[2]) setup=(xy = init())
t = BenchmarkTools.run(b, samples = 3)
show(STDOUT, "text/plain", t)
println()
# println(y[n])
# b = @benchmark Allnix.daxpy($a,$x,$y)
# println(b)
# println(y[n])
#
# println(minimum(b))
#
# dump(b)
# end

#benchmar()
