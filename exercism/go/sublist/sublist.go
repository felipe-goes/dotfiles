package sublist

func Sublist(l1, l2 []int) Relation {
	// empty slices
	if len(l1) == 0 && len(l2) == 0 {
		return RelationEqual
	}
	if len(l1) == 0 {
		return RelationSublist
	}
	if len(l2) == 0 {
		return RelationSuperlist
	}

	// not empty
	if len(l1) == len(l2) {
		return sameSize(l1, l2)

	} else if len(l1) > len(l2) {
		return differentSize(l1, l2, "super")

	} else {
		return differentSize(l2, l1, "sub")
	}
}

// sameSize determines the relationship between 2 slices when they have the
// same size
func sameSize(l1, l2 []int) Relation {
	for k := range l1 {
		if !(l1[k] == l2[k]) {
			return RelationUnequal
		}
	}
	return RelationEqual
}

// differentSize determines the relationship between 2 slices when they do not
// have the same size
func differentSize(l1, l2 []int, contains string) Relation {
	// l1 is bigger than l2
	i1 := 0
	i2 := 0
	for i1 < len(l1) {
		if l1[i1] == l2[i2] {
			// if l2 reached the end it is inside l1
			if i2 == len(l2)-1 {
				if contains == "super" {
					return RelationSuperlist
				} else {
					return RelationSublist
				}
			}
			// if did not reach the end, continue
			i1++
			i2++
		} else {
			// this will move to next when i2 is 0
			// and will reset its position when find a partial match
			i1 = i1 - i2 + 1
			// reset i2 to 0 in all cases
			i2 = 0
		}
	}
	return RelationUnequal
}
