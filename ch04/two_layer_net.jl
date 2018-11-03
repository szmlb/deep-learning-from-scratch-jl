import PyPlot
using Random
include("../common/functions.jl")
include("gradient_2d.jl")

mutable struct TwoLayerNet

    params::Dict

    function TwoLayerNet(input_size,  hidden_size,  output_size,  weight_init_std)

        rng = MersenneTwister(1234)

        params = Dict()
        params["W1"] = weight_init_std * randn(rng, Float64,  (hidden_size,  input_size))
        params["b1"] = Array{Float64}(undef, hidden_size)
        params["W2"] = weight_init_std * randn(rng, Float64,  (output_size,  hidden_size))
        params["b2"] = Array{Float64}(undef, output_size)

        new(params)
    end

end

function main()

  input_size = 2
  hidden_size = 2
  output_size = 3
  weight_init_std = 0.01
  net = TwoLayerNet(input_size,  hidden_size,  output_size,  weight_init_std)
  print(net.params["W1"])

end

if occursin(PROGRAM_FILE, @__FILE__)
  main()
end
