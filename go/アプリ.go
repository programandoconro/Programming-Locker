    package main
    
    import (
          "fmt"
      )
 
    func main() {

    
//Interact with user in command line terminal
    
        fmt.Print( "お名前は何: ")
        var onamae string    
        fmt.Scanln(&onamae)       
        fmt.Print("どうぞよろし湖お願いします"+ onamae + "さん")

        fmt.Print( "漢字学びましょう, ¡ Vamos a aprender Kanji !" + onamae + "さん")
        
        fmt.Print( "¿ Cúal Kanji significa: Kanji ?")
        fmt.Print( "1. 漢字 2. 魚 3. 仕事 4. 女" )
        
        var q int     
        fmt.Scanln(&q)  

        if q == 1 {

        fmt.Print( "La opción 1. 漢字 es la correcta: 漢字 (かんじ)" )

        }else {
                
        fmt.Print("No has acertado, intenta de nuevo (pista, 子 (こ, ko) significa niño, los niños aprenden 漢字 rápido)")
        fmt.Print( "La opción 1. 漢字 es la correcta: 漢字 (かんじ)" )
 
        }




    }





       
       


