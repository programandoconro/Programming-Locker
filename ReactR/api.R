library(plumber)

## functions.R ##
## ----------- ###* @get /createmodel
#* @serializer unboxedJSON

createDataModel <- function() {
    ....
      your R code logic to 
            process data 
            train data
            create data model
            predict data
            ..
            ..
}

## main.R ##
## ------ ##library(plumber)

r <- plumb("path/to/your/project/functions.R")
r$run(port=8000)

###################################
http://localhost:8000/createmodel
           or
curl "http://localhost:8000/createmodel"
#####################################


######## REACT ########################### 

componentDidMount () {
  fetch(`http://localhost:8000/createmodel`)
    .then(result => { return result.json()})
    .then(data=> {
      this.setState({
        data:data.response
      });
    });
}

###############################################
