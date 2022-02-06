# vim-textobj-xmlattr

This vim plugin provides two text objects: `ax` and `ix`.<br>
They represent XML/HTML attributes.

It's based on (and **requires**)
[vim-textobj-user](http://github.com/kana/vim-textobj-user).

These attributes will work:

```html
<div class="box" id=footer data-updatable data-content="everything"></div>
```

`ix` works with the inner attribute, with no surrounding whitespace.  `ax` works
like `aw` does: it includes the whitespace **before** the attribute.  I know
that `aw` includes the whitespace *after*/*before* or whatever it finds more
fitty, but XML/HTML attributes always include whitespace before them, while they
do not always include whitespace after:

```xml
<some-tag with-only="one attribute"/>
```

When I `dix`, I want to be left with a valid XML/HTML tag, that's why I didn't
consider leading *and* trailing whitespaces.
