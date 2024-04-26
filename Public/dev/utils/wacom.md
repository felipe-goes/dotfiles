# Configuração da mesa digitalizadora Wacom

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
