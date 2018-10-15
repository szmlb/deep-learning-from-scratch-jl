import PyPlot

function _numerical_gradient_no_batch(f, x)
    h = 1e-4 # 0.0001
    grad = Array{Float64}(x, length(x))

    for idx in 1:length(x)
        tmp_val = x[idx]
        x[idx] = Float64(tmp_val) + h
        fxh1 = f(x) # f(x+h)

        x[idx] = tmp_val - h
        fxh2 = f(x) # f(x-h)
        grad[idx] = (fxh1 - fxh2) / (2*h)

        x[idx] = tmp_val # 値を元に戻す
    end

    return grad
end


function numerical_gradient(f, X)

    if length(X) == 1
        return _numerical_gradient_no_batch(f, X)
    else
        grad = Array{Float64}(X, length(X))

        for (idx, x) in enumerate(X)
            grad[idx] = _numerical_gradient_no_batch(f, x)
        end
    end

    return grad
end

function function_2(x)
    if length(x) == 1
        return sum(x^2)
    else
        return sum(x^2, 2)
    end
end

function tangent_line(f, x)
    d = numerical_diff(f, x)
    println(d)
    y = f(x) - d * x
    return (t) -> d * t + y
end

x0 = collect(-2.0:0.25:2.5)
x1 = collect(-2.0:0.25:2.5)

X = repeat(x0', outer=(length(x1),1))
Y = repeat(x1,  outer=(1,length(x0)))

X = collect(Iterators.flatten(X))
Y = collect(Iterators.flatten(Y))

grad = numerical_gradient(function_2, hcat(X, Y))
