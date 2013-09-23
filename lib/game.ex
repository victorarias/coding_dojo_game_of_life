defmodule Game do
	def next_gen(current_gen) do
	  cels = map_input(current_gen)
	  cels
	    |> Enum.with_index
	    |> Enum.map(fn 
			{ elem, index } -> Life.nextGen(elem, count_alive(cels, index)) 
		end)
		|> Enum.map(Life.to_string(&1))
		|> Enum.join " "
	end
	
	def map_input(input) do
	  String.split(input, " ")
	  |> Enum.map fn
		"." -> :dead
		"*" -> :alive
		end
	end
	
	def count_alive(cells, index) do
	  [index - 1, index + 1] 
	    |> Enum.filter(&1 > -1)
	    |> Enum.map(Enum.at(cells, &1)) 
	    |> Enum.filter(&1 == :alive) 
	    |> Enum.count
	end
end