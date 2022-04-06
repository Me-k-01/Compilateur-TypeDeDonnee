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

let tpOfBinOp c = match c with
    | (BArith ari) -> IntT (* TODO: alg d'unification *)
    | (BCompar comp) -> BoolT (* retourne toujours un booleen*)
;; (* BinOp -> tp *)

let rec tpExpr expr = match expr with
    | Const (_, value) -> Const (tpOfConst value, value)
    | VarE (_, value) -> VarE (IntT, value)
    | BinOp (_, comp, a, b) -> 
        let tpA = tpExpr a and tpB = tpExpr b in
        if ((Lang.tp_of_expr tpA) = (Lang.tp_of_expr tpB)) then
            BinOp (tpOfBinOp comp, comp, tpA, tpB) 
        else 
            failwith "Opération mal formée"
    (*| IfThenElse (t, _, _, _) -> t*) (* TODO *)
;; (* expr -> expr *)

let tpStmt stmt = 
    stmt
;; (* stmt -> stmt *) 
