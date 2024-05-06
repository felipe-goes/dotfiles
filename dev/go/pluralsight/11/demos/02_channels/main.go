package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	ch := make(chan string)

	wg.Add(1)
	go func() {
		ch <- "the message"
	}()

	go func() {
		fmt.Println(<-ch)
		wg.Done()
	}()

	wg.Wait()

}
