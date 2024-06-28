package prime

import (
	"errors"
	"math"
)

// Nth returns the nth prime number. An error must be returned if the nth prime
// number can't be calculated ('n' is equal or less than zero)
func Nth(n int) (int, error) {
	if n < 1 {
		return 0, errors.New("n should be greater than 0")
	}

	// setup to start test with 2
	nth := 0
	prime := 2

	for {
		if isPrime(prime) {
			nth++
		}

		// found the nth prime
		if nth == n {
			return prime, nil
		}

		// test next number
		prime++
	}
}

func isPrime(prime int) bool {
	sqrt := int(math.Sqrt(float64(prime)))

	// loop to test if prime
	for i := 2; i <= sqrt; i++ {
		if prime%i == 0 {
			return false
		}
	}
	return true
}
