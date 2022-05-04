open Graph
open Instrs
open Lang

type edge_label = Standard | BranchIf of bool

let ajout_node cpt consigne node = (Node(cpt,consigne))::node

let ajout_edge cpt cible edge = (Edge(cpt,cible, ""))::edge

let ajout_edge2 cpt cible cible2 edge = (Edge(cpt,cible, "BranchIf true"))::(Edge(cpt,cible2, "BranchIf false"))::edge


let analyse_ligne cpt consigne node edge = match consigne with
  | Store(_)  -> Graph(ajout_node cpt consigne node, ajout_edge cpt (cpt+1) edge)
  | Branch(_, AbsJump a, AbsJump b) -> Graph(ajout_node cpt consigne node, ajout_edge2 cpt a b edge )
  | Goto(AbsJump i)  ->  Graph(ajout_node cpt consigne node, ajout_edge cpt i edge)
  | Exit(_) -> Graph(ajout_node cpt consigne node, edge)
  | _ -> failwith "Oubli de match sur analyse_ligne"

(* prend un array de code -> (num, instruction) list * (num,cible) list *)
(* Graph of ('n, 'nl) node list * ('n, 'el) edge list *)
let graph_of_code code =

  let code = Array.to_list code in

  (* Compteur de ligne *)
  let cpt = 0 in

  (* Balade dans le tableau des instructions *)
  let rec parcours code cpt (Graph(node,edge)) = match code with
    | consigne::reste -> parcours reste (cpt+1) (analyse_ligne cpt consigne node edge)
    | _ -> Graph(node,edge)


  in parcours code cpt (Graph([],[]))


(* ************************************************************ *)
(* ***************** FONCTIONS DE CONVERSIONS ***************** *)
let string_of_instrExprBin binop = match binop with
 | BArith BAsub -> " - "
 | BArith BAadd -> " + "
 | BArith BAmul -> " * "
 | BArith BAdiv -> " / "
 | BArith BAmod -> " mod "

 | BCompar BCeq -> " == "
 | BCompar BCge -> " >= "
 | BCompar BCgt -> " > "
 | BCompar BCle -> " <= "
 | BCompar BClt -> " < "
 | BCompar BCne -> " != "

let string_of_instr_IVarIIndex = function
  | IIndex a -> "V" ^ string_of_int(a)
  | _ -> failwith "code2graph forget matching"

let string_of_instrExpr expr = match expr with
 | VarSE ( a ) -> string_of_instr_IVarIIndex(a)
 | ConstSE a -> string_of_int(a)
 | BinOpSE (a, b, c) -> (string_of_instr_IVarIIndex b) ^ (string_of_instrExprBin a) ^ (string_of_instr_IVarIIndex c)


let string_of_instr_IVar = function
 | Goto(_) -> "goto"
 | Store( a, b ) -> (string_of_instr_IVarIIndex a) ^ " := " ^ (string_of_instrExpr b)
 | Branch ( a, _, _) -> (string_of_instr_IVarIIndex a) ^ "?"
 | Exit a -> "Return" ^ (string_of_instr_IVarIIndex a)

(* prend un noeud en entree, (num instruction, instruction) -> label instruction  *)
let node_label_display (Node(num, consigne)) = string_of_int(num) ^ " [label= " ^ string_of_instr_IVar consigne ^ "]"



let edge_label_display (Edge(depart, arrive, label)) = match label with
  | "BranchIf true" -> string_of_int(depart) ^ " -> "^ string_of_int(arrive) ^ " [label= T ]"
  | "BranchIf false" ->string_of_int(depart) ^ " -> "^ string_of_int(arrive) ^ " [label= F ]"
  | _ -> string_of_int(depart) ^ " -> "^ string_of_int(arrive)

(*
let display_of_code code =
  Display (graph_of_code code, string_of_int, node_label_display, edge_label_display)*)



  (* ************************************************************ *)
let display_of_code code =
  print_string("digraph { \n");
  let (Graph((codeNd, codeEd))) = graph_of_code code in

  (* Balade dans le tableau des instructions *)
  let rec parcours f liste = match liste with
    | tete::reste -> print_string(f tete ^ "\n"  );
                     parcours f reste
    | _ -> print_string("")


  in parcours node_label_display codeNd; parcours edge_label_display codeEd ;  print_string("}");;

(* ************************************************************ *)

(*
[
0  Store ( IIndex 2, VarSE ( IIndex 0));
1  Store ( IIndex 3, ConstSE 0);
2  Store ( IIndex 1, BinOpSE ( BCompar BClt , IIndex 2, IIndex 3));
3  Branch ( IIndex 1, AbsJump 5, AbsJump 4);
4  Goto ( AbsJump 9);
5  Store ( IIndex 1, ConstSE 0);
6  Store ( IIndex 2, VarSE ( IIndex 0));
7  Store ( IIndex 0, BinOpSE ( BArith BAsub , IIndex 1, IIndex 2));
8  Goto ( AbsJump 9);
9  Store ( IIndex 2, VarSE ( IIndex 0));
10 Store ( IIndex 3, ConstSE 1);
11 Store ( IIndex 1, BinOpSE ( BCompar BCgt , IIndex 2, IIndex 3));
12 Branch ( IIndex 1, AbsJump 13, AbsJump 17);
13 Store ( IIndex 1, VarSE ( IIndex 0));
14 Store ( IIndex 2, ConstSE 2);
15 Store ( IIndex 0, BinOpSE ( BArith BAsub , IIndex 1, IIndex 2));
16 Goto ( AbsJump 9);
17 Store ( IIndex 2, VarSE ( IIndex 0));
18 Store ( IIndex 3, ConstSE 0);
19 Store ( IIndex 1, BinOpSE ( BCompar BCeq , IIndex 2, IIndex 3));
20 Exit ( IIndex 1)]

**********************

en realite il y a 2 tableaux :
  - Graph ([valeur des noeuds], [construction du graphe])

0 [label= "V1 := n"]
1 [label= "V2 := 0"]
2 [label= "V0 := V1 < V2"]
3 [label= "V0?"]
4 [label= "goto "]
5 [label= "V0 := 0"]
6 [label= "V1 := n"]
7 [label= "n := V0 - V1"]
8 [label= "goto "]
9 [label= "V1 := n"]
10 [label= "V2 := 1"]
11 [label= "V0 := V1 > V2"]
12 [label= "V0?"]
13 [label= "V0 := n"]
14 [label= "V1 := 2"]
15 [label= "n := V0 - V1"]
16 [label= "goto "]
17 [label= "V1 := n"]
18 [label= "V2 := 0"]
19 [label= "V0 := V1 = V2"]
20 [label= "exit V0"]
0 -> 1
1 -> 2
2 -> 3
3 -> 5 [label= T]
3 -> 4 [label= F]
4 -> 9
5 -> 6
6 -> 7
7 -> 8
8 -> 9
9 -> 10
10 -> 11
11 -> 12
12 -> 13 [label= T]
12 -> 17 [label= F]
13 -> 14
14 -> 15
15 -> 16
16 -> 9
17 -> 18
18 -> 19
19 -> 20
*)


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
  Store ( IIndex 1, VarSE ( IIndex 0));
  Store ( IIndex 2, ConstSE 2);
  Store ( IIndex 0, BinOpSE ( BArith BAsub , IIndex 1, IIndex 2));
  Goto ( AbsJump 9); Store ( IIndex 2, VarSE ( IIndex 0));
  Store ( IIndex 3, ConstSE 0);
  Store ( IIndex 1, BinOpSE ( BCompar BCeq , IIndex 2, IIndex 3));
  Exit ( IIndex 1)
 |];;

(*graph_of_code instructions;;*)
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
(*
node_label_display (Node (20, Exit (IIndex 1)));;

edge_label_display (Edge (19, 20, ""));;


display_of_code instructions;;*)
