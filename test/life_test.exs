defmodule LifeTest do
  use ExUnit.Case

  test "Alive dies without neighbors" do
	life = Life.nextGen(:alive, 0)
    assert life == :dead
  end

  test "Alive dies with just one neighbor" do
	life = Life.nextGen(:alive, 1)
    assert life == :dead
  end

  test "Stay alive with two neighbors" do
  	life = Life.nextGen(:alive, 2)
	assert life == :alive
  end

  test "alive dies when neighbors equals 4" do
    life = Life.nextGen(:alive, 4)
    assert life == :dead
  end

  test "alive dies when neighbors equals 5" do
    life = Life.nextGen(:alive, 5)
    assert life == :dead
  end

  test "when dead, if neighbors equals 3, then it is born" do
	life = Life.nextGen(:dead, 3)
    assert life == :alive
  end

  test "when dead, show as ." do
	symbol = Life.to_string(:dead)
	assert symbol == "."
  end

  test "when alive, show as *" do
    symbol = Life.to_string(:alive)
    assert symbol == "*"
  end

  test "when . returns dead" do
	symbol = Life.parse(".")
	assert symbol == :dead
  end

  test "when * returns alive" do
    symbol = Life.parse("*")
    assert symbol == :alive
  end
end
