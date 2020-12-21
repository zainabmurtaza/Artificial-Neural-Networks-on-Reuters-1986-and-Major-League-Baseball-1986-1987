library(keras)

flags_ <- flags(
  flag_numeric("nodes_hlayer1", 20),
  flag_numeric("nodes_hlayer2", 10),
  flag_numeric("batch_size", 10),
  flag_string("activation", "relu"),
  flag_numeric("learning_rate", 0.01),
  flag_numeric("epochs", 50)
)

model <- keras_model_sequential()

model %>%
  layer_dense(units = 20, activation = flags_$activation, input_shape = dim(hitters_test)[2]) %>%
  layer_dense(units = flags_$nodes_hlayer1, activation = flags_$activation) %>%
  layer_dense(units = flags_$nodes_hlayer2, activation = flags_$activation) %>%
  layer_dense(units = 1)

model %>%
  compile(optimizer = optimizer_adam(lr = flags_$learning_rate), loss = 'mse')

set.seed(123)

model %>%
  fit(hitters_train, hitters_train_y, batch_size = flags_$batch_size, epochs = flags_$epochs,
      validation_data = list(hitters_test, hitters_test_y))
