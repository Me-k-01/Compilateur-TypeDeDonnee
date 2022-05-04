(*  
  this file is the main file of the compiler
  to use the compiler, run the command :

  make && ./compiler "./Examples/even.c"
*)

let parser = try Interf.parse Sys.argv.(1) with
  | Invalid_argument _ -> failwith "Please enter a file path as argument."
;;

let typing = Typing.tpFunDefn parser;;
let generation = Gen.gen_stmt typing;;
let execution = Instrs.run_code generation;;

