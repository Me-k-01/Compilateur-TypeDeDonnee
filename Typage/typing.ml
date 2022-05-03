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

let rec tpOfVar v (env: vardecl list) = match env with
    (* TODO: trouver le type de la variable v dans l'environnement courant*)
    | (Vardecl (tp, vname)::env) when (vname = v) -> tp
    | (Vardecl (_, _)::env) -> tpOfVar v env
    | [] -> failwith ("La variable " ^ v ^ " n'existe pas.")
;; (* Const -> vardecl list -> tp *)

let tpOfBinOp c = match c with
    | (BArith ari) -> IntT (* TODO: alg d'unification SI on utiliser les expr arithmetiques sur autre chose que des entiers *)
    | (BCompar comp) -> BoolT (* retourne toujours un booleen*)
;; (* BinOp -> tp *)

let rec tpExpr expr env = match expr with
    | Const (_, value) -> Const (tpOfConst value, value)
    | VarE (_, value) -> VarE (tpOfVar value env, value) (* TODO: tpOfVar *)
    | BinOp (_, comp, a, b) -> 
        let tpA = tpExpr a env and tpB = tpExpr b env in
        (* On vérifie que l'opération est correctement typée *)
        if ((Lang.tp_of_expr tpA) = (Lang.tp_of_expr tpB)) then 
            BinOp (tpOfBinOp comp, comp, tpA, tpB) 
        else
            failwith "Opération mal formée"
    | IfThenElse (_, cond, a, b) -> 
        let tpA = tpExpr a env and tpB = tpExpr b env in
        let t = Lang.tp_of_expr tpA in
        (* On vérifie que l'opération est correctement typée *)
        if (t = (Lang.tp_of_expr tpB)) then 
            IfThenElse (t, tpExpr cond env, tpA, tpB) 
        else
            failwith "Opération mal formée"
;; (* tpExpr : expr -> expr *)

let rec tpStmt stmt env = match stmt with
    | Skip -> Skip
    | Assign (_, vname, expr) -> 
        let newExpr = tpExpr expr env in
        Assign (Lang.tp_of_expr newExpr, vname, newExpr)
    | Seq (a, b) -> Seq (tpStmt a env, tpStmt b env)  
    | Cond (expr, a, b) -> Cond (tpExpr expr env, tpStmt a env, tpStmt b env)
    | While (expr, stmt) -> While (tpExpr expr env, tpStmt stmt env) 
    | Return (expr) -> Return (tpExpr expr env)
;; (* tpStmt : stmt -> stmt *) 

let rec findVar name (args: vardecl list) = match args with 
    | Vardecl(currName, _)::args -> (currName == name) || (findVar name args)
    | [] -> false
;; (* findVar : Lang.tp -> Lang.vardecl list -> bool *)

(* Fonction pour verifier que les paramètres et variables locales des fonctions ont des noms disjoints *)
let rec verifArgs (args: vardecl list) = match args with
    | Vardecl(name, _)::args -> not (findVar name args) && (verifArgs args)
    | [] -> true
;; (* verifArgs : Lang.vardecl list -> bool *)


(* Fonction pour verifier que le return est toujours accessible *)
let rec verifReturnAccess stmt = match stmt with
    | Cond (_, a, b) -> verifReturnAccess a && verifReturnAccess b
    | While (_, stmt) -> verifReturnAccess stmt
    | Return _ -> true

    | Seq (Return _, _) -> failwith "L'instruction qui suit le return n'est pas accessible"
    | Seq (_, Return _) -> true
    | Seq (_, lastStmt) -> verifReturnAccess lastStmt
    
    | _ -> false
;;

(* Fonction pour verifier que le type de tout retour de fonction est celui attendu *)
let rec verifReturnsType (stmt: 'a stmt) (tp: Lang.tp) = match stmt with
    | Seq (a, b) -> (verifReturnsType a tp) && (verifReturnsType b tp) 
    | Cond (_, a, b) -> (verifReturnsType a tp) && (verifReturnsType a tp)
    | While (_, stmt) -> verifReturnsType stmt tp
    | Return (expr) -> Lang.tp_of_expr expr == tp

    | _ -> true
;;

let stringOfTp = function
    | IntT -> "int"
    | BoolT -> "bool"
;; (* stringOfTp : Lang.tp -> string *)

let rec tpFunDefn fndef = match fndef with
    | Fundefn (Fundecl (returnTp, fname , vardecl) as fundecl, args, stmt) -> 
        (* La fonction ne doit pas avoir de redondance dans les noms de ses arguments *)
        if (verifArgs args) then 
            (* On type le corps de la fonction pour pouvoir verifier le typage des returns *)
            let stmt = tpStmt stmt vardecl in
            (* Le return de la fonction doit être accessible *)
            if (verifReturnAccess stmt) then
                (* Le return de la fonction doit renvoyer un résultat du type attendu par la fonction *)
                if (verifReturnsType stmt returnTp) then
                    Fundefn (fundecl, args, stmt)
                else
                    failwith ("La fonction " ^ fname ^ " attend un retour de type " ^ (stringOfTp returnTp) ^ " mais une expression d'un type different a été fournis")
            else
                failwith ("Le retour de la fonction " ^ fname ^ " est potentiellement inaccessible")
        else 
            failwith ("Redondance des noms dans les paramètres de la fonction " ^ fname ^ ".")
;; (* tpFunDefn : 'a Lang.fundefn -> Lang.tp Lang.fundefn  *)