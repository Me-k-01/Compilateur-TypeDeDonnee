bool even (int n) {
    if (n < 0)
        /* no unary expressions available ... */
        n = 0 - n;
    
    while (n > 1) {
        n = n - 2;
        }
    
    return (n == 0) ;
}

/*
 
Fundefn ( 
Fundecl (BoolT , "even", [ Vardecl (IntT , "n")]) , [],
    Seq
        (Seq
            (Cond
                ( BinOp (BoolT , BCompar BClt , VarE (IntT , "n"), Const (IntT , IntV 0)) ,
                    Assign (IntT , "n",
                BinOp (IntT , BArith BAsub , Const (IntT , IntV 0), VarE (IntT , "n"))) ,
                Skip),

            While
                ( BinOp (BoolT , BCompar BCgt , VarE (IntT , "n"), Const (IntT , IntV 1)) ,
            Assign (IntT , "n",
                BinOp (IntT , BArith BAsub , VarE (IntT , "n"), Const (IntT , IntV 2))))
            ),
            Return
            ( BinOp (BoolT , BCompar BCeq , VarE (IntT , "n"), Const (IntT , IntV 0)))
        )
)


Cond (BinOp (0, BCompar BClt, VarE (0, "n"), Const (0, IntV 0)),
 Seq
  (Assign (0, "n", BinOp (0, BArith BAsub, Const (0, IntV 0), VarE (0, "n"))),
  Seq
   (While (BinOp (0, BCompar BCle, VarE (0, "n"), Const (0, IntV 1)),
     Assign (0, "n",
      BinOp (0, BArith BAsub, VarE (0, "n"), Const (0, IntV 2)))),
   Return (BinOp (0, BCompar BCeq, VarE (0, "n"), Const (0, IntV 0)))) ),
 Skip)

 */
