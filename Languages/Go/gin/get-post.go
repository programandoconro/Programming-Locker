package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

type Cordinates struct {
	Location string
}

var data = Cordinates{Location: "0"}

func main() {
	r := gin.Default()
	r.GET("/data", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"gps": data.Location,
		})
	})

	r.POST("/data", func(c *gin.Context) {
		b := c.FullPath() == "/data" // true
		c.String(http.StatusOK, "%t", b)
		err := c.BindJSON(&data)
		if err != nil {
			return
		}
	})

	r.Run()

	//post request
	//curl -X POST -H "Content-Type: application/json" -d '{"location":"100"}' 'localhost:8080/data'

}
