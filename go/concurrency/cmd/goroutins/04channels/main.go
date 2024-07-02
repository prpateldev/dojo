package main

import (
	"fmt"
	"time"
)

func main() {
	// made a buffer channel
	var c = make(chan int, 5)
	startTime := time.Now()

	go process(c)
	for i := range c {
		fmt.Println(i)
		time.Sleep(time.Second * 1)
	}
	fmt.Println("Total time of execution: ", time.Since(startTime))
}

func process(ch chan int) {
	// as channel is a bufferd cahnnel it has length of 5
	// the loop will not wait for getting empty space in channel
	// it can pass 5 int without wait for channel to be cleared old values
	for i := 0; i < 5; i++ {
		ch <- i
	}
	fmt.Println("Exiting process")
	close(ch)
}
