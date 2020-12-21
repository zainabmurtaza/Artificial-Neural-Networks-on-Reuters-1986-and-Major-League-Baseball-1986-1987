# Artificial-Neural-Networks-on-Reuters-1986-and-Major-League-Baseball-1986-1987

1) Created an ANN model to classify reuters news article into 46 classes (note that reuters$train$y and reuters$test$y are vectors of integers between 0-45). 

2) Used two hidden layers and computed the accuracy of the model on test set. 

3) Split the train data into train/validation set. Used the first 1000 examples in reuters$train for validation and the rest for training model. 

4) Used “tfruns” package to tune ANN’s hyperparameters including, the number of nodes in each hidden layer, the activation function in each hidden layer, batch_size, learning_rate, and the number of epochs.

5) Used all the training data in reuters$train to train the ANN with the best hyperparameter combination found after tuning in the previous process. Computed the accuracy of this model on the test set.

# Major League Baseball dataset

1) Evaluated predictors that had the most correlation with Salary. Used scattered plot, side-by-side box plots, t-test and correlation matrix.

2) Replaced the salary column with log(salary) where log is the logarithm function. This served as the prediction attribute. The range of salary is very large which caused the gradients to be very large during the backpropagation phase. This in turn resulted in large updates to the network weights and overflow them, hence, we received NAN for loss function after a few epochs. This is called exploding gradient problem. By predicting the salary in the log scale we avoided the exploding gradients problem for this dataset.

3) Created an ANN model to predict log(salary) from other attributes. Used at least two hidden layers. Used tfruns to tune the model’s hyper-parameters, including the number of nodes in each hidden layer, the activation function in each hidden layer, batch_size, learning_rate, and the number of epochs). Validate each model on the validation set.

4) Measured the performance of the best model (after tuning) on the test set and computed its RMSE.
