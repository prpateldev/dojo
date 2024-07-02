package main

import (
	"fmt"
	"sync"
	"time"
)

var m = sync.RWMutex{}
var wg = sync.WaitGroup{}

var dbData = [5]string{"id1", "id2", "id3", "id4", "id5"}
var results = []string{}

func main() {
	startTime := time.Now()

	for i := 0; i < 5; i++ {
		wg.Add(1)
		go dbCall(int8(i), &wg)
	}
	wg.Wait()
	fmt.Printf("\n Total execution time: %v", time.Since(startTime))
	log()
}

func dbCall(i int8, w *sync.WaitGroup) {
	var delay float32 = 2000
	time.Sleep(time.Duration(delay) * time.Millisecond)
	fmt.Println("The result for database is ", dbData[i])
	save(dbData[i])
	w.Done()
}

func save(result string) {
	m.Lock()
	results = append(results, result)
	m.Unlock()
}

func log() {
	m.RLock()
	fmt.Printf("\n Results are %v", results)
	m.RUnlock()
}
