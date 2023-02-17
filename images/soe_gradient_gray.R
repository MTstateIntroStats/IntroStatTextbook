library(plotrix)  # axis.break

## Plot creation for strength of evidence

# Set margins
par(mar = c(5, 4, 5, 4))

# Color scale and plot
g.ramp <- gray.colors(100, start = 0, end = 0.95)
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
axis(side = 1, labels = c(as.character(seq(0, 0.09, by = 0.01)), "0.10", "1"),
     line = 0,
     at = c(seq(1, 70, length = length(seq(0, 0.10, by = 0.01))), 100)
     )
axis.break(axis = 1, breakpos = 76, brw = 0.03, style = "slash")
axis.break(axis = 1, breakpos = 75, brw = 0.02, style = "gap")
mtext(". . .", side = 1, line = 0.5, at = 90)

# Add text above
mtext("Very \n strong", side = 3, line = 0.5, at = 2, adj=.9)
mtext("Strong", side = 3, line = 0.5, at = 10)
mtext("Moderate", side = 3, line = 0.5, at = 35)
mtext("Some", side = 3, line = 0.5, at = 60)
mtext("Little to no", side = 3, line = 0.5, at = 78)

# Add title
mtext("Strength of Evidence Against the Null Hypothesis", side = 3, line = 2.5,
      cex=1.2, font=2)
