# Plot creation
g.ramp <- gray.colors(100, start = 0, end = 0.9)
barplot(rep(2, 100),
        axes = FALSE,
        space = 0,
        col = g.ramp,
        main = "",
        xlab = "p-value",
        border = NA)

# Add text below
# mtext("1%", side = 1, line = 1, at = 7)
# mtext("5%", side = 1, line = 1, at = 35)
# mtext("10%", side = 1, line = 1, at = 70)
axis(side = 1, labels = as.character(seq(0, 0.15, by = 0.01)), line = 0,
     at = seq(1, 100, length = length(seq(0, 0.15, by = 0.01))))

# Add text above
mtext("Very strong", side = 3, line = 0.5, at = 5, adj=.9)
mtext("Strong", side = 3, line = 0.5, at = 15)
mtext("Moderate", side = 3, line = 0.5, at = 40)
mtext("Some", side = 3, line = 0.5, at = 55)
mtext("Little to no", side = 3, line = 0.5, at = 80)

# Add title
mtext("Strength of Evidence Against the Null", side = 3, line = 2.5,
      cex=1.2, font=2)
