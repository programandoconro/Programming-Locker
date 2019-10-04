package main
 
import (
        "fmt"
	"time"  
)
 
func main() {

       	y := time.Now()
        z := y.Hour()

// Si son menos de las de la 7 tarde, imprime "Konichiwa"

        if  z > 19 {
                fmt.Println("こにちわ")
        } else {
	
// Imprime Konbanwa si son las 7 o más tarde	
	
                fmt.Println("こんばんわ")
        }
}

