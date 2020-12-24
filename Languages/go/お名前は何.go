package main
 
import "fmt"
 
func main() {
        fmt.Print("お名前は何: ")
        var onamae string    
        fmt.Scanln(&onamae)       
   
        fmt.Print( "どうぞよろし湖お願いします"+ onamae + "さん")              
}
