# load the data
data <- read.csv("Data/data.csv", skip=1, header=TRUE)

names(data)
str(data)

# find the columns where all the values are 1
all_ones <- sapply(data, function(x) all(x == 1))

# remove the columns where all the values are 1
data <- data[, !all_ones]

# find the columns where all the values are 0
all_zeros <- sapply(data, function(x) all(x == 0))

# remove the columns where all the values are 0
data <- data[, !all_zeros]

# find the columns with zero variance
zero_variance <- sapply(data, function(x) var(x) == 0)

# remove the columns with zero variance
data <- data[, !zero_variance]

# run the pca
pca <- prcomp(data[, 5:ncol(data)], scale=TRUE)