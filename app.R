movieDS <- read.csv("movies.csv", stringsAsFactors = FALSE,
                       header = TRUE)



cleanMovieDS <- movieDS[movieDS$vote_count != 0,]
cleanMovieDS <- cleanMovieDS[cleanMovieDS$runtime != 0,]
newMovieDS <- cleanMovieDS[order(cleanMovieDS$runtime),]

summary(newMovieDS)

boxplot(newMovieDS$vote_average, main="Boxplot of Average Vote",
        ylab="Rating")

x <- newMovieDS$runtime
y1 <- newMovieDS$popularity
y2 <- newMovieDS$vote_count

plot(x = newMovieDS$runtime, y = newMovieDS$popularity,
     main = "Scatterplot of Runtime vs. Popularity",
     xlab = "Runtime (min.)",
     ylab = "Popularity")

plot(x = newMovieDS$runtime, y = newMovieDS$popularity,
     main = "Single line plot of Runtime vs. Popularity",
     xlab = "Runtime (min.)",
     ylab = "Popularity", type = "l")

plot(x, y1, type = "l", col = "black", xlab = "runtime",
     ylab = "popularity and vote count", ylim = range(1,3000))
lines(x, y2, type = "l", col = "grey")
legend("topright", legend = c("Line 1", "Line 2"), col=c("black", "grey"),
       lty = 1:2, cex = 0.8)

write.csv(movieDS, file = "OriginMovieDataset.csv")
write.csv(newMovieDS, file = "ProcessedMovieDataset.csv")




