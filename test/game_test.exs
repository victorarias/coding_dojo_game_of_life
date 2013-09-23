defmodule GameTest do
  use ExUnit.Case

  test "when . * ., then . . ." do
	current_gen = ". * ."
	
	next_gen = Game.next_gen(current_gen)
	
	assert next_gen == ". . ."
  end

  test "when * * *, then . * ." do
	current_gen = "* * *"
	
	next_gen = Game.next_gen(current_gen)
	
	assert next_gen == ". * ."
  end 

  test "maps . . . to [:dead, :dead, :dead]" do
    input = ". . ."
    mapped = Game.map_input(input)
    assert mapped == [:dead, :dead, :dead]
  end

  test "maps * * * to [:alive, :alive, :alive]" do
    input = "* * *"
    mapped = Game.map_input(input)
    assert mapped == [:alive, :alive, :alive]
  end

  test "maps * . * to [:alive, :dead, :alive]" do
    input = "* . *"
    mapped = Game.map_input(input)
    assert mapped == [:alive, :dead, :alive]
  end

  test "[:alive, :dead, :alive] mid cel has two alive neighbors" do
    alive_neighbors = Game.count_alive [:alive, :dead, :alive], 1
    assert alive_neighbors == 2 
  end

  test "[:alive, :dead, :alive] first cel has zero alive neighbors" do
    alive_neighbors = Game.count_alive [:alive, :dead, :alive], 0
    assert alive_neighbors == 0
  end
end
