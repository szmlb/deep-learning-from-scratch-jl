import PyPlot

function relu(x)

  return max.(0, x)

end

X = collect(-5.0:0.1:5.0)
Y = relu(X)
PyPlot.plot(X, Y)
PyPlot.ylim(-1.0, 5.5)
PyPlot.show()
