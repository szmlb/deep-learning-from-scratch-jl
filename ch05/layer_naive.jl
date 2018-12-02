mutable struct MulLayer

    x::Float64
    y::Float64

    function MulLayer()

        x = 0.0
        y = 0.0

        new(x, y)

    end

end

function forward(self::MulLayer, x, y)

  self.x = x
  self.y = y
  out = x * y

  return out

end

function backward(self::MulLayer, dout)

  dx = dout * self.y
  dy = dout * self.x

  return dx, dy

end

mutable struct AddLayer

    function AddLayer()
        # do nothing
        new()
    end

end

function forward(self::AddLayer, x, y)

  out = x + y

  return out

end

function backward(self::AddLayer, dout)

  dx = dout * 1
  dy = dout * 1

  return dx, dy

end
