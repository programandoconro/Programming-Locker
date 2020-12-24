rmse <- function(esp,obs){
sqrt(mean((obs - esp)^2))
}

normalize <- function(x) { 
    return((x - min(x)) / (max(x) - min(x)))
}
