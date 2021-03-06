import PyPlot
using Printf
using Random
include("two_layer_net.jl")
import MLDatasets: MNIST

function num2onehot(num_array, max_num)

  onehot_array = zeros(Int, (max_num, length(num_array)))

  for i in 1:length(num_array)
    for j in 1:max_num
      if j == num_array[i]
        onehot_array[j, i] = 1
      else
        onehot_array[j, i] = 0
      end
    end
  end

  return onehot_array

end

function main()

    x_train = MNIST.convert2features(MNIST.traintensor())
    t_train = MNIST.trainlabels()
    t_train = num2onehot(t_train, 10)

    input_size = 784
    hidden_size = 50
    output_size = 10
    weight_init_std = 0.01
    network = TwoLayerNet(input_size, hidden_size, output_size, weight_init_std)

    iters_num = 10000  # 繰り返しの回数を適宜設定する
    train_size = size(x_train)[2]
    batch_size = 100
    learning_rate = 0.1

    train_loss_list = []
    train_acc_list = []
    test_acc_list = []

    iter_per_epoch = max(train_size / batch_size, 1)

    rng = MersenneTwister()
    for i in 1:iters_num

        batch_mask = rand(1:train_size,  batch_size)

        x_batch = x_train[:, batch_mask]
        t_batch = t_train[:, batch_mask]

        #println(x_batch)
        #println(t_batch)

        # 勾配の計算
        #grad = numerical_gradient(network, x_batch, t_batch) # slow
        grad = gradient(network, x_batch, t_batch) # fast

        # パラメータの更新
        for key in ["W1", "b1", "W2", "b2"]
            network.params[key] -= learning_rate * grad[key]
        end

        loss_ = loss(network, x_batch, t_batch)
        println(loss_)
        push!(train_loss_list, loss_)

        if (i-1) % iter_per_epoch == 0
            train_acc = accuracy(network, x_train, t_train)
            #test_acc = accuracy(network, x_test, t_test)
            push!(train_acc_list, train_acc)
            #push!(test_acc_list, test_acc)
            @printf "Iteration no. %d" i
            @printf "train acc | %lf" train_acc
        end

    end

end

if occursin(PROGRAM_FILE, @__FILE__)
  main()
end
