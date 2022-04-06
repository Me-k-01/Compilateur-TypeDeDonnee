(* Datatypes for assembly instructions *)


open Lang;;

type 'v simple_expr =
| ConstSE of int
| VarSE of 'v
| BinOpSE of binop * 'v * 'v
;;

(* 'l for labels, 'v for variables *)
type ('l, 'v) instr = 
| Store of 'v * 'v simple_expr  (* store result of simple_expr in variable *)
| Goto of 'l                    (* unconditional goto *)
| Branch of 'v * 'l * 'l        (* if zero then branch to left, else to right *)
| Exit of 'v                    (* return from function leaving result in variable *)
;;

(*
type instr_var =
| IVarNamed of vname
| IVarNum of int
;;
*)

type instr_var =
| IIndex of int
;;

(* ************************************************************ *)
(* Two kinds of jumps (relative / absolute), 
   and translation from relative to absolute
 *)
    

(* RelJump j jumps j instructions forward (j positive) or backward (j negative) *)
type rel_jump = RelJump of int

(* AbsJump j jumps to absolute address / instruction j *)
type abs_jump = AbsJump of int

(*
type jump = rel_jump | abs_jump;; (* combine all jump in one type *)
*)

(* ************************************************************ *)
(* Operational semantics *)

type exec_result =
| End of int
| Continue of (int array) * int
;;

(*
let get_instr instr var_array =
match instr with
| IVarNamed(name) -> 0 (* a changer *)
| IVarNum(v) -> v
;;
*)

let rec exec_expr expr =
  match expr with
  | ConstSE(n) -> failwith "pouet"
  | VarSE(v) -> v
  | BinOpSE(op, v1, v2) -> v1
;;


let get_var var_array (IIndex index) = var_array.(index);;

let set_var var_array (IIndex index) expr =
  let result = exec_expr expr in
  Array.set var_array index
;;

let exec_instr instr_array var_array pc =
  let instruction = instr_array.(pc) in

  match instruction with
  | Store(index, expr) ->
    begin
      set_var var_array index expr 1;
      var_array, pc + 1
    end
  | Goto(AbsJump label) ->
    var_array, pc + label
  | Branch(cond, AbsJump left, AbsJump right) ->
      if get_var var_array cond = 0 then
        var_array, pc + left
      else
        var_array, pc + right
  | Exit(n) ->
    var_array, -1
;;

exec_instr 

(*
let run_code configuration =
  ()
;;

(* To be defined *)
let string_of_instr_IVar nd = ""
;;
*)

(*
let instructions = [|
  Store ( IIndex 2, VarSE ( IIndex 0)); Store ( IIndex 3, ConstSE 0);
  Store ( IIndex 1, BinOpSE ( BCompar BClt , IIndex 2, IIndex 3));
  Branch ( IIndex 1, AbsJump 5, AbsJump 4); Goto ( AbsJump 9);
  Store ( IIndex 1, ConstSE 0); Store ( IIndex 2, VarSE ( IIndex 0));
  Store ( IIndex 0, BinOpSE ( BArith BAsub , IIndex 1, IIndex 2));
  Goto ( AbsJump 9); Store ( IIndex 2, VarSE ( IIndex 0));
  Store ( IIndex 3, ConstSE 1);
  Store ( IIndex 1, BinOpSE ( BCompar BCgt , IIndex 2, IIndex 3));
  Branch ( IIndex 1, AbsJump 13, AbsJump 17);
  Store ( IIndex 1, VarSE ( IIndex 0)); Store ( IIndex 2, ConstSE 2);
  Store ( IIndex 0, BinOpSE ( BArith BAsub , IIndex 1, IIndex 2));
  Goto ( AbsJump 9); Store ( IIndex 2, VarSE ( IIndex 0));
  Store ( IIndex 3, ConstSE 0);
  Store ( IIndex 1, BinOpSE ( BCompar BCeq , IIndex 2, IIndex 3));
  Exit ( IIndex 1)
|];;


exec_instr instructions [||] 1;;
*)