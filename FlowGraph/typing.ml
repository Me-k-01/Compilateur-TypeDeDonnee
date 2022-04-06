(* Typechecking of source programs *)

open Lang


(* Environments *)
let testConst = Const (0, IntV 0);;
let testSeq = Seq
    (Seq
        (Cond
            (BinOp (0, BCompar BClt, VarE (0, "n"),
            Const (0, IntV 0)),
            Assign (0, "n",
            BinOp (0, BArith BAsub, Const (0, IntV 0),
            VarE (0, "n"))),
            Skip),
        While
            (BinOp (0, BCompar BCgt, VarE (0, "n"),
            Const (0, IntV 1)),
            Assign (0, "n",
            BinOp (0, BArith BAsub, VarE (0, "n"),
            Const (0, IntV 2))))),
    Return
        (BinOp (0, BCompar BCeq, VarE (0, "n"),
            Const (0, IntV 0)
        )
    )
);;
let testFun = Fundefn
    (Fundecl (BoolT, "even", [Vardecl (IntT, "n")]), 
        [],
        testSeq
    )
;;
type environment = {
    localvar: (vname * tp) list; 
    returntp: tp
};;

(************ Fonction ajouté ***************)
let tpOfConst c = match c with
    | (IntV _) -> IntT
    | (BoolV _) -> BoolT
;;

let tpExpr expr = match expr with
    | Const (_, value) -> Const (tpOfConst value, value)
    | VarE (_, value) -> VarE (IntT, value)
;; (* expr -> expr *)

let tpStmt stmt = 
    stmt
;; (* stmt -> stmt *) 
