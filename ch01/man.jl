mutable struct Man
    # サンプルクラス

    name::String

    function Man(name)
        println("Initialized!")
        new(name)
    end

end

function hello(m::Man)
  println("Hello ", m.name, "!")
end

function goodbye(m::Man)
  println("Good-bye ", m.name, "!")
end

m = Man("David")
hello(m)
goodbye(m)
