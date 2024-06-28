package linkedlist

type Element struct {
	id   int
	next *Element
}

type List struct {
	head *Element
	size int
}

// Define the List and Element types here.

func New(elements []int) *List {
	list := &List{}
	for _, el := range elements {
		list.head = &Element{id: el, next: list.head}
		list.size = list.size + 1
	}
	return list
}

func (l *List) Size() int { return l.size }

func (l *List) Push(element int) {
	panic("Please implement the Push function")
}

func (l *List) Pop() (int, error) {
	panic("Please implement the Pop function")
}

func (l *List) Array() []int {
	panic("Please implement the Array function")
}

func (l *List) Reverse() *List {
	panic("Please implement the Reverse function")
}
