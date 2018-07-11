.PHONY : training write_layer_output

training:
	python2.7 $(TRAIN_PY)

write_layer_output:
	python2.7 $(LAYER_PY)
