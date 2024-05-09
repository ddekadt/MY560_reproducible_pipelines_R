# our package function
package_check <- function(need = c()){
  have <- need %in% rownames(installed.packages()) # checks packages you have
  if(any(!have)) install.packages(need[!have]) # install missing packages
  invisible(lapply(need, library, character.only=T))
}

# our function to ingest the data
ingest_data <- function(file) {
  read_csv(file)
}

# our function to scale the data
scale_data <- function(foo, variables) {
  foo_scaled <- foo %>% 
    mutate_at(variables, ~(scale(.) %>% as.vector))
  return(foo_scaled)
}

# our function to make a simple plot:
simple_plot <- function(foo, yvar, xvar, outdir, fname) {
  plot <- ggplot(foo) +
    geom_point(aes(x = get(xvar), y = get(yvar))) +
    theme_bw()
  plot
}

# our updated function with a square term:
simple_reg <- function(foo, yvar, xvar, outdir, fname) {
  model <- lm(get(yvar) ~ get(xvar) + I(get(xvar)^2), data = foo) %>% 
    summary()
}
