# Regex 101

[For validating regex expression](https://regex101.com/)

## Tips

- Use `+` to match any number of the character before until it hits a different
  character.
- Use `|` for using _or_ logic.
- Use `[a-z]` to match a range of characters.
  - You can also use `[A-Z]` and `[0-9]`.
- Put `(?i)` at the begining of an expression to use case insensitive.
- Check Go's exercism `parsing-log-files` for examples.

## Summary

Regular expressions are case-sensitive: a lowercase _a_ is distinct from an
uppercase _A_. You can enclose a range of characters in square brackets to
match against all of those characters. For example:

| Expression  | Description                                                                         |
| ----------- | ----------------------------------------------------------------------------------- |
| [tT]here    | matches against "There" and "there"                                                 |
| []          | may also be used on a range of characters separated by a – character.               |
| [0-9]       | matches any digit.                                                                  |
| [A-Z]       | matches any uppercase alpha character                                               |
| [A-Za-z0-9] | matches any alphanumeric character                                                  |
| ^           | is the "not" character, so [^0-9] matches against any character that is not a digit |

Although you can use ranges to specify a group of characters, you can also use
the following shortcuts:

| Expression | Description                                                                           |
| ---------- | ------------------------------------------------------------------------------------- |
| .          | matches against any character                                                         |
| \d         | matches against a digit [0-9]                                                         |
| \D         | matches against a non-digit [^0-9]                                                    |
| \s         | matches against a whitespace character (such as a tab, space, or line feed character) |
| \S         | matches against a non-whitespace character                                            |
| \w         | matches against an alphanumeric character [a-zA-Z\_0-9]                               |
| \W         | matches against a non-alphanumeric character                                          |
| \x*hh*     | matches against a control character (for the hexadecimal character _hh_)              |
| \u*hhhh*   | matches against a Unicode character (for the hexadecimal character _hhhh_)            |

To match against occurrences of a character or expression, you can use the following.

| Expression | Description                                                                      |
| ---------- | -------------------------------------------------------------------------------- |
| \*         | matches against zero or more occurrences of the previous character or expression |
| +          | matches against one or more occurrences of the previous character or expression  |
| ?          | matches zero or one occurrences of the previous character or expression          |
| (n)        | matches n occurrences of the previous character or expression                    |
| (n,m)      | matches from n to m occurrences of the previous character or expression          |
| (n,)       | matches at least n occurrences of the previous character or expression           |
