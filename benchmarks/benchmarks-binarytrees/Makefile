# NOTE the allocations are all of size 2, at least for a particular run with sampling rate
# 0.001

all:
	cd .. && dune build benchmarks-binarytrees

run:
	cd ../ && MEMTRACE=binarytrees5.ctf MEMTRACE_RATE=0.001 dune exec -- benchmarks-binarytrees/binarytrees5.exe 21
