lion.vim
========

Lion.vim is a tool for aligning text by some character. It defines some
Vim operators that can be used with motion commands to align a targeted
block of text.

The two operators are `gl` and `gL`. `gl` will add spaces to the left of
the alignment character, and `gL` will add spaces to the right. Both
operators accept a count, a motion, and a single character. Without a
count, all occurrences of the character will be aligned.

For example, `glip=` will turn

```php
$i = 5;
$username = 'tommcdo';
$stuff = array(1, 2, 3);
```

into

```php
$i        = 5;
$username = 'tommcdo';
$stuff    = array(1, 2, 3);
```

Typing `3gLi(,` with the cursor somewhere inside `(` and `)` will turn

```php
$names = array(
    'bill', 'samantha', 'ray', 'ronald',
    'mo', 'harry', 'susan', 'ted',
    'timothy', 'bob', 'wolverine', 'cat',
    'lion', 'alfred', 'batman', 'linus',
);
```

into

```php
$names = array(
    'bill',    'samantha', 'ray',       'ronald',
    'mo',      'harry',    'susan',     'ted',
    'timothy', 'bob',      'wolverine', 'cat',
    'lion',    'alfred',   'batman',    'linus',
);
```

It is also possible to align text by a pattern. To enter a pattern, use `/` as
the alignment character (e.g. `glip/`) and then you will be prompted to input
the pattern. To align by `/`, simply leave the pattern empty (by pressing
`Enter`).
