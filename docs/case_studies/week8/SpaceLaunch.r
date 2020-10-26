#Space Launch Case Study

library(catstats)

#creating the data file
space<-data.frame(vehicle = c(rep(x = as.character("ariane5"), 109),
                                   rep(x = as.character("deltaIV"), 40)),
                  launch = c(rep(x = as.character("success"), 104),
                          rep(x = as.character("failure"), 5),
                          rep(x = as.character("success"), 39),
                          rep(x = as.character("failure"), 1))
)

#Simulation test for space data
#Type in your calculated difference in sample proportions for the ^^^ in the as_extreme_as argument
two_proportion_test(formula = launch~vehicle, #response~explanatory
                    data=space, #name of dataset
                    first_in_subtraction = "ariane5", #order of subtraction: children - no children
                    number_repetitions = 1000, #simulate 1000 sampled
                    response_value_numerator = "success", #define a success as supporting the ban
                    as_extreme_as = ^^^, #type your calculated observed statistic (difference in sample proportions)
                    direction="two-sided")#two-sided alternative to test for a difference
