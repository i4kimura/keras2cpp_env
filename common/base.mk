.PHONY : help training gen_nnet write_layer_output gen_test_data compile 

BASE_DIR=$(abspath ../)

training: ## Do Training
	python2.7 $(TRAIN_PY)

gen_nnet:  ## Generate NNET Dump
	python2.7 save_model_weight.py
	python2.7 ../keras2cpp/dump_to_simple_cpp.py -a $(MODEL_NAME).json -w $(MODEL_NAME).h5 -o dumped.nnet

write_layer_output:  ## Write Layer output data
	python2.7 $(LAYER_PY)

gen_test_data:  ## Generate Test Data
	python2.7 $(TEST_DATA_PY)

compile:  ## Compile Binary
	g++ -g -O0 -std=c++0x -o $(BINARY_NAME) main.cc ../keras2cpp/keras_model.cc -I../keras2cpp/

help:
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(BASE_DIR)/common/base.mk | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
