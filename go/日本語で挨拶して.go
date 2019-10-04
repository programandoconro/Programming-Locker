package main
 
import (
        "fmt"
	"time"  
)
 
func main() {

       	y := time.Now()
        z := y.Hour()

// Si son menos de las de la 7 tarde y más de las 6 de la mañana, imprime "Konichiwa"

        if  z < 19 && z > 6 {
                fmt.Println("こにちわ")
        } else {
	
// Imprime Konbanwa si son más de las 7 de la noche y menos de las 7 de la mañana. 
	
                fmt.Println("こんばんわ")
        }
}



