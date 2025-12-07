defmodule RpiPicoLed03 do
  @moduledoc """
  Documentation for `RpiPicoLed`.
  """
  @led_on_sec 150
  @blue_pin 2
  @yellow_pin 3
  @red_pin 4

  # コンパイルする際の警告を抑制する
  # AtomVMのライブラリGPIOが対象です

  def start do
    init(@blue_pin)
    init(@yellow_pin)
    init(@red_pin)
    spawn(fn -> on_off(@blue_pin, 1000) end)
    spawn(fn -> on_off(@yellow_pin, 500) end)
    spawn(fn -> on_off(@red_pin, 250) end)
    loop()
  end

  defp loop() do
    Process.sleep(1000)
    loop()
  end

  @compile {:no_warn_undefined, [GPIO]}
  defp init(pin) do
    GPIO.init(pin)
    GPIO.set_pin_mode(pin, :output)
  end

  @compile {:no_warn_undefined, [GPIO]}
  defp on_off(pin, sec) do
    GPIO.digital_write(pin, :high)
    Process.sleep(@led_on_sec)
    GPIO.digital_write(pin, :low)
    Process.sleep(sec - @led_on_sec)
    on_off(pin, sec)
  end
end
