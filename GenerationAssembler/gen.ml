open Lang;;

let gen_expr =
  ()
;;

Fundefn ( Fundecl (BoolT , "even", [ Vardecl (IntT , "n")]) , [],
  Seq
    (Seq
      (Cond
        (BinOp (BoolT , BCompar BClt , VarE (IntT , "n"), Const (IntT , IntV 0)) ,
        Assign (IntT , "n",
          BinOp (IntT , BArith BAsub , Const (IntT , IntV 0), VarE (IntT , "n"))) ,
        Skip),
      While
        (BinOp (BoolT , BCompar BCgt , VarE (IntT , "n"), Const (IntT , IntV 1)) ,
        Assign (IntT , "n",
          BinOp (IntT , BArith BAsub , VarE (IntT , "n"), Const (IntT , IntV 2))))) ,
    Return
      (BinOp (BoolT , BCompar BCeq , VarE (IntT , "n"), Const (IntT , IntV 0)))))
;;

