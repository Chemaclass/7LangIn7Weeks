
# Anonynm functions can be written like:
inc = fn(x) -> x + 1 end
double_call = fn(x, f) -> f.(f.(x)) end

# Or a short way of writing functions:
add = &(&1 + &2)
inc = &(add.(&1, 1))
dec = &(add.(&1, -1))

# Composing with Pipes
x = 10
dec.(inc.(inc.(x)))
# this above is the same as:
10 |> inc.() |> inc.() |> dec.()

# Modules
defmodule Silly do
	IO.puts "Pointless existence"
end

defmodule Rectangle do
	area(w, h), do: h * w
    def perimeter(w, h), do: 2 * (w + h)
end
