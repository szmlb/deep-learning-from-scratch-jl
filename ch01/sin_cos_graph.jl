import PyPlot

# データの作成
x = collect(0:0.1:6) # 0から6まで0.1刻みで生成
y1 = sin.(x)
y2 = cos.(x)

# グラフの描画
PyPlot.plot(x, y1, label="sin")
PyPlot.plot(x, y2, linestyle="--", label="cos")
PyPlot.xlabel("x") # x軸のラベル
PyPlot.ylabel("y") # y軸のラベル
PyPlot.title("sin & cos")
PyPlot.legend()
PyPlot.show()
