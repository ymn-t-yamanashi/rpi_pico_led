defmodule RpiPicoLed02 do
  @moduledoc """
  Documentation for `RpiPicoLed`.
  """
  @blue_pin 2
  @yellow_pin 3
  @red_pin 4

  # コンパイルする際の警告を抑制する
  # AtomVMのライブラリGPIOが対象です

  def start do
    init(@blue_pin)
    init(@yellow_pin)
    init(@red_pin)
    loop()
  end

  defp loop() do
    on_off(@blue_pin)
    flashes(@yellow_pin, :low, 20)
    on_off(@red_pin)
    loop()
  end

  @compile {:no_warn_undefined, [GPIO]}
  defp init(pin) do
    GPIO.init(pin)
    GPIO.set_pin_mode(pin, :output)
  end

  @compile {:no_warn_undefined, [GPIO]}
  defp on_off(pin) do
    GPIO.digital_write(pin, :high)
    Process.sleep(5000)
    GPIO.digital_write(pin, :low)
  end

  @compile {:no_warn_undefined, [GPIO]}
  defp flashes(pin, _level, 0), do: GPIO.digital_write(pin, :low)

  defp flashes(pin, level, flashes_count) do
    GPIO.digital_write(pin, level)
    Process.sleep(200)
    flashes(pin, toggle(level), flashes_count - 1)
  end

  defp toggle(:high), do: :low
  defp toggle(:low), do: :high
end
