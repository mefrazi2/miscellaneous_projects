# so simple! Check out the documentation here for a step-by-step: 
# https://r-coder.com/merge-r/

df1 <- read.csv("final_output_including_03G_2009.csv")
df2 <- read.csv("test_2005_population_area.csv")

df3 <- merge(df1, df2, by = c("combo_id", "combo_id"))

write.csv(df3, "new_test.csv")
