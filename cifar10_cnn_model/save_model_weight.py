#!/usr/bin/python2.7

import os
import sys
from keras.models import load_model
from keras.utils import np_utils

save_dir = os.path.join(os.getcwd(), 'saved_models')
model_name = 'keras_cifar10_trained_model'

model = load_model (save_dir + '/' + model_name + ".h5")

# Save model and weights
# if not os.path.isdir(save_dir):
#     os.makedirs(save_dir)
# model_path = os.path.join(save_dir, model_name + '.h5')
# mnist_cnn.model.save(model_path)
# print('Saved trained model at %s ' % model_path)

weight_path = os.path.join(save_dir, model_name + '.json')
with open(weight_path, 'w') as fout:
    fout.write(model.to_json())
print('Saved trained weights at %s ' % weight_path)
