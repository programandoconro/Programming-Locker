       
       package main

    import (
     "net/http"
      "fmt"
      "time"
  
    )

//create a server for program instrucions at localhost:listeningport 
    
    func main() {
       http.HandleFunc("/", HelloServer)
       http.ListenAndServe(":8595",nil)
    }

//Interact with user in command line terminal

    func HelloServer(w http.ResponseWriter, r *http.Request) {
        fmt.Print( "お名前は何: ")
        var onamae string    
        fmt.Scanln(&onamae)       
   
        fmt.Print("どうぞよろし湖お願いします"+ onamae + "さん")

    
//Server response

     y := time.Now()
     z := y.Hour()
     x := "Instrucciones (指示) para usar este programa (プログラム) y aprender Kanji Japonés(漢字)"

     if  z < 19 && z > 6 {

           fmt.Fprintf(w, "こにちわ", r.URL.Path[1:])
           fmt.Fprintf(w, x, r.URL.Path[1:])
    } else {

            fmt.Fprintf(w, "こんばんわ", r.URL.Path[1:])
            fmt.Fprintf(w, x, r.URL.Path[1:])
 
    }


    }



