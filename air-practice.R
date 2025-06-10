# I have to do this in order to save the file in the "before formatting" state
# fmt: skip file

# ggplot2 example from the ggplot2 book
# taken from around here:
# https://github.com/hadley/ggplot2-book/blob/34b224a18d65048864ebfd1d8761cead473ab674/layers.qmd#L127

library(ggplot2)
library(dplyr)

mod<-loess(hwy~displ,data=mpg)
grid<-tibble(displ=seq(min(mpg$displ),max(mpg$displ),length.out = 50))
grid$hwy<-predict(mod, newdata = grid)

std_resid <- resid(mod) / mod$s
outlier <- filter(mpg, abs(std_resid) > 2)
outlier

mpg |> ggplot(aes(displ, hwy)) + geom_point() +
  geom_line(
    data = grid, colour = "blue",
               linewidth = 1.5 ) +
  geom_text(data = outlier,
    aes(label = model))

# from Lionel's talk
x<-c(1,2,3,4,5)
y<-c(2,4,6,8,10)

plot(x,y,main="Scatter plot",xlab="X-axis",ylab="Y-axis",col="blue",pch=19)

for(i in 1:5){
if(x[i]%%2==0){print(paste("Even:",x[i]))}else{print(paste("Odd:",x[i]))}
if(y[i]>5){print(paste("Greater than 5:",y[i]))}else{print(paste("Less than or equal to 5:",y[i]))}
}

# small example to play with persistent line breaks
foo <- 1
bar <- 2
list(foo,
bar)
list(
  foo, bar)

# autobracing
condition <- TRUE
if (condition)
  "hi"

# function definition
fn <- function(a_really_long_variable_name, another_super_really_really_long_name) a_really_long_variable_name + another_super_really_really_long_name

# hanging indents in function definition
super_long_function_name <- function(foo,
                                     bar,
                                     a_very_long_argument_name_complicates_matters) {
  1 + 1
}
