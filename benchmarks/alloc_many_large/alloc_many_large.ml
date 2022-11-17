(* A quick test, where we just do "large" allocations of a fixed size, to check they are
   recorded properly by the memtrace infra *)


let main () = 
  Memtrace.trace_if_requested ();
  let xs = ref [] in
  let alloc_sz = (256 * 8) + 8 in 
  (* 256 words is max small size; we add another word to force a "large" alloc *)
  for _i = 0 to 100000 do
    xs := Bytes.create alloc_sz :: !xs
  done

let _ = main ()
