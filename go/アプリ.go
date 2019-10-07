       package main

    import (
     "net/http"
      "fmt"
      "time"
  
    )

    func main() {
       http.HandleFunc("/", HelloServer)
       http.ListenAndServe(":8590", nil)
    }

    func HelloServer(w http.ResponseWriter, r *http.Request) {
         fmt.Print( "お名前は何: ")
        var onamae string    
        fmt.Scanln(&onamae)       
   
        fmt.Print("どうぞよろし湖お願いします"+ onamae + "さん")

     y := time.Now()
     z := y.Hour()

     if  z < 19 && z > 6 {

           fmt.Fprintf(w, "こにちわ", r.URL.Path[1:])
    } else {

            fmt.Fprintf(w, "こんばんわ", r.URL.Path[1:])
    }

    }


