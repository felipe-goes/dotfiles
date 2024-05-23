package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	value := map[string]int{}

	value["two"]   = 2
	value["three"] = 3
	value["four"]  = 4
	value["five"]  = 5
	value["six"]   = 6
	value["seven"] = 7
	value["eight"] = 8
	value["nine"]  = 9
	value["ten"]   = 10
	value["jack"]  = 10
	value["queen"] = 10
	value["king"]  = 10
	value["ace"]   = 11

	return value[card]
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	parsedCardsSum := ParseCard(card1) + ParseCard(card2)

	switch {
	case card1 == "ace" && card2 == "ace":
		return "P"
	case parsedCardsSum == 21:
		if dealerCard == "ace" || dealerCard == "jack" || dealerCard == "queen" ||
			dealerCard == "king" || dealerCard == "ten" {
			return "S"
		}
		return "W"
	case parsedCardsSum >= 17 && parsedCardsSum <= 20:
		return "S"
	case parsedCardsSum >= 12 && parsedCardsSum <= 16:
		if ParseCard(dealerCard) >= 7 {
			return "H"
		}
		return "S"
	default:
		return "H"
	}
}
