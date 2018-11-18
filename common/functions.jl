function identity_function(x)
    return x
end

function step_function(x)
    return map(Int, x .> 0)
end

function sigmoid(x)
  return 1 ./ (1 .+ exp.(-x))
end

function sigmoid_grad(x)
    return (1.0 .- sigmoid(x)) .* sigmoid(x)
end

function relu(x)
    return max.(0, x)
end

function relu_grad(x)
    return step_function(x)
end

function softmax(x)
    x_max = maximum(x)
    return exp.(x .- x_max) ./ sum(exp.(x .- x_max))
end

#=
function softmax(a)
    c = maximum(a)  # オーバーフロー対策
    exp_a = exp.(a .- c)
    sum_exp_a = sum(exp_a)
    return exp_a ./ sum_exp_a
end
=#

function mean_squared_error(y, t)
    return 0.5 * sum((y - t)^2)
end

function cross_entropy_error(y, t)

    # 教師データがone-hot-vectorの場合、正解ラベルのインデックスに変換
    if size(t) == size(y)
      t = mapslices(argmax, t, dims=1)
      t = t'
    end

    batch_size = length(y[1, :])

    #println(-sum(log.(y[t, collect(1:1:batch_size)])) / batch_size)

    return -sum(log.(y[t, collect(1:1:batch_size)])) / batch_size

end
