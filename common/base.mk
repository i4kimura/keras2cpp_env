.PHONY : training gen_nnet write_layer_output gen_test_data compile

training:
	python2.7 $(TRAIN_PY)

gen_nnet: ../keras2cpp/dump_to_simple_cpp.py $(MODEL_NAME).json $(MODEL_NAME).h5
	python2.7 $< -a $(MODEL_NAME).json -w $(MODEL_NAME).h5 -o dumped.nnet

write_layer_output:
	python2.7 $(LAYER_PY)

gen_test_data:
	python2.7 $(TEST_DATA_PY)

compile:
	g++ -g -O0 -std=c++0x -o $(BINARY_NAME) main.cc ../keras2cpp/keras_model.cc -I../keras2cpp/
