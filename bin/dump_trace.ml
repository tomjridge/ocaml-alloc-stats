(* NOTE based on memtrace's bin/dump_trace 

Typical output:
0000000000 A 376181
0000000001 a 4
0000000001 P
0000000002 a 12
0000000002 C

Output consists of lines with the following format:

id (A|a|AE|P|C) len?

where:
- id is the id of the event
- the type of the allocation is: A (major), a (minor), AE (external), P (promotion), C (collect)
- len is the length, when the event is an allocation, otherwise there is no len

*)

open Memtrace.Trace
let dump filename outfile =
  let trace = Reader.open_ ~filename in
  let outch = Stdlib.open_out outfile in
  Reader.iter trace (fun _time ev ->
    (* Printf.printf "%010Ld " (Timedelta.to_int64 time); *)
    match ev with
  | Alloc {obj_id; length; nsamples; source; backtrace_buffer; backtrace_length; common_prefix} ->
    let src =
      match source with
      | Minor -> "a"
      | Major -> "A"
      | External -> "AE" in
    Printf.fprintf outch "%010d %s %d" (obj_id :> int) src length;
    ignore(backtrace_buffer,backtrace_length,common_prefix,nsamples);
    (*
    let print_location ppf loc =
      Printf.fprintf ppf "%s" (Location.to_string loc) in
    for i = 0 to backtrace_length - 1 do
      let s = backtrace_buffer.(i) in
      match Reader.lookup_location_code trace s with
      | [] -> Printf.printf " $%d" (s :> int)
      | ls -> ls |> List.iter (Printf.printf " %a" print_location)
    done;
       *)
    Printf.fprintf outch "\n%!"
  | Promote id ->
    Printf.fprintf outch "%010d P\n" (id :> int)
  | Collect id ->
    Printf.fprintf outch "%010d C\n" (id :> int));
  Reader.close trace


let () =
  if Array.length Sys.argv <> 3 then
    Printf.fprintf stderr "Usage: %s <trace file> <outfile>\n" Sys.executable_name
  else
    dump Sys.argv.(1) Sys.argv.(2) 
