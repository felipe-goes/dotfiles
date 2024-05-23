package lasagna

// TODO (): define the 'PreparationTime()' function
func PreparationTime(layers []string, avgTime int) int {
	if avgTime <= 0 {
		return len(layers) * 2
	}
	return len(layers) * avgTime
}

// TODO (): define the 'Quantities()' function
func Quantities(layers []string) (int, float64) {
	var count [2]int
	for _, v := range layers {
		if v == "noodles" {
			count[0]++
		}
		if v == "sauce" {
			count[1]++
		}
	}
	return count[0] * 50, float64(count[1]) * 0.2
}

// TODO (): define the 'AddSecretIngredient()' function
func AddSecretIngredient(friendList, myList []string) {
	myList[len(myList)-1] = friendList[len(friendList)-1]
}

// TODO (): define the 'ScaleRecipe()' function
func ScaleRecipe(quantities []float64, portions int) []float64 {
	if portions <= 0 {
		return []float64{-1}
	}

	var scaledQuantities []float64
	for _, v := range quantities {
		scaledQuantities = append(scaledQuantities, v*float64(portions)/float64(2))
	}
	return scaledQuantities
}
