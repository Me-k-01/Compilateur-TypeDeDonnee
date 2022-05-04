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

#load "code2graph.cmo";;
#load "graph.cmo";;

let parser = Interf.parse "./Examples/even.c";;
let typing = Typing.tpFunDefn parser;;
let generation = Gen.gen_stmt typing;;

Code2graph.graph_of_code generation;;
Code2graph.display_of_code generation;;


Instrs.run_code generation [5];;
Instrs.run_code generation [6];;
