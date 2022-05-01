%{
open Lang
%}


/*Value*/
%token <bool> BCONSTANT
%token <int> INTCONSTANT
%token <string> VAR
%right VAR

/* Declaration de type */
%token BoolT
%token IntT

/* Virgule */
%token COMMA

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
%right IF THEN ELSE FOR WHILE RETURN LET

/*Fin expression*/
%token SEMICOLON
%left SEMICOLON

/*attribution*/
%token EG

/*Fin de fichier*/
%token EOF


%start start

%type <int Lang.fundefn> start
/*%type <int Lang.stmt> start*/
    
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
 IF expression BRACKET_OPEN expression BRACKET_CLOSE ELSE BRACKET_OPEN expression BRACKET_CLOSE { IfThenElse(0, $2, $4, $8 ) }
;

/*expression globale*/
expression :
  constant         { $1 }
| variable         { $1 }
| parenthesage     { $1 }
| binary_operation { $1 }
| ifthenelse       { $1 }
;


/* *******  STATEMENTS  ******* */

statement:
| seq                 { $1 }
| assign              { $1 }
| selection_statement { $1 }
| while_statement     { $1 }
| return_statement    { $1 }
;

/* instanciation */
assign:
 VAR EG expression SEMICOLON {Assign(0, $1, $3) }
;

seq:
 statement statement { Seq( $1, $2 ) }
;



selection_statement :
  IF PAR_OPEN expression PAR_CLOSE statement %prec ELSE      { Cond( $3, $5, Skip)}
| IF PAR_OPEN expression PAR_CLOSE  statement ELSE statement { Cond( $3, $5, $7 ) }
;

while_statement:
  WHILE PAR_OPEN expression PAR_CLOSE BRACKET_OPEN statement BRACKET_CLOSE { While($3, $6) }
;

/*retour simple*/
return_statement: 
 RETURN expression SEMICOLON { Return $2 }
;

/* *******  FUN DEF  ******* */
typeD:
  | BoolT {}
  | IntT  {}
;

varDeclaration:
  | typeD VAR       { Vardecl(0, $2)}
;

fundeclaration:
  typeD VAR PAR_OPEN varDeclaration PAR_CLOSE { Fundecl( $1, $2, [$4] ) }

;
