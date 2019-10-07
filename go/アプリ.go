        package main
    import (
     "net/http"
      "fmt"
      "time"
      )
//create a server for program instrucions at localhost:listening_port 
    func main() {
       http.HandleFunc("/", HelloServer)
       http.ListenAndServe(":8509",nil)
    }
//Interact with user in command line terminal
    func HelloServer(w http.ResponseWriter, r *http.Request) {
        fmt.Print( "お名前は何: ")
        var onamae string    
        fmt.Scanln(&onamae)       
        fmt.Print( "漢字学びましょう, ¡ Vamos a aprender Kanji !")
        fmt.Print( "¿ Cúal Kanji significa: Kanji ?")
        fmt.Print( "1. 漢字 2. 魚 3. 仕事 4. 女" )
        var q int     
        fmt.Scanln(&q)  
        fmt.Print("どうぞよろし湖お願いします"+ onamae + "さん")

        if q == 1 {

        fmt.Print( "Bien hecho !! La opción 1. 漢字 es la correcta: 漢字 (かんじ)" )

        }else { 
        fmt.Print("No has acertado, intenta de nuevo (pista, 子 (こ) significa niño, los niños aprenden 漢字 rápido)")
        fmt.Print( "Lo siento, la opción 1. 漢字 era la correcta: 漢字 (かんじ)")
 
        }
//Server response
     y := time.Now()
     z := y.Hour()
     x := "Instrucciones (指示) para usar este programa (プログラム) y aprender Kanji Japonés(漢字)"
     if  z < 19 && z > 6 {
           fmt.Fprintf(w, "こにちわ\n", r.URL.Path[1:])
           fmt.Fprintf(w, x, r.URL.Path[1:])
    } else {
            fmt.Fprintf(w, "こんばんわ", r.URL.Path[1:])
            fmt.Fprintf(w, x, r.URL.Path[1:]) 
    }
    }


       
       


