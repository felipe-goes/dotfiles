package reverse

// https://www.youtube.com/watch?v=biGAfK6OElE
// 14 Ways to Reverse a String! (And solve the exercise on Exercism)

import "bytes"

func Reverse(input string) string {
	var buffer bytes.Buffer
	reversed := []rune(input)
	for i := len(reversed) - 1; i >= 0; i-- {
		buffer.WriteRune(reversed[i])
	}
	return buffer.String()
}
