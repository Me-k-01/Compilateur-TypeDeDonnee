(* Typechecking of source programs *)
open Lang

(* Environments *)

type environment = {
    localvar: (vname * tp) list; 
    returntp: tp
}

(************ Fonction ajouté ***************)
let tpOfConst c = match c with
    | (IntV _) -> IntT
    | (BoolV _) -> BoolT
;; (* Const -> tp *)

let rec tpOfVar v = 
    (* TODO: trouver le type de la variable v dans l'environnement courant*)
    IntT
;; (* Const -> tp *)

let tpOfBinOp c = match c with
    | (BArith ari) -> IntT (* TODO: alg d'unification SI on utiliser les expr arithmetiques sur autre chose que des entiers *)
    | (BCompar comp) -> BoolT (* retourne toujours un booleen*)
;; (* BinOp -> tp *)

let rec tpExpr expr = match expr with
    | Const (_, value) -> Const (tpOfConst value, value)
    | VarE (_, value) -> VarE (tpOfVar value, value) (* TODO: tpOfVar *)
    | BinOp (_, comp, a, b) -> 
        let tpA = tpExpr a and tpB = tpExpr b in
        (* On vérifie que l'opération est correctement typée *)
        if ((Lang.tp_of_expr tpA) = (Lang.tp_of_expr tpB)) then 
            BinOp (tpOfBinOp comp, comp, tpA, tpB) 
        else
            failwith "Opération mal formée"
    | IfThenElse (_, cond, a, b) -> 
        let tpA = tpExpr a and tpB = tpExpr b in
        let t = Lang.tp_of_expr tpA in
        (* On vérifie que l'opération est correctement typée *)
        if (t = (Lang.tp_of_expr tpB)) then 
            IfThenElse (t, tpExpr cond, tpA, tpB) 
        else
            failwith "Opération mal formée"
;; (* expr -> expr *)

let rec tpStmt stmt = match stmt with
    | Skip -> Skip
    | Assign (_, vname, expr) -> 
        let newExpr = tpExpr expr in
        Assign (Lang.tp_of_expr newExpr, vname, newExpr)
    | Seq (a, b) -> Seq (tpStmt a, tpStmt b)  
    | Cond (expr, a, b) -> Cond (tpExpr expr, tpStmt a, tpStmt b)
    | While (expr, stmt) -> While (tpExpr expr, tpStmt stmt) 
    | Return (expr) -> Return (tpExpr expr)
;; (* stmt -> stmt *) 


let rec tpFunDefn fndef = match fndef with
    | Fundefn (fundecl, args, stmt) -> Fundefn (fundecl, args, tpStmt stmt)
;; (* fundefn -> fundefn *)