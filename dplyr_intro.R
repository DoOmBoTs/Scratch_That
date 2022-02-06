library(dplyr)

# ---- Piping Exp ----

# Here I take the Iris data set,
iris %>% 
  
  # then I groups for each row that has the same value in the Species column,
  # then i pass those groups to the mutate statement
  group_by(Species) %>%
  
  # mutate allows the creation of new columns,
  mutate(
    
    # I create the column avg_S_length, which has the avg Sepal.Length for each group
    avg_S_length = mean(Sepal.Length)
  ) %>%
  
  # We now display the created spread sheet and we can see avg SLentgth per species
  View()


# ---- Problem 1 ----

# Try adding more columns to the spread sheet by adding arguments to the mutate statement 
# Hint: You will want to seperate newly created variabls(columns) by a comma
iris %>% 
  group_by(Species) %>%
  mutate(
    avg_S_length = mean(Sepal.Length)
  ) %>%
  View()

# ---- Practice 1 ----
# Feel free to use the code above as a template

# A Solution
iris %>% 
  group_by(Species) %>%
  mutate(
    avg_S_length = mean(Sepal.Length),
    avg_P_length = mean(Petal.Length),
    max_S_length = max(Sepal.Length),
    max_P_length = max(Petal.Length)
  ) %>% 
  View()

# if we are only interested in the statistical information for each group, not information on the 
# individual samples, we can use a summarize statement to drop unwanted columns and non-unique rows
iris %>% 
  group_by(Species) %>%
  summarize() %>%
  View()


iris %>% 
  group_by(Species) %>% 
  
  # If we are performing an analysis on a group, we can output that single answer as a new column 
  # in the summarized data set.
  summarize(
    avg_S_length = mean(Sepal.Length),
    avg_P_length = mean(Petal.Length),
    max_S_length = max(Sepal.Length),
    max_P_length = max(Petal.Length)
  ) %>%
  View()
