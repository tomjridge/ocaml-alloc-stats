# to run jupyter notebook interactively, from the command line: `jupyter notebook`

default: exes

exes: dump_trace.exe

dump_trace.exe: FORCE
	dune build bin/$@
	rm -f $@
	cp _build/default/bin/$@ .

clean:
	dune clean
	rm -f dump_trace.exe
