import PyPlot
using Random
include("../common/functions.jl")
include("gradient_2d.jl")

mutable struct simpleNet

    W::Array{Float64}

    function simpleNet()
        #rng = MersenneTwister(1234)
        rng = MersenneTwister()
        W = randn(rng, Float64,  (3,  2))
        new(W)
    end

end

function predict(net::simpleNet, x)
    return net.W * x
end

function loss(net::simpleNet, x, t)
    z = predict(net, x)
    y = softmax(z)
    loss = cross_entropy_error(y, t)

    return loss
end

function main()

  x = zeros(Float64, (2, 1))
  x[1, 1] = 0.6
  x[2, 1] = 0.9

  t = zeros(Int, (3, 1))
  t[1, 1] = 0
  t[2, 1] = 0
  t[3, 1] = 1

  #x = [0.6, 0.9]
  #t = [0, 0, 1]

  net = simpleNet()

  f = (w) -> loss(net, x, t) # (f関数名) = (引数名) -> (返り値)
  dW = numerical_gradient_(f, net.W)

  print(dW)

end

if occursin(PROGRAM_FILE, @__FILE__)
  main()
end
