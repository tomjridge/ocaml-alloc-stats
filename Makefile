# to run jupyter notebook interactively: `jupyter notebook`

default: translate_with_promote_lookahead.exe

translate_with_promote_lookahead.exe:
	dune build memtrace-utils/translate_with_promote_lookahead.exe
	cp _build/default/memtrace-utils/translate_with_promote_lookahead.exe .


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
	rm -f ./translate_with_promote_lookahead.exe
