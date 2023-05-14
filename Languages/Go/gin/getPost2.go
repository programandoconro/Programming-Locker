package main

import (
  "net/http"
  "github.com/gin-gonic/gin"
)

type gyroscope struct {

   X  string  `json:"x"`
   Y  string  `json:"y"`
   Z  string  `json:"z"`
}

var sensors = []gyroscope{
    {X: "1", Y: "2", Z: "3"},
    {X: "4", Y: "5", Z: "6"},


}

func getSensorsData(c *gin.Context){
  c.IndentedJSON(http.StatusOK, sensors)
}

func postSensors(c * gin.Context){
  var newSensors gyroscope

  if err := c.BindJSON(&newSensors); err != nil {
    return
  }

  sensors = append(sensors, newSensors)

  c.IndentedJSON(http.StatusCreated, newSensors)
}

func main(){
  router := gin.Default()
  router.GET("/sensors", getSensorsData)
  router.POST("/sensors", postSensors)

  router.Run("localhost:8080")
}

//  curl http://localhost:8080/sensors
//  curl http://localhost:8080/sensors --include --header "Content-Type: application/json" --request "POST" --data '{"x":"8","y":"9","z":"10"}'
