%{
open Lang
%}


/*Value*/
%token <bool> BCONSTANT
%token <int> INTCONSTANT
%token <string> VAR 

/* Declaration de type */
%token TYPE

/*Binary arithmetic comparator*/
%token BC_EG
%token BC_SUP_EG
%token BC_INF_EG
%token BC_SUP
%token BC_INF
%token BC_DIF
%right BC_EG BC_SUP_EG BC_INF_EG BC_SUP BC_INF BC_DIF

/*Binary arithmetic operator*/
%token BA_ADD
%token BA_SUB
%token BA_MUL
%token BA_DIV
%token BA_MOD
%left BA_ADD BA_SUB
%left BA_MUL BA_DIV BA_MOD

/*Parenthesage*/
%token PAR_OPEN
%token PAR_CLOSE
%token BRACKET_OPEN
%token BRACKET_CLOSE

/*structure de controle*/
%token IF
%token THEN
%token ELSE
%token FOR
%token WHILE
%token RETURN
%token LET

/*Fin expression*/
%token SEMICOLON
%left SEMICOLON

/*Commentaire*/
%token COMM_OPEN
%token COMM_CLOSE
%token COMM

/*Fin de fichier*/
%token EOF


%start start
/* TODO: For complete grammar, comment in this line:
%type <int Lang.fundefn> start
  */

%type <int Lang.stmt> start
    
%%

start: statement { $1 }
;

/* *******  EXPRESSIONS  ******* */

/*Valeurs*/
constant:
  BCONSTANT    { Const(0, BoolV $1) }
| INTCONSTANT  { Const(0, IntV $1) }
;

/*Variables*/
variable:
 VAR { VarE(0, $1) }
;

/*Parenthesage*/
parenthesage:
  PAR_OPEN expression PAR_CLOSE  { ($2) }
;

/*Binary arithmetic operator*/
binary_operation :
| expression BA_ADD expression { BinOp(0, BArith BAadd, $1 , $3 ) }
| expression BA_SUB expression { BinOp(0, BArith BAsub, $1 , $3 ) }
| expression BA_MUL expression { BinOp(0, BArith BAmul, $1 , $3 ) }
| expression BA_DIV expression { BinOp(0, BArith BAdiv, $1 , $3 ) }
| expression BA_MOD expression { BinOp(0, BArith BAmod, $1 , $3 ) }

/*Binary comparison operator*/
| expression BC_EG expression     { BinOp(0, BCompar BCeq, $1 , $3 ) }
| expression BC_SUP_EG expression { BinOp(0, BCompar BCge, $1 , $3 ) }
| expression BC_INF_EG expression { BinOp(0, BCompar BCgt, $1 , $3 ) }
| expression BC_SUP expression    { BinOp(0, BCompar BCle, $1 , $3 ) }
| expression BC_INF expression    { BinOp(0, BCompar BClt, $1 , $3 ) }
| expression BC_DIF expression    { BinOp(0, BCompar BCne, $1 , $3 ) }
;

ifthenelse :
  /*IF PAR_OPEN expression PAR_CLOSE BRACKET_OPEN expression BRACKET_CLOSE { IfThenElse(0, $3, $6, skip ) }*/
| IF PAR_OPEN expression PAR_CLOSE BRACKET_OPEN expression BRACKET_CLOSE ELSE BRACKET_OPEN expression BRACKET_CLOSE { IfThenElse(0, $3, $6, $10 ) }
;


/*expression globale*/
expression :
  constant         { $1 }
| variable         { $1 }
| parenthesage     { $1 }
| binary_operation { $1 }
| ifthenelse { $1 }
;


/* *******  STATEMENTS  ******* */

statement:
  skip { $1 }
| assign { $1 }
| return_statement { $1 }
| seq { $1 }
;

seq:
 statement SEMICOLON statement {Seq( $1, $3 )}
 /*RETURN expression SEMICOLON { Return $2 }*/
;

/* instanciation */
assign:
 VAR BC_EG constant SEMICOLON {Assign(0, $1, $3) }
;

/*retour simple*/
return_statement: 
 RETURN expression SEMICOLON { Return $2 }
;

/*commentaire*/
skip:
  COMM_OPEN COMM_CLOSE { Skip } /*TODO - acceptez nimporte quoi entre ça*/
| COMM { Skip }
;
