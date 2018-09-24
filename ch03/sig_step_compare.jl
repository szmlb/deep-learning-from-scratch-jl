import PyPlot

function sigmoid(x)

  return  1 ./ (1 .+ exp.(-x))

end

function step_function(x)

  return map(Int, x .> 0)

end

x = collect(-5.0:0.1:5.0)
y1 = sigmoid(x)
y2 = step_function(x)

PyPlot.plot(x, y1)
PyPlot.plot(x, y2, linestyle="--")
PyPlot.ylim(-0.1, 1.1)
PyPlot.show()
