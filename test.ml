(*  
  this file is a test of the compiler in toplevel
  to use it properly, run the command :

  make && ocaml < test.ml
*)

#load "lang.cmo";;
#load "parser.cmo" ;;
#load "lexer.cmo" ;;
#load "interf.cmo";;

#load "typing.cmo";;
#load "gen.cmo";;
#load "instrs.cmo";;

let parser = Interf.parse "./Examples/even.c";;
let typing = Typing.tpFunDefn parser;;
let generation = Gen.gen_stmt typing;;

Instrs.run_code generation [5];;
Instrs.run_code generation [6];;