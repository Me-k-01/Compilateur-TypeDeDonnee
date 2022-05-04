#use "code2graph.ml";;


let instructions = [|
  Store ( IIndex 2, VarSE ( IIndex 0));
  Store ( IIndex 3, ConstSE 0);
  Store ( IIndex 1, BinOpSE ( BCompar BClt , IIndex 2, IIndex 3));
  Branch ( IIndex 1, AbsJump 5, AbsJump 4);
  Goto ( AbsJump 9);
  Store ( IIndex 1, ConstSE 0);
  Store ( IIndex 2, VarSE ( IIndex 0));
  Store ( IIndex 0, BinOpSE ( BArith BAsub , IIndex 1, IIndex 2));
  Goto ( AbsJump 9);
  Store ( IIndex 2, VarSE ( IIndex 0));
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

graph_of_code instructions;;

(*
Graph
 ([Node (20, Exit (IIndex 1));
   Node (19, Store (IIndex 1, BinOpSE (BCompar BCeq, IIndex 2, IIndex 3)));
   Node (18, Store (IIndex 3, ConstSE 0));
   Node (17, Store (IIndex 2, VarSE (IIndex 0)));
   Node (16, Goto (AbsJump 9));
   Node (15, Store (IIndex 0, BinOpSE (BArith BAsub, IIndex 1, IIndex 2)));
   Node (14, Store (IIndex 2, ConstSE 2));
   Node (13, Store (IIndex 1, VarSE (IIndex 0)));
   Node (12, Branch (IIndex 1, AbsJump 13, AbsJump 17));
   Node (11, Store (IIndex 1, BinOpSE (BCompar BCgt, IIndex 2, IIndex 3)));
   Node (10, Store (IIndex 3, ConstSE 1));
   Node (9, Store (IIndex 2, VarSE (IIndex 0))); Node (8, Goto (AbsJump 9));
   Node (7, Store (IIndex 0, BinOpSE (BArith BAsub, IIndex 1, IIndex 2)));
   Node (6, Store (IIndex 2, VarSE (IIndex 0)));
   Node (5, Store (IIndex 1, ConstSE 0)); Node (4, Goto (AbsJump 9));
   Node (3, Branch (IIndex 1, AbsJump 5, AbsJump 4));
   Node (2, Store (IIndex 1, BinOpSE (BCompar BClt, IIndex 2, IIndex 3)));
   Node (1, Store (IIndex 3, ConstSE 0));
   Node (0, Store (IIndex 2, VarSE (IIndex 0)))],
 [Edge (19, 20, ""); Edge (18, 19, ""); Edge (17, 18, ""); Edge (16, 9, "");
  Edge (15, 16, ""); Edge (14, 15, ""); Edge (13, 14, "");
  Edge (12, 13, "BranchIf true"); Edge (12, 17, "BranchIf false");
  Edge (11, 12, ""); Edge (10, 11, ""); Edge (9, 10, ""); Edge (8, 9, "");
  Edge (7, 8, ""); Edge (6, 7, ""); Edge (5, 6, ""); Edge (4, 9, "");
  Edge (3, 5, "BranchIf true"); Edge (3, 4, "BranchIf false");
  Edge (2, 3, ""); Edge (1, 2, ""); Edge (0, 1, "")])
*)

node_label_display (Node (20, Exit (IIndex 1)));;

edge_label_display (Edge (19, 20, ""));;


display_of_code instructions;;
