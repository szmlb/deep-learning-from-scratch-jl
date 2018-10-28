import PyPlot
include("gradient_2d.jl")

function gradient_descent(f, init_x, lr, step_num)
    x = init_x
    x_history = x

    for i in 1:step_num

        grad = numerical_gradient(f, x)
        x = x - lr .* grad

        x_history = hcat(x_history, x)

    end

    return x, x_history
end

function function_2(x)
    return x' * x
end

function main()

  init_x = [-3.0, 4.0]

  lr = 0.1
  step_num = 20
  x, x_history = gradient_descent(function_2, init_x, lr, step_num)

  PyPlot.plot( [-5, 5], [0, 0], "--b")
  PyPlot.plot( [0, 0], [-5, 5], "--b")
  PyPlot.plot(x_history[1, :], x_history[2, :], "o")

  PyPlot.xlim(-3.5, 3.5)
  PyPlot.ylim(-4.5, 4.5)
  PyPlot.xlabel("X0")
  PyPlot.ylabel("X1")
  PyPlot.show()

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
