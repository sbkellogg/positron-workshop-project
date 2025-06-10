# Example from debugging talk
# https://github.com/jennybc/debugging/tree/master
# starts around 26:11 in the video

dat <- read.csv("fruit.csv", strip.white = TRUE)
dat

source("fruit_avg.R")

# 2 matching fruits
dat
fruit_avg(dat, pattern = "berry")

# 0 matching fruits
fruit_avg(dat, pattern = "melon")
dat

# 1 matching fruit ... uh-oh!
fruit_avg(dat, pattern = "black")

# debug by placing a browser() call in the source
source("fruit_avg_browser.R")

# let's walk through the problematic case in the debugger
fruit_avg(dat, "black")
# inspect mini_dat, add `drop = FALSE` on-the-fly, see success

# could also use debugonce() or debug() with the original definition of
# fruit_avg(
source("fruit_avg.R")
debugonce(fruit_avg)
fruit_avg(dat, "black")

# source a version of fruit_avg() that has `drop = FALSE`
source("fruit_avg_fixed.R")
fruit_avg(dat, "black")
