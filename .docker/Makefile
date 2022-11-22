# NOTE Dockerfile contents:
# FROM ocaml/opam
# WORKDIR /test
# RUN opam update
# RUN opam install dune memtrace
# CMD ["bash"]

SHELL:=bash

DOCKER_IMAGE:=ocaml-alloc-stats/ocaml-dune-memtrace

all:
	echo "Select a particular target: `make docker-image` to first build the docker image with a clean ocaml environment; then `make run-docker` to check that the executable builds in a that environment."

docker-image:
	docker build -t $(DOCKER_IMAGE) .

run-docker:
	if [ ! -d "./ocaml-alloc-stats" ]; then git clone .. ./ocaml-alloc-stats; fi
	cd ocaml-alloc-stats && git pull
	docker run -w /test  -v "$$PWD/ocaml-alloc-stats:/test" $(DOCKER_IMAGE) make

clean:
	rm -rf ./ocaml-alloc-stats
