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


type instr_var =
| IVarNamed of vname
| IVarNum of int
| IIndex of int
;;

(* ************************************************************ *)
(* Two kinds of jumps (relative / absolute), 
   and translation from relative to absolute
 *)
    

(* RelJump j jumps j instructions forward (j positive) or backward (j negative) *)
(* AbsJump j jumps to absolute address / instruction j *)
type jump =
| RelJump of int
| AbsJump of int
;;

(* ************************************************************ *)
(* Operational semantics *)

type exec_result =
| End of int
| Continue of (int array) * int
;;


let get_var var_array var = 
  match var with
  | IIndex(index) -> var_array.(index)
  | _ -> failwith "This function can not be used with IVarNum and IVarNamed."
;;

let operateArith v w operator =
  match (v, w) with
  | (IntV v, IntV w) -> IntV(operator v w)
  | _ -> failwith "First and second parameters must be IntV."
;;
let operateCompar v w operator =
  match (v, w) with
  | (IntV _, IntV _) -> BoolV(operator v w)
  | (BoolV _, BoolV _) -> BoolV(operator v w)
  | _ -> failwith "First and second parameteres must be of the same Constructor."
;;

(* execute an expression *)
let rec exec_expr var_array expr =
  let get = get_var var_array in

  match expr with
  | ConstSE(n) -> IntV(n)
  | VarSE(v) -> get v (* a changer surement *)
  | BinOpSE(BArith op, v1, v2) -> (
    match op with
    | BAadd -> operateArith (get v1) (get v2) ( + )
    | BAsub -> operateArith (get v1) (get v2) ( - )
    | BAmul -> operateArith (get v1) (get v2) ( * )
    | BAdiv -> operateArith (get v1) (get v2) ( / )
    | BAmod -> operateArith (get v1) (get v2) (mod)
  )
  | BinOpSE(BCompar op, v1, v2) -> (
    match op with
    | BCeq -> operateCompar (get v1) (get v2) ( = )
    | BCge -> operateCompar (get v1) (get v2) ( >= )
    | BCgt -> operateCompar (get v1) (get v2) ( > )
    | BCle -> operateCompar (get v1) (get v2) ( <= )
    | BClt -> operateCompar (get v1) (get v2) ( < )
    | BCne -> operateCompar (get v1) (get v2) ( <> )
  )
;;

let set_var var_array var expr =
  match var with
  | IIndex(index) ->
    let result = exec_expr var_array expr in
    Array.set var_array index result
  | _ -> failwith "This function can not be used with IVarNum and IVarNamed."
;;

let goto jump pc =
match jump with
| RelJump(n) -> pc + n
| AbsJump(n) -> n
;;

let exec_instr instr_array var_array pc =
  let instruction = instr_array.(pc) in

  match instruction with
  | Store(index, expr) ->
    begin
      set_var var_array index expr;
      var_array, pc + 1, 1
    end
  | Goto(jump) ->
    var_array, goto jump pc, 1
  | Branch(cond, left, right) -> (
    match (get_var var_array cond) with
    | IntV n ->
      if n = 1 then
        var_array, goto left pc, 1
      else
        var_array, goto right pc, 1
    | BoolV b ->
      if b then
        var_array, goto left pc, 1
      else
        var_array, goto right pc, 1
    )
  | Exit(n) -> (
    match get_var var_array n with
    | IntV(n) -> var_array, n, 0
    | BoolV(true) -> var_array, 1, 0
    | BoolV(false) -> var_array, 0, 0
    )
    
;;


let run_code configuration arguments = (* configuration = instructions *)
  let array = [|IntV 0; IntV 0; IntV 0; IntV 0; IntV 0; IntV 0; IntV 0|] in

  let rec put_arguments_in_array array arguments n =
    match arguments with
    | e::l ->  Array.set array n (IntV(e)); put_arguments_in_array array l (n + 1)
    | _ -> ()
  in
  let () = put_arguments_in_array array arguments 0 in

  let pc = 0
  and exec = exec_instr configuration in
  
  let rec run (array, pc, status) =
    if status = 0 then array, pc
    else run (exec array pc)
  in

  run (array, pc, 1)
;;






