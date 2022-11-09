# to run jupyter notebook interactively: `jupyter notebook`

# dump.exe from ocaml-gc-events-tracing github repo

irmin.ctf.dump: irmin.ctf
	/tmp/dump.exe ctf irmin.ctf > $@
