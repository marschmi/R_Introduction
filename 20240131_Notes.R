# Data structures 
cats_df <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_strings = c(1, 0, 1))
rm(cats)

cats_df
# Structure of cats dataframe
str(cats_df)
cats_df$weight + 2
# Adding numerical with categorical?
cats_df$weight + cats_df$coat
paste("My cat is ", cats_df$coat)

# Data structures
typeof(cats_df$weight) # double
typeof(TRUE) #logical
typeof(cats_df$coat) # character 

# Writing files 
write.csv(x = cats_df, file = "cats_df.csv",
          row.names = FALSE, quote = FALSE)

# Matrix 
example_mat <- matrix(0, ncol = 6, nrow = 3)
example_mat

# Dimensions
dim(example_mat)
dim(cats_df)

# Subsetting 
head(cats_df)
str(cats_df[1])
str(cats_df$coat)
cats_df[1:2,1:2]

xy_var<- c(1,3)

cats_df[xy_var, xy_var]

# Create numerical vector 
1:10

example_mat[1:2,4:6]


# Install Package! 
#install.packages("ggplot2")
library("ggplot2")


# Download Data 
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", 
              destfile = "gapminder_data.csv")

gapminder_df <- read.csv(file = "gapminder_data.csv")
str(gapminder_df)
dim(gapminder_df)


# Plot the data 
ggplot(data = gapminder_df, 
       mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(alpha = 0.5, 
             aes(color = continent, 
                 shape = continent,
                 size = pop)) + 
  labs(x = "GDP Per Capita", y = "Life Expectancy (yrs)") + 
  scale_x_log10() + 
  geom_smooth(method = "lm")

# Make a plot modify the 
# 1. shapes (continent) and 
# 2. the size (related to population)


#+ 
  # make multiple plots by continent
  #facet_grid(continent~.)

head(gapminder_df)
  
# Evaluating lifeExp by year 
ggplot(data = gapminder_df, 
       mapping = aes(x = year, y = lifeExp, 
                     # grouping the data 
                     group = country)) + 
  # add line to connect years 
  geom_line(aes(color = continent)) + 
  geom_point(aes(color = continent))
  

# 
ggplot(gapminder_df, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent, size = pop), alpha = 0.5) + 
  geom_smooth(method = "lm") + 
  scale_x_log10() + 
  scale_y_log10() + 
  labs(x = "GDP Per Capita (USD)", y = "Life Expectancy (yrs)")


# What software do I have? 
sessionInfo()



?data.frame
?c
