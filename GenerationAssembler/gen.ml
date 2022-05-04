open Lang;;
open Instrs;;

let find element lst = (* give the position of an element in list *)
  
  let rec find element lst n =
    match lst with
    | head::lst ->
      if element = head then
        n
      else
        find element lst (n + 1)
    | _ -> -1
  in

  find element lst 0
;;

let gen_expr expr var =
  let rec gen_expr expr = 
    match expr with
    | Const (typ, value) -> (

        match value with
        | IntV v -> [Store(var, ConstSE(v))]
        | BoolV v -> failwith "Const must be IntV."

      )
    | VarE (typ, name) -> [Store(var, VarSE(IVarNamed name))]
    | BinOp (typ, binop, expr1, expr2) -> gen_expr expr1 @ gen_expr expr2 @ [Store(var, BinOpSE(binop, IVarNum 2, IVarNum 1))]
    | IfThenElse (typ, expr1, expr2, expr3) -> failwith "IfThenElse are not allowed."
  in 
  
  let instrs = gen_expr expr in
  let len = List.length instrs in
  
  let rec reassign instrs n =
    match instrs with
    | [final] -> [final]
    | (Store(_, expr))::instrs -> Store(IVarNum n, expr) :: reassign instrs (n - 1)
    | _ -> failwith "This error is not reachable"
  in

  reassign instrs (len - 1)
;;

let gen_stmt (Fundefn(Fundecl(typ, name, vardecl1), vardecl2, stmt)) =

  (* ASSEMBLER GENERATION *)

  let rec gen_stmt stmt =
    match stmt with
    | Skip -> []
    | Assign (typ, vname, expr) ->

      gen_expr expr (IVarNamed vname)

    | Seq (stmt1, stmt2) -> gen_stmt stmt1 @ gen_stmt stmt2
    | Cond (expr, stmt_true, stmt_false) ->

      let instrs_true = gen_stmt stmt_true
      and instrs_false = gen_stmt stmt_false in
      
      let len_true = List.length instrs_true
      and len_false = List.length instrs_false in

      gen_expr expr (IVarNum 0) @ [Branch(IVarNum 0, RelJump (2 + len_false), RelJump 1)] @ instrs_false @ [Goto(RelJump(2 + len_true))] @ instrs_true @ [Goto(RelJump(1))]

    | While (expr, stmt) ->

      let instrs = gen_stmt stmt
      and exprs = gen_expr expr (IVarNum 0) in

      let len_instrs = List.length instrs in
      let len_exprs = List.length exprs in

      exprs @ [Branch(IVarNum 0, RelJump 1, RelJump (2 + len_instrs))] @ instrs @ [Goto(RelJump (- len_instrs - len_exprs - 1))]

    | Return (expr) -> gen_expr expr (IVarNum 0) @ [Exit(IVarNum 0)]
  in

  let instrs = gen_stmt stmt in

  (* ABSOLUTE ADDRESSES *)

  let rec edit_stmt instrs n =
    match instrs with
    | Goto(RelJump j)::instrs -> Goto(AbsJump (n + j)) :: edit_stmt instrs (n + 1)
    | Branch(num, RelJump j1, RelJump j2)::instrs -> Branch(num, AbsJump (n + j1), AbsJump (n + j2)) :: edit_stmt instrs (n + 1)
    | other::instrs -> other :: edit_stmt instrs (n + 1) 
    | [] -> []
  in

  let instrs = edit_stmt instrs 0 in

  (* INDEXED VARIABLES *)

  let rec get_variables vardecls = (* give all variables of the function *)
    match vardecls with
    | (Vardecl(_, name))::vardecls -> name :: get_variables vardecls
    | _ -> []
  in
  let variables = get_variables (vardecl1 @ vardecl2) in
  let min = List.length variables in

  let edit_var var =
    match var with
    | IVarNamed(name) -> IIndex(find name variables)
    | IVarNum(n) -> IIndex(min + n)
    | other -> other
    in

  let edit_expr expr =
    match expr with
    | VarSE(var) -> VarSE(edit_var var) 
    | BinOpSE(binop, var1, var2) -> BinOpSE(binop, edit_var var1, edit_var var2)
    | other -> other
  in

  let rec edit_stmt instrs =
    match instrs with
    | Store(var, expr)::instrs -> Store(edit_var var, edit_expr expr) :: edit_stmt instrs
    | Branch(var, j1, j2)::instrs -> Branch(edit_var var, j1, j2) :: edit_stmt instrs
    | Exit(var)::instrs -> Exit(edit_var var) :: edit_stmt instrs

    | other::instrs -> other :: edit_stmt instrs
    | _ -> []
  in

  let instrs = edit_stmt instrs in

  (* END *)

  Array.of_list instrs (* transform list into array *)
;;
