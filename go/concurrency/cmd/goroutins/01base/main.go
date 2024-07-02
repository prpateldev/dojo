package main

import (
	"fmt"
	"math/rand"
	"time"
)

var dbData = [5]string{"id1", "id2", "id3", "id4", "id5"}

func main() {
	startTime := time.Now()

	for i := 0; i < 5; i++ {
		dbCall(int8(i))
	}

	fmt.Printf("\n Total execution time: %v", time.Since(startTime))
}

func dbCall(i int8) {
	var delay float32 = rand.Float32() * 2000
	time.Sleep(time.Duration(delay) * time.Millisecond)
	fmt.Println("The result for database is ", dbData[i])

}
