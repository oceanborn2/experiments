// TypeChecking
package main

type vraifaux bool
type quantite float32

func main() {
	println("Keyword")
	b := true
	if b {
		println("b:", b) //fmt.Println(b))
		//var vf vraifaux = true
		//		if vf == b {
		//			println("ok")
		//		}
	}

	q := 1.2 // quantite(1.2) --> type checking really good
	qf := 1.2
	q = 2 * qf

	println(q - qf)
}
