import PyPlot
using Random
include("two_layer_net.jl")
import MLDatasets: MNIST

function main()

    x_train = MNIST.convert2features(MNIST.traintensor())
    t_train = MNIST.trainlabels()

    input_size = 784
    hidden_size = 50
    output_size = 10
    weight_init_std = 0.01
    network = TwoLayerNet(input_size, hidden_size, output_size, weight_init_std)

    iters_num = 10000  # 繰り返しの回数を適宜設定する
    train_size = size(x_train)[1]
    batch_size = 100
    learning_rate = 0.1

    train_loss_list = []
    train_acc_list = []
    test_acc_list = []

    iter_per_epoch = max(train_size / batch_size, 1)

end

if occursin(PROGRAM_FILE, @__FILE__)
  main()
end
