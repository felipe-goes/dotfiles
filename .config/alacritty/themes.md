# Installation

## Imports

Clone the repository, or download the theme of your choice:

```
We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone git@github.com:alacritty/alacritty-theme.git ~/.config/alacritty/themes
```

Add an import to your `alacritty.toml` (Replace `{theme}` with your desired
colorscheme):

```
import = [
    "~/.config/alacritty/themes/themes/{theme}.toml"
]
```
