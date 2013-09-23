defmodule Life do
	def nextGen life, neighbors do
		case neighbors do 
			n when n < 2 or n >= 4 -> :dead
			n -> :alive
		end
	end
	
	def to_string(:dead), do: "."
	def to_string(:alive), do: "*"
	
	def parse (char) do
		case char do
			"*" -> :alive
			"." -> :dead
		end
	end
end
