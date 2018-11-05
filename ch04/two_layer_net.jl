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
        params["b1"] = zeros(Float64, hidden_size)
        params["W2"] = weight_init_std * randn(rng, Float64,  (output_size,  hidden_size))
        params["b2"] = zeros(Float64, output_size)

        new(params)

    end

end

function predict(self::TwoLayerNet, x)

    W1, W2 = self.params["W1"], self.params["W2"]
    b1, b2 = self.params["b1"], self.params["b2"]

    a1 = W1 * x + b1
    z1 = sigmoid(a1)
    a2 = W2 * z1 + b2
    y = softmax(a2)

    return y

end

function loss(self::TwoLayerNet, x, t)

    y = predict(self, x)

    return cross_entropy_error(y, t)

end

function accuracy(self::TwoLayerNet)

    y = predict(self, x)

    y = mapslices(argmax, y, dims=1)
    y = y'
    t = mapslices(argmax, t, dims=1)
    t = t'

    accuracy_cnt = 0
    for i in 1:length(x[:, 1])
        if y[i] == t[i]
            accuracy_cnt += 1
        end
    end

    return Float64(accuracy_cnt) / length(x[:, 1])

end

# x:入力データ, t:教師データ
function numerical_gradient(self::TwoLayerNet, x, t)

    loss_W = (W) -> loss(self, x, t) # (f関数名) = (引数名) -> (返り値)

    grads = Dict()
    grads["W1"] = numerical_gradient_(loss_W, self.params["W1"])
    grads["b1"] = numerical_gradient_(loss_W, self.params["b1"])
    grads["W2"] = numerical_gradient_(loss_W, self.params["W2"])
    grads["b2"] = numerical_gradient_(loss_W, self.params["b2"])

    return grads

end

#=
function gradient(self::TwoLayerNet, x, t)

    W1, W2 = self.params["W1"], self.params["W2"]
    b1, b2 = self.params["b1"], self.params["b2"]
    grads = Dict()

    batch_num = length(x[1, :])

    # forward
    a1 = W1 * x + b1
    z1 = sigmoid(a1)
    a2 = W2 * z1 + b2
    y = softmax(a2)

    # backward
    dy = (y - t) / batch_num
    grads["W2"] = z1' * dy
    grads["b2"] = sum(dy, dims=1)

    da1 = W2 * dy
    dz1 = sigmoid_grad(a1) * da1
    grads["W1"] = x' * dz1
    grads["b1"] = sum(dz1, dims=1)

    return grads

end
=#

function main()

  input_size = 2
  hidden_size = 2
  output_size = 3
  weight_init_std = 0.01
  net = TwoLayerNet(input_size,  hidden_size,  output_size,  weight_init_std)

end

if occursin(PROGRAM_FILE, @__FILE__)
  main()
end
