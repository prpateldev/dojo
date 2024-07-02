package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

var wg = sync.WaitGroup{}

var dbData = [5]string{"id1", "id2", "id3", "id4", "id5"}

func main() {
	example1()
	example2()
}

func process(delay float32, i int8, s []string) {
	time.Sleep(time.Duration(delay) * time.Millisecond)
	fmt.Println("The result for database is ", s[i])
}

func example1() {
	fmt.Println("Executing simple waitgroup example")
	startTime := time.Now()

	for i := 0; i < 5; i++ {
		wg.Add(1)
		go dbCall(int8(i))
	}
	wg.Wait()
	fmt.Printf("\n Total execution time: %v", time.Since(startTime))
}

func dbCall(i int8) {
	var delay float32 = rand.Float32() * 2000
	process(delay, i, dbData[:])
	wg.Done()
}

func example2() {
	fmt.Println("Executing waitgroup passed as pointer example")
	startTime := time.Now()

	for i := 0; i < 5; i++ {
		wg.Add(1)
		go dbCall2(int8(i), &wg)
	}
	wg.Wait()
	fmt.Printf("\n Total execution time: %v", time.Since(startTime))
}

func dbCall2(i int8, w *sync.WaitGroup) {
	var delay float32 = rand.Float32() * 2000
	process(delay, i, dbData[:])
	w.Done()
}
