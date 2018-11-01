import PyPlot
include("gradient_2d.jl")

function gradient_descent(f, init_x, lr, step_num)
    x = init_x
    x_history = x
    f_history = f(x)

    for i in 1:step_num

        grad = numerical_gradient(f, x)
        x = x - lr .* grad

        x_history = hcat(x_history, x)
        f_history = hcat(f_history, f(x))

    end

    return x, f, x_history, f_history
end

function function_2(x)
    return x' * x
end

function main_()

  init_x = [-3.0, 4.0]

  lr = 0.05
  step_num = 20
  x, f, x_history, f_history = gradient_descent(function_2, init_x, lr, step_num)

  xplt = collect(-5:0.25:5)
  yplt = collect(-5:0.25:5)
  X = repeat(xplt', length(xplt), 1)
  Y = repeat(yplt, 1, length(yplt))
  Z = X.^2+Y.^2

  PyPlot.plot_surface(X, Y, Z)
  PyPlot.plot3D(x_history[1, :], x_history[2, :], f_history[1, :])

  PyPlot.show()

end

if occursin(PROGRAM_FILE, @__FILE__)
    main_()
end
