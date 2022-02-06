# Split Join

This plugin is meant to simplify a task I've found too common in my workflow:
switching between a single-line statement and a multi line one. It offers the
following default keybindings, which can be customized:

* `gS` to split a one-liner into multiple lines
* `gJ` (with the cursor on the first line of a block) to join a block into a single-line statement.

The idea of this plugin is to introduce a single key binding (default: `gS`) for transforming a line like this:

``` html
<div id="foo">bar</div>
```

Into this:

``` html
<div id="foo">
  bar
</div>
```

And another binding (default: `gJ`) for the opposite transformation.

This currently works for various constructs in the following languages:

- C
- CSS
- Coffeescript
- Elixir
- Elm
- Eruby
- Go
- HAML
- HTML (and HTML-like markup)
- Handlebars
- Javascript (within JSX, TSX, Vue.js templates as well)
- JSON
- Lua
- PHP
- Perl
- Python
- Ruby
- Rust
- SCSS and Less
- Shell (sh, bash, zsh)
- Tex
- Vimscript
- YAML

For more information, including examples for all of those languages, try `:help
splitjoin`, or take a look at the full help file online at
[doc/splitjoin.txt](https://github.com/AndrewRadev/splitjoin.vim/blob/master/doc/splitjoin.txt)
