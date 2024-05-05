# Manjaro

## Índice

1. [Mesa digitalizadora Wacom](#configuração-da-mesa-digitalizadora-wacom)
2. [xorg-xinput](#xorg-xinput)

## Configuração da mesa digitalizadora Wacom

[Link para comunidade Arch Linux](https://wiki.archlinux.org/title/wacom_tablet#Non-Wacom_tablets)

Nomes das telas na instalação atual:

- eDP1  (tela notebook)
- HDMI1 (tela monitor)

**device name**: Wacom Intuos PT S 2 Pen stylus

Para caneta:

```
xsetwacom set "Wacom Intuos PT S 2 Pen stylus" MapToOutput "eDP1"
xsetwacom set "Wacom Intuos PT S 2 Pen stylus" TabletPCButton "on"
xsetwacom set "Wacom Intuos PT S 2 Pen stylus" Mode "Absolute"
xsetwacom set "Wacom Intuos PT S 2 Pen stylus" PanScrollThreshold 1400
```

Para a função de touch

```
xsetwacom set "Wacom Intuos PT S 2 Finger touch" Touch off
```

**help**: `eg xsetwacom`


## xorg-xinput

Nesse [link](https://forum.manjaro.org/t/disable-touchpad-how/68746/3) um cara
explica como usar. Aqui em embaixo vou colocar um trecho da explicação para
desabilitar o touchpad do notebook.

list all xinput devices: xinput

Part of the ouput could look like this:

```
⎡ Virtual core pointer                          id=2    [master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
⎜   ↳ Logitech USB-PS/2 Optical Mouse           id=13   [slave  pointer  (2)]
⎜   ↳ ETPS/2 Elantech Touchpad                  id=17   [slave  pointer  (2)]
```

In this particular case my touchpad has id=17 and its full name is
“ETPS/2 Elantech Touchpad”.

The command to set a property is xinput set-prop. The property to enable or
disable the touchpad is Device Enabled, so to enable or disable it type:

Turn touchpad ON: `xinput set-prop <id> "Device Enabled" 1` (where <id> is your device id, in my case 17)

Turn touchpad OFF: `xinput set-prop <id> "Device Enabled" 0`

Turn palm detection ON: `xinput set-prop <id> "Palm Detection" 1`

Turn palm detection OFF: `xinput set-prop <id> "Palm Detection" 0`

To query available properties: `xinput list-props <id>` OR
`xinput list-props <full-name>`, this should be quite similair to synclient -l.

