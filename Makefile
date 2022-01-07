CWD:=$(shell pwd)

cdtvos235rom:
	docker run --rm -v $(CWD):/data captainfuture/cdtvos235patch:1.0.1 /appl/run.sh

