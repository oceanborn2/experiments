package formulas

//import (
//	"fmt"
//)

func Sqrt(x float64) float64 {
	var z = x
	var delta = x
	//for i := 0; i < 100; i++ {
	for delta > 0.000000001 {
		delta = z
		//fmt.Println("z:", z)
		z = z - ((z*z - x) / (2 * z))
		delta = delta - z
		//fmt.Println("delta:", delta)
	}
	return z
}

//func main() {
//	fmt.Println(Sqrt(2))
//}
