import PyPlot

function step_function(x)

  return map(Int, x .> 0)

end

X = collect(-5.0:0.1:5.0)
Y = step_function(X)
PyPlot.plot(X, Y)
PyPlot.ylim(-0.1, 1.1)
PyPlot.show()
