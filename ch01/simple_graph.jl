import PyPlot

# データの作成
x = collect(0:0.1:6) # 0から6まで0.1刻みで生成
y = sin.(x)

# グラフの描画
PyPlot.plot(x, y)
PyPlot.show()
