# ocaml-alloc-stats

This repo supports analysis of allocation traces produced by memtrace. The main file is `main.ipynb`, a Jupyter notebook that loads an allocation trace from a `.ctf ` file, draws some histograms, and computes some statistics. There should be documentation in the notebook itself.

## Background

* statmemprof statistical memory profiling was introduced in OCaml 4.11. The blog post https://blog.janestreet.com/finding-memory-leaks-with-memtrace/ discusses using it to profile code.
* memtrace is "a streaming client for OCaml's Memprof" which can log (stat)memprof data to file. See https://github.com/janestreet/memtrace . By inserting a single line in a target program, and setting an environment variable `MEMTRACE` to a filename, memprof data will be written to the corresponding file in common trace format (ctf). The envvar `MEMTRACE_RATE` controls the sampling rate. This can be 1.0 to record all allocs, or e.g. 0.001 to record a small fraction of the allocs. Long running programs can produce many GBs of trace data (so this variable should be set low), whereas short-running programs can afford to set this variable to 1.0 and record all allocs. It is important to be aware, when looking at a trace, what the sampling rate was when the trace was recorded.
* memtrace is an OCaml-specific format, and the libraries to work with these traces are written in OCaml. Thus, we prefer to work with traces using OCaml code although, since memtrace uses ctf as the underlying format, it is also possible e.g. to work in Python and read the .ctf files using (undocumented) Python libraries.

* For drawing graphs, we use Jupyter notebooks. I lack familiarity with these notebooks, so the code is likely not good in places, but hopefully suffices for getting a few histograms.

## Quickstart

1. Raw memtrace files in common trace format are first preprocessed and converted to plain text format using the `dump_trace.exe` executable. To build this executable, type `make`. This requires the memtrace opam package to be installed.
2. With this executable, you can now run the `main.ipynb` Jupyter notebook: assuming the relevant packages are installed on your system, from the command line type `jupyter notebook`
