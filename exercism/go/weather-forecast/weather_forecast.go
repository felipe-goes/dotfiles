// Package weather provides the current condition in the specified current
// location.
package weather

// CurrentCondition specifies the current condition.
var CurrentCondition string
// CurrentLocation specifies the current location.
var CurrentLocation string

// Forecast returns a string describing the current location weather condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
