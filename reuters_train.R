library(keras)

flags_ <- flags(
  flag_numeric("nodes_hlayer1", 250),
  flag_numeric("nodes_hlayer2", 100),
  flag_numeric("batch_size", 50),
  flag_string("activation", "relu"),
  flag_numeric("learning_rate", 0.01),
  flag_numeric("epochs", 30)
)

model <- keras_model_sequential()

model %>%
  layer_dense(units = 500, activation = flags_$activation, input_shape = dim(data_train)[2]) %>%
  layer_dense(units = flags_$nodes_hlayer1, activation = flags_$activation) %>%
  layer_dense(units = flags_$nodes_hlayer2, activation = flags_$activation) %>%
  layer_dense(units = 46, activation = 'softmax')

model %>%
  compile(optimizer = optimizer_adam(lr = flags_$learning_rate), loss = 'sparse_categorical_crossentropy', metrics = c('accuracy'))

set.seed(123)

model %>%
  fit(trainX, trainY, batch_size = flags_$batch_size, epochs = flags_$epochs,
      validation_data = list(trainX, trainY))