import PyPlot

function sigmoid(x)

  return 1 ./ (1 .+ exp.(-x))

end

X = collect(-5.0:0.1:5.0)
Y = sigmoid(X)
PyPlot.plot(X, Y)
PyPlot.ylim(-0.1, 1.1)
PyPlot.show()
