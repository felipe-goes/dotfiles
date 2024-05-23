package lasagna

// TODO(): define the 'OvenTime' constant
const OvenTime = 40

//  RemainingOvenTime returns the remaining minutes based on the `actual` minutes already in the oven.
func RemainingOvenTime(actualMinutesInOven int) int {
	switch {
	case actualMinutesInOven < 0:
		return -1
	case actualMinutesInOven > 40:
		return -1
	default:
		return OvenTime - actualMinutesInOven
	}
}

//  PreparationTime calculates the time needed to prepare the lasagna based on the amount of layers.
func PreparationTime(numberOfLayers int) int {
	switch {
	case numberOfLayers <= 0:
		return -1
	default:
		return 2 * numberOfLayers
	}
}

// ElapsedTime calculates the time elapsed cooking the lasagna. This time includes the preparation time and the time the lasagna is baking in the oven.
func ElapsedTime(numberOfLayers, actualMinutesInOven int) int {
	switch {
	case PreparationTime(numberOfLayers) < 0 || RemainingOvenTime(actualMinutesInOven) < 0:
		return -1
	default:
		return PreparationTime(numberOfLayers) + (actualMinutesInOven)
	}
}
