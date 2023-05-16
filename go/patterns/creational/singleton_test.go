package creational

import "testing"

func TestGetInstance(t *testing.T) {
	counter := GetInstance()

	if counter == nil {
		// test of acceptance criteria failed
		t.Error("expected pointer of Singleton after calling getInstance() not nil")
		return
	}

	if counter.GetCount() != 0 {
		t.Error("initial value must be 0")
	}
}

func TestAddOne(t *testing.T) {
	counter := GetInstance()
	if counter == nil {
		// test of acceptance criteria failed
		t.Error("expected pointer of Singleton after calling getInstance() not nil")
		return
	}
	oldValue := counter.GetCount()
	counter.AddOne()
	if counter.GetCount() != (oldValue + 1) {
		t.Error("should add 1 to count")
	}
}
