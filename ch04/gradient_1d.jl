import PyPlot

function numerical_diff(f, x)
    h = 1e-4 # 0.0001
    return (f(x+h) .- f(x-h)) ./ (2*h)
end

function function_1(x)
    return 0.01 .* x.^2 .+ 0.1 .* x
end

function tangent_line(f, x)
    d = numerical_diff(f, x)
    println(d)
    y = f(x) .- d .* x
    return (t) -> d .* t .+ y
end

x = collect(0.0:0.1:20.0)
y = function_1(x)

PyPlot.xlabel("x")
PyPlot.ylabel("f(x)")

tf = tangent_line(function_1, 5)
y2 = tf(x)

PyPlot.plot(x, y)
PyPlot.plot(x, y2)
PyPlot.show()
