package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup

	wg.Add(1)
	go func() {
		fmt.Println("This happens asynchronously!")
		wg.Done()
	}()

	fmt.Println("This is synchronous")

	wg.Wait()

}
