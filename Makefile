# to run jupyter notebook interactively: `jupyter notebook`

# dump.exe from ocaml-gc-events-tracing github repo

default: run_alloc_many_large # irmin-replay.ctf.dump

alloc_many_large.exe: 
	dune build alloc_many_large/alloc_many_large.exe

run_alloc_many_large: 
	dune build alloc_many_large/alloc_many_large.exe
	eval $$(opam env) && MEMTRACE=alloc_many_large.ctf MEMTRACE_RATE=1.0 dune exec alloc_many_large/alloc_many_large.exe
	$(MAKE) alloc_many_large.ctf.dump

%.ctf.dump: %.ctf
	/tmp/dump.exe ctf $< > $@


/tmp/dump.exe:
	cp /tmp/l/github/ocaml-gc-events-tracing/_build/default/bin/dump.exe /tmp
