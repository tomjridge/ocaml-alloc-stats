# NOTE Dockerfile contents:
# FROM ocaml/opam
# WORKDIR /test
# RUN opam update
# RUN opam install dune memtrace
# CMD ["bash"]

SHELL:=bash

DOCKER_IMAGE:=ocaml-alloc-stats/ocaml-dune-memtrace

all:
	$(MAKE) clean
	$(MAKE) docker-image
	$(MAKE) run-docker

docker-image: FORCE
	docker build -t $(DOCKER_IMAGE) .

run-docker: FORCE
	if [ ! -d "./ocaml-alloc-stats" ]; then git clone .. ./ocaml-alloc-stats; fi
	cd ocaml-alloc-stats && git pull
	docker run -w /test  -v "$$PWD/ocaml-alloc-stats:/test" $(DOCKER_IMAGE) make

clean:
	rm -rf ./ocaml-alloc-stats

FORCE:
