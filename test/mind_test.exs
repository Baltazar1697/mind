defmodule MindTest do
  use ExUnit.Case
  doctest Mind

  test "greets the world" do
    assert Mind.hello() == :world
  end
end
