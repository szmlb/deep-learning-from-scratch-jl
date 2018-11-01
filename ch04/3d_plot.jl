import PyPlot

function main()

  xplt = collect(-3:0.25:3)
  yplt = collect(-3:0.25:3)
  X = repeat(xplt', length(xplt), 1)
  Y = repeat(yplt, 1, length(yplt))
  Z = sin.(X)+cos.(Y)

  PyPlot.plot_surface(X, Y, Z)
  PyPlot.show()

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
