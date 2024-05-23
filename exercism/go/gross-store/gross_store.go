package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	units := map[string]int{}

	units["quarter_of_a_dozen"] = 3
	units["half_of_a_dozen"] = 6
	units["dozen"] = 12
	units["small_gross"] = 120
	units["gross"] = 144
	units["great_gross"] = 1728

	return units
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	if units[unit] == 0 {
		return false
	}
	bill[item] += units[unit] // if item not in bill, 0+units[unit]
	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	if units[unit] == 0 {
		return false
	}

	if bill[item] > units[unit] {
		bill[item] -= units[unit]
		return true
	}
	if bill[item] == units[unit] {
		delete(bill, item)
		return true
	}
	return false
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	return bill[item], bill[item] > 0
}
