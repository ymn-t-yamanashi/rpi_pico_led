# Elixir(AtomVM)でLチカ　〜 Raspberry Pi Pico 〜


### 開発環境
- Ubuntu 24.04
- Elixir 1.17.1-otp-27
- Erlang 27.2.1
- Raspberry Pi Pico

### ビルド

```
$ mix deps.get
$ mix atomvm.uf2create --family_id rp2040
```

### Raspberry Pi Picoにビルド結果を転送
- Raspberry Pi Picoをリセットボタンを押しなら、USBを差し込むとフォルダーが表示されます
- rpi_pico_led.uf2をRPI-RP2にコピーします
- コピーが完了すると自動でアンマウントします
- 数秒するとLEDが点滅します
