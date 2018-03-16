pv <- function(FV, r, n = 5) {
  
  if(!is.atomic(FV)) {
    stop('FV must be an atomic vector')
  }
  
  if(!is.numeric(FV) | !is.numeric(r) | !is.numeric(n)) {
    stop('This function only works for numeric inputs!\n', 
         'You have provided objects of the following classes:\n', 
         'FV: ', class(FV), '\n',
         'r: ', class(r), '\n',
         'n: ', class(n))
  }
  
  if(r < 0 | r > .25) {
    message('The input for r exceeds the normal\n',
            'range for interest rates (0-25%)')
  }
  
  present_value <- FV / (1 + r)^n
  round(present_value, 2)
}


rescale <- function(x, digits = 2, na.rm = TRUE){
  # ensure argument inputs are valid
  if(!is.numeric(x)) {
    stop('x must be an atomic numeric vector')
  }
  if(!is.numeric(digits) | length(digits) > 1) {
    stop('digits must be a numeric vector of one element')
  }
  if(!is.logical(na.rm)) {
    stop('na.rm must be logical input (TRUE or FALSE)')
  }
  
  if(isTRUE(na.rm)) x <- na.omit(x)
  rng <- range(x)
  scaled <- (x - rng[1]) / (rng[2] - rng[1])
  round(scaled, digits = digits)
}

# Additional functions to add to your package
variance <- function(x) {
  n <- length(x)
  m <- mean(x)
  (1/(n - 1)) * sum((x - m)^2)
}

std_dev <- function(x) {
  sqrt(variance(x))
}


std_error <- function(x) {
  n <- length(x)
  sqrt(variance(x) / n)
}

skewness <- function(x) {
  n <- length(x)
  v <- variance(x)
  m <- mean(x)
  third.moment <- (1 / (n - 2)) * sum((x - m)^3)
  third.moment / (v^(3 / 2))
}
