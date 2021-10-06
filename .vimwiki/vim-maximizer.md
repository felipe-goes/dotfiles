# Shortcuts for vim-maximizer

Maximizer has only one command:

~~~
:MaximizerToggle
~~~

Also the plugin can define some default mappings if the user wants to. By default it maps
to `<F3>` in normal, insert, and visual modes. See [Configuration](https://github.com/szw/vim-maximizer#configuration) to get some examples.

When the current window is not in maximized state, Vim-Maximizer saves dimensions and
positions of all windows in the current tab, and then it performs maximization of the
active window. The second time the command is invoked, Maximizer restores all windows to
the previously saved positions.

The toggle command can be invoked with a bang (!):

~~~
:MaximizerToggle!
~~~

The bang version forces the restoration of previously saved state (if any). It can be
used in case you did some changes in the maximized state layout and the current window is
not maximized anymore. Despite that, the bang version force restoration anyway. Notice,
the bang version can be set as the default one in your mappings.
