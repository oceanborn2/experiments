package main

import (
	"fmt"
)

func Sqrt(x float64) float64 {
	z:=x
	//delta := x
	for i:=1; i < 10; i++ {
		newz := (z*z -x)/(2*z)
		delta = z - newz
		z = z - newz
		//i++
	}
	return z
}

func main() {
	fmt.Println(Sqrt(2))
}
