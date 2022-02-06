# Sayonara

This plugin provides a single command that deletes the current buffer and
handles the current window in a smart way.

Basically you don't have to think in terms of `:bdelete`, `:close`, `:quit` etc.
anymore. The plugin does that for you.

It reduces cognitive load and lets you focus on the main task: editing text.

    :Sayonara

This deletes the current buffer and closes the current window.

    :Sayonara!

This deletes the current buffer and preserves the current window.

## Keybiding

- `<leader>q` = :Sayonara!
