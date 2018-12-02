using Printf
include("layer_naive.jl")

function main()

  apple = 100
  apple_num = 2
  tax = 1.1

  mul_apple_layer = MulLayer()
  mul_tax_layer = MulLayer()

  # forward
  apple_price = forward(mul_apple_layer, apple, apple_num)
  price = forward(mul_tax_layer, apple_price, tax)

  # backward
  dprice = 1
  dapple_price, dtax = backward(mul_tax_layer, dprice)
  dapple, dapple_num = backward(mul_apple_layer, dapple_price)

  @printf "price: %d\n" price
  @printf "dApple: %lf\n" dapple
  @printf "dApple_num: %d\n" dapple_num
  @printf "dTax: %lf\n" dtax

end

if occursin(PROGRAM_FILE, @__FILE__)
  main()
end
