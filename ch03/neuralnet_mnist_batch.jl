include("../common/functions.jl")

using JLD2, FileIO
import MLDatasets: MNIST

function get_data()

    x_test = MNIST.convert2features(MNIST.testtensor())
    t_test = MNIST.testlabels()

    #=
    # or ...
    x_test,  t_test = MNIST.testdata()
    x_test = reshape(x_test, Int(size(x_test[1]^2)),  size(x_test[3]))
    =#

    return x_test, t_test
end

function init_network()

  network = load("sample_network.jld2")
  return network

end

function predict(network, x)
    W1, W2, W3 = network["W1"], network["W2"], network["W3"]
    b1, b2, b3 = network["b1"], network["b2"], network["b3"]

    a1 = W1 * x .+ b1
    z1 = sigmoid(a1)
    a2 = W2 * z1 .+ b2
    z2 = sigmoid(a2)
    a3 = W3 * z2 .+ b3
    y = softmax(a3)

    return y
end

x, t = get_data()
network = init_network()
y = predict(network, x)
p = mapslices(argmax, y', dims=2)
print("Accuracy:", mean(p .== t))
