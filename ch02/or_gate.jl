function AND(x1, x2)
    x = [x1, x2]
    w = [0.5, 0.5]
    b = -0.2
    tmp = w'*x + b
    if tmp <= 0
        return 0
    else
        return 1
    end
end

if occursin(PROGRAM_FILE, @__FILE__)
    for xs in [[0, 0], [1, 0], [0, 1], [1, 1]]
        y = AND(xs[1], xs[2])
        println(xs, " -> ", y)
    end
end
