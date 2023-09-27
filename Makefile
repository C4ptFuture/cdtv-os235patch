CWD:=$(shell pwd)

cdtvos235rom:
	docker run --rm -v $(CWD):/data captainfuture/cdtvos235patch:1.0.3 /appl/run.sh

container-image:
	docker build -t captainfuture/cdtvos235patch:1.0.3 ./docker
