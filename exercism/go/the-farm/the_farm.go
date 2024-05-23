package thefarm

import (
	"errors"
	"fmt"
)

func DivideFood(fc FodderCalculator, cows int) (float64, error) {
	fodder, err := fc.FodderAmount(cows)
	if err != nil {
		return 0, err
	}
	fattening, err := fc.FatteningFactor()
	if err != nil {
		return 0, err
	}

	return fodder * fattening / float64(cows), nil
}

func ValidateInputAndDivideFood(fc FodderCalculator, cows int) (float64, error) {
	if cows > 0 {
		return DivideFood(fc, cows)
	}
	return 0, errors.New("invalid number of cows")
}

type InvalidCowsError struct {
	cows    int
	message string
}

func (ic *InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", ic.cows, ic.message)
}

func ValidateNumberOfCows(cows int) error {
	if cows < 0 {
		return &InvalidCowsError{cows, "there are no negative cows"}
	} else if cows == 0 {
		return &InvalidCowsError{cows, "no cows don't need food"}
	}
	return nil
}
