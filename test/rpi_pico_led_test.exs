defmodule RpiPicoLedTest do
  use ExUnit.Case
  doctest RpiPicoLed

  test "greets the world" do
    assert RpiPicoLed.hello() == :world
  end
end
