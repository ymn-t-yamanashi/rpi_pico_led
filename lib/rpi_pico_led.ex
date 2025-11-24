defmodule RpiPicoLed do
  @moduledoc """
  Documentation for `RpiPicoLed`.
  """
  @pin 25

  # コンパイルする際の警告を抑制する
  # AtomVMのライブラリGPIOが対象です
  @compile {:no_warn_undefined, [GPIO]}
  def start do
    IO.inspect("RpiPicoLed boot Ver 0.03")
    GPIO.init(@pin)
    GPIO.set_pin_mode(@pin, :output)
    loop(@pin, :low)
  end

  defp loop(pin, level) do
    GPIO.digital_write(pin, level)
    Process.sleep(100)
    loop(pin, toggle(level))
  end

  defp toggle(:high), do: :low
  defp toggle(:low), do: :high
end
