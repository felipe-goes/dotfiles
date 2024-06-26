package logs

import (
	"bytes"
	"fmt"
	"unicode/utf8"
)

// Application identifies the application emitting the given log.
func Application(log string) string {
	for _, v := range log {
		unicode := fmt.Sprintf("%U", v)
		switch {
		case unicode == "U+2757":
			return "recommendation"
		case unicode == "U+1F50D":
			return "search"
		case unicode == "U+2600":
			return "weather"
		}
	}
	return "default"
}

// Replace replaces all occurrences of old with new, returning the modified log
// to the caller.
func Replace(log string, oldRune, newRune rune) string {
	var buffer bytes.Buffer
	for _, v := range log {
		if v == oldRune {
			buffer.WriteString(string(newRune))
		} else {
			buffer.WriteString(string(v))
		}
	}
	return buffer.String()
}

// WithinLimit determines whether or not the number of characters in log is
// within the limit.
func WithinLimit(log string, limit int) bool {
	return utf8.RuneCountInString(log) <= limit
}
