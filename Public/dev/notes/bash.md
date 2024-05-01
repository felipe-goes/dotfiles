# How to compare strings inside an if statement using bash script?

In a bash script, you can compare strings inside an `if` statement using the
`==` operator. Here's an example of how you can do it:

```bash
#!/bin/bash

string1="Hello"
string2="World"

if [ "$string1" == "$string2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi
```

In the above script:

- `string1` and `string2` are two strings that we want to compare.
- The `if` statement checks if `string1` is equal to `string2` using `==`.
- Make sure to enclose the variables within double quotes to avoid issues with
spaces or special characters.

You can also use `!=` to check for non-equality. Additionally, you can use other
comparison operators such as `<`, `>`, `-eq` (equal), `-ne` (not equal) if you
are comparing numerical values or for more complex string comparisons.

Remember, in bash scripting, whitespace matters, and proper quoting of variables
is essential to prevent unexpected behavior.

If you want to compare strings using a regex pattern, use `[[]]` and `=~`. In
this case, the code example updates to:

```bash
#!/bin/bash

string1="Hello"
string2="World"

if [[ "$string1" =~ "$string2" ]]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi
```

To negate the if statement just add `!` after `if`.
