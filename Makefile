# to run jupyter notebook interactively: `jupyter notebook`

default: exes

exes: translate_with_promote_lookahead.exe dump.exe

translate_with_promote_lookahead.exe:
	dune build memtrace-utils/$@
	cp _build/default/memtrace-utils/$@ .

dump.exe:
	dune build memtrace-utils/$@
	cp _build/default/memtrace-utils/$@ .


# alloc_many_large.exe: 
# 	dune build alloc_many_large/alloc_many_large.exe
# 
# run_alloc_many_large: 
# 	dune build alloc_many_large/alloc_many_large.exe
# 	eval $$(opam env) && MEMTRACE=alloc_many_large.ctf MEMTRACE_RATE=1.0 dune exec alloc_many_large/alloc_many_large.exe
# 	$(MAKE) alloc_many_large.ctf.dump
# 
# %.ctf.dump: %.ctf
# 	bin/dump.exe ctf $< > $@
# 
# # /tmp/dump.exe:
# # 	cp bin/dump.exe /tmp

clean:
	dune clean
	rm -f ./translate_with_promote_lookahead.exe ./dump.exe tmp.ctf.dump
	rm -f dump_trace.exe tmp.csv tmp.dump tmp.translated
