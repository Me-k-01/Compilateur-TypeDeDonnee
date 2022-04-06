%{
open Lang
%}


/*Value*/
%token <bool> BCONSTANT
%token <int> INTCONSTANT

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

/*Commentaire*/
%token COMM_OPEN
%token COMM_CLOSE
%token COMM

/*autre*/
%token RETURN

/*Fin expression*/
%token SEMICOLON

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

/*Parenthesage*/
parenthesage:
  PAR_OPEN expression PAR_CLOSE  { ($2) }
;
commentaire :
  COMM_OPEN COMM_CLOSE { }
;


/*expression globale*/
expression :
  constant         { $1 }
| parenthesage     { $1 }
| commentaire      { $1 }
| binary_operation { $1 }
;

/* *******  STATEMENTS  ******* */

statement:
  skip { $1 }
| return_statement { $1 }

;


return_statement: 
  RETURN expression SEMICOLON 
{ Return $2 }
;

/*commentaire*/
skip:
  COMM_OPEN COMM_CLOSE { Skip }
| COMM { Skip }
;
