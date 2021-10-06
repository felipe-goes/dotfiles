# Shortcuts for vim-commentary

Comment stuff out. Use `gcc` to comment out a line (takes a count), `gc` to comment out
the target of a motion (for example, `gcap` to comment out a paragraph), `gc` in visual
mode to comment out the selection, and `gc` in operator pending mode to target a comment.
You can also use it as a command, either with a range like `:7,17Commentary`, or as part
of a `:global` invocation like with `:g/TODO/Commentary`. That's it.

I wrote this because 5 years after Vim added support for mapping an operator, I still
couldn't find a commenting plugin that leveraged that feature (I overlooked tcomment.vim).
Striving for minimalism, it weighs in at under 100 lines of code.

Oh, and it uncomments, too. The above maps actually toggle, and `gcgc` uncomments a set
of adjacent commented lines.
