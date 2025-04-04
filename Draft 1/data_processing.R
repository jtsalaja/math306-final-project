# Load necessary libraries
library(caret)
library(ggplot2)
library(forcats)

# Load dataset
startups <- read.csv("~/Downloads/startup_data.csv")



# Set seed for reproducibility
set.seed(42)


# Remove missing values
startup_data <- na.omit(startups)

# Drop 'Startup.Name' column as it is non-numeric
startup_data <- startup_data[, !names(startup_data) %in% c("Startup.Name")]

# Convert categorical variables into factors
startup_data$Industry <- as.numeric(factor(startup_data$Industry) )
startup_data$Region <- as.numeric(factor(startup_data$Region))
startup_data$Exit.Status <- as.numeric(factor(startup_data$Exit.Status))  # Convert exit status to numeric

#scale columns 
startup_data_scaled = as.data.frame(scale(startup_data[, 1:10]))
startup_data_scaled_final = cbind(startup_data_scaled, Exit.Status =startup_data$Exit.Status)
startup_data_scaled_final

# Split data into training (80%) and testing (20%) sets
train_index <- createDataPartition(startup_data_scaled_final$Exit.Status, p = 0.8, list = FALSE)
train_data <- startup_data_scaled_final[train_index, ]
test_data <- startup_data_scaled_final[-train_index, ]

# Convert categorical variables into dummy variables
X_train <- model.matrix(~ . - Exit.Status - 1, data = train_data)
X_test <- model.matrix(~ . - Exit.Status - 1, data = test_data)