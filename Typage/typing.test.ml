#load "lang.cmo";;
#use "typing.ml";;

let testConst = Const (0, IntV 0);;
let testSeq = Seq
    (Seq
        (Cond
            (BinOp (0, BCompar BClt, 
              VarE (0, "n"),
              Const (0, IntV 0)),
            Assign (0, "n",
            BinOp (0, BArith BAsub, 
              Const (0, IntV 0),
              VarE (0, "n")
            )),
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

tpExpr testConst;;
tpStmt testSeq;;
tpFunDefn testFun;;