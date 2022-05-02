type token =
  | BCONSTANT of (bool)
  | INTCONSTANT of (int)
  | VAR of (string)
  | BoolT
  | IntT
  | COMMA
  | BC_EG
  | BC_SUP_EG
  | BC_INF_EG
  | BC_SUP
  | BC_INF
  | BC_DIF
  | BA_ADD
  | BA_SUB
  | BA_MUL
  | BA_DIV
  | BA_MOD
  | PAR_OPEN
  | PAR_CLOSE
  | BRACKET_OPEN
  | BRACKET_CLOSE
  | IF
  | THEN
  | ELSE
  | FOR
  | WHILE
  | RETURN
  | LET
  | SEMICOLON
  | EG
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Lang
# 39 "parser.ml"
let yytransl_const = [|
  260 (* BoolT *);
  261 (* IntT *);
  262 (* COMMA *);
  263 (* BC_EG *);
  264 (* BC_SUP_EG *);
  265 (* BC_INF_EG *);
  266 (* BC_SUP *);
  267 (* BC_INF *);
  268 (* BC_DIF *);
  269 (* BA_ADD *);
  270 (* BA_SUB *);
  271 (* BA_MUL *);
  272 (* BA_DIV *);
  273 (* BA_MOD *);
  274 (* PAR_OPEN *);
  275 (* PAR_CLOSE *);
  276 (* BRACKET_OPEN *);
  277 (* BRACKET_CLOSE *);
  278 (* IF *);
  279 (* THEN *);
  280 (* ELSE *);
  281 (* FOR *);
  282 (* WHILE *);
  283 (* RETURN *);
  284 (* LET *);
  285 (* SEMICOLON *);
  286 (* EG *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* BCONSTANT *);
  258 (* INTCONSTANT *);
  259 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\004\000\005\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\008\000\006\000\006\000\006\000\006\000\006\000\009\000\009\000\
\009\000\009\000\009\000\015\000\015\000\015\000\013\000\010\000\
\014\000\014\000\012\000\011\000\016\000\016\000\017\000\018\000\
\018\000\019\000\002\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\009\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\004\000\002\000\
\005\000\011\000\007\000\003\000\001\000\001\000\002\000\001\000\
\003\000\005\000\004\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\037\000\038\000\044\000\001\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\023\000\024\000\025\000\026\000\027\000\000\000\000\000\000\000\
\000\000\000\000\000\000\002\000\003\000\004\000\000\000\000\000\
\018\000\019\000\020\000\000\000\021\000\022\000\043\000\000\000\
\039\000\000\000\042\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\036\000\041\000\031\000\000\000\000\000\
\005\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\008\000\009\000\010\000\000\000\028\000\029\000\
\030\000\033\000\000\000\000\000\000\000\000\000\000\000\000\000\
\035\000\000\000\000\000\000\000\000\000\000\000\000\000\017\000\
\034\000"

let yydgoto = "\002\000\
\005\000\006\000\033\000\034\000\035\000\036\000\037\000\038\000\
\040\000\017\000\018\000\019\000\020\000\021\000\082\000\022\000\
\023\000\024\000\008\000"

let yysindex = "\037\000\
\006\255\000\000\000\000\000\000\000\000\000\000\046\255\030\255\
\033\255\045\255\006\255\022\255\036\255\044\255\056\255\254\254\
\000\000\000\000\000\000\000\000\000\000\060\255\058\255\047\255\
\056\255\056\255\056\255\000\000\000\000\000\000\056\255\056\255\
\000\000\000\000\000\000\077\255\000\000\000\000\000\000\045\255\
\000\000\006\255\000\000\088\255\190\255\203\255\216\255\176\255\
\056\255\056\255\056\255\056\255\056\255\056\255\056\255\056\255\
\056\255\056\255\056\255\000\000\000\000\000\000\050\255\055\255\
\000\000\056\255\229\255\229\255\229\255\229\255\229\255\229\255\
\001\255\001\255\000\000\000\000\000\000\045\255\000\000\000\000\
\000\000\000\000\045\255\146\255\018\255\020\255\041\255\057\255\
\000\000\059\255\062\255\056\255\045\255\161\255\034\255\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\061\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\094\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\242\254\249\254\119\255\228\255\231\255\234\255\
\100\255\123\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\233\255\000\000\000\000\
\246\255\000\000\053\000\055\000\059\000\000\000\000\000\122\000\
\000\000\082\000\000\000"

let yytablesize = 263
let yytable = "\016\000\
\012\000\044\000\045\000\046\000\011\000\011\000\011\000\047\000\
\048\000\003\000\004\000\012\000\012\000\012\000\011\000\057\000\
\058\000\059\000\039\000\013\000\012\000\012\000\012\000\014\000\
\015\000\067\000\068\000\069\000\070\000\071\000\072\000\073\000\
\074\000\075\000\076\000\077\000\012\000\001\000\088\000\013\000\
\089\000\013\000\084\000\014\000\015\000\014\000\015\000\012\000\
\009\000\010\000\011\000\025\000\012\000\026\000\097\000\013\000\
\028\000\029\000\030\000\014\000\015\000\027\000\041\000\042\000\
\090\000\043\000\013\000\085\000\094\000\078\000\014\000\015\000\
\086\000\031\000\083\000\014\000\015\000\032\000\092\000\040\000\
\091\000\093\000\095\000\049\000\050\000\051\000\052\000\053\000\
\054\000\055\000\056\000\057\000\058\000\059\000\049\000\050\000\
\051\000\052\000\053\000\054\000\055\000\056\000\057\000\058\000\
\059\000\060\000\006\000\006\000\006\000\006\000\006\000\006\000\
\006\000\006\000\032\000\079\000\062\000\080\000\006\000\006\000\
\006\000\081\000\007\000\061\000\000\000\000\000\000\000\000\000\
\006\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\013\000\013\000\013\000\000\000\007\000\007\000\007\000\
\000\000\000\000\000\000\013\000\000\000\000\000\000\000\007\000\
\049\000\050\000\051\000\052\000\053\000\054\000\055\000\056\000\
\057\000\058\000\059\000\000\000\000\000\000\000\087\000\049\000\
\050\000\051\000\052\000\053\000\054\000\055\000\056\000\057\000\
\058\000\059\000\000\000\000\000\000\000\096\000\049\000\050\000\
\051\000\052\000\053\000\054\000\055\000\056\000\057\000\058\000\
\059\000\000\000\000\000\066\000\049\000\050\000\051\000\052\000\
\053\000\054\000\055\000\056\000\057\000\058\000\059\000\000\000\
\063\000\049\000\050\000\051\000\052\000\053\000\054\000\055\000\
\056\000\057\000\058\000\059\000\000\000\064\000\049\000\050\000\
\051\000\052\000\053\000\054\000\055\000\056\000\057\000\058\000\
\059\000\000\000\065\000\049\000\050\000\051\000\052\000\053\000\
\054\000\055\000\056\000\057\000\058\000\059\000\014\000\014\000\
\014\000\015\000\015\000\015\000\016\000\016\000\016\000\000\000\
\014\000\000\000\000\000\015\000\000\000\000\000\016\000"

let yycheck = "\010\000\
\003\001\025\000\026\000\027\000\019\001\020\001\021\001\031\000\
\032\000\004\001\005\001\019\001\020\001\021\001\029\001\015\001\
\016\001\017\001\021\001\022\001\003\001\029\001\003\001\026\001\
\027\001\049\000\050\000\051\000\052\000\053\000\054\000\055\000\
\056\000\057\000\058\000\059\000\003\001\001\000\021\001\022\001\
\021\001\022\001\066\000\026\001\027\001\026\001\027\001\003\001\
\003\001\020\001\018\001\030\001\003\001\018\001\021\001\022\001\
\001\001\002\001\003\001\026\001\027\001\018\001\003\001\006\001\
\024\001\019\001\022\001\078\000\092\000\020\001\026\001\027\001\
\083\000\018\001\020\001\026\001\027\001\022\001\020\001\019\001\
\024\001\020\001\093\000\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\029\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\021\001\063\000\029\001\063\000\019\001\020\001\
\021\001\063\000\001\000\042\000\255\255\255\255\255\255\255\255\
\029\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\019\001\020\001\021\001\255\255\019\001\020\001\021\001\
\255\255\255\255\255\255\029\001\255\255\255\255\255\255\029\001\
\007\001\008\001\009\001\010\001\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\255\255\255\255\255\255\021\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\255\255\255\255\255\255\021\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\255\255\255\255\020\001\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\255\255\
\019\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\016\001\017\001\255\255\019\001\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\255\255\019\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\019\001\020\001\
\021\001\019\001\020\001\021\001\019\001\020\001\021\001\255\255\
\029\001\255\255\255\255\029\001\255\255\255\255\029\001"

let yynames_const = "\
  BoolT\000\
  IntT\000\
  COMMA\000\
  BC_EG\000\
  BC_SUP_EG\000\
  BC_INF_EG\000\
  BC_SUP\000\
  BC_INF\000\
  BC_DIF\000\
  BA_ADD\000\
  BA_SUB\000\
  BA_MUL\000\
  BA_DIV\000\
  BA_MOD\000\
  PAR_OPEN\000\
  PAR_CLOSE\000\
  BRACKET_OPEN\000\
  BRACKET_CLOSE\000\
  IF\000\
  THEN\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  RETURN\000\
  LET\000\
  SEMICOLON\000\
  EG\000\
  EOF\000\
  "

let yynames_block = "\
  BCONSTANT\000\
  INTCONSTANT\000\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'funDefinition) in
    Obj.repr(
# 72 "parser.mly"
                     ( _1 )
# 263 "parser.ml"
               : int Lang.fundefn))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 79 "parser.mly"
               ( Const(0, BoolV _1) )
# 270 "parser.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 80 "parser.mly"
               ( Const(0, IntV _1) )
# 277 "parser.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "parser.mly"
     ( VarE(0, _1) )
# 284 "parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 90 "parser.mly"
                                 ( (_2) )
# 291 "parser.ml"
               : 'parenthesage))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 95 "parser.mly"
                               ( BinOp(0, BArith BAadd, _1 , _3 ) )
# 299 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 96 "parser.mly"
                               ( BinOp(0, BArith BAsub, _1 , _3 ) )
# 307 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 97 "parser.mly"
                               ( BinOp(0, BArith BAmul, _1 , _3 ) )
# 315 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 98 "parser.mly"
                               ( BinOp(0, BArith BAdiv, _1 , _3 ) )
# 323 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 99 "parser.mly"
                               ( BinOp(0, BArith BAmod, _1 , _3 ) )
# 331 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 102 "parser.mly"
                                  ( BinOp(0, BCompar BCeq, _1 , _3 ) )
# 339 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 103 "parser.mly"
                                  ( BinOp(0, BCompar BCge, _1 , _3 ) )
# 347 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 104 "parser.mly"
                                  ( BinOp(0, BCompar BCgt, _1 , _3 ) )
# 355 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 105 "parser.mly"
                                  ( BinOp(0, BCompar BCle, _1 , _3 ) )
# 363 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 106 "parser.mly"
                                  ( BinOp(0, BCompar BClt, _1 , _3 ) )
# 371 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 107 "parser.mly"
                                  ( BinOp(0, BCompar BCne, _1 , _3 ) )
# 379 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : 'expression) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'expression) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 111 "parser.mly"
                                                                                                ( IfThenElse(0, _2, _4, _8 ) )
# 388 "parser.ml"
               : 'ifthenelse))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'constant) in
    Obj.repr(
# 116 "parser.mly"
                   ( _1 )
# 395 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'variable) in
    Obj.repr(
# 117 "parser.mly"
                   ( _1 )
# 402 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'parenthesage) in
    Obj.repr(
# 118 "parser.mly"
                   ( _1 )
# 409 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'binary_operation) in
    Obj.repr(
# 119 "parser.mly"
                   ( _1 )
# 416 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ifthenelse) in
    Obj.repr(
# 120 "parser.mly"
                   ( _1 )
# 423 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'seq) in
    Obj.repr(
# 127 "parser.mly"
                      ( _1 )
# 430 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'return_statement) in
    Obj.repr(
# 128 "parser.mly"
                      ( _1 )
# 437 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'while_statement) in
    Obj.repr(
# 129 "parser.mly"
                      ( _1 )
# 444 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'assign) in
    Obj.repr(
# 130 "parser.mly"
                      ( _1 )
# 451 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'selection_statement) in
    Obj.repr(
# 131 "parser.mly"
                      ( _1 )
# 458 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'return_statement) in
    Obj.repr(
# 135 "parser.mly"
                      ( _1 )
# 465 "parser.ml"
               : 'stmt2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'while_statement) in
    Obj.repr(
# 136 "parser.mly"
                      ( _1 )
# 472 "parser.ml"
               : 'stmt2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'assign) in
    Obj.repr(
# 137 "parser.mly"
                      ( _1 )
# 479 "parser.ml"
               : 'stmt2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 142 "parser.mly"
                             ( Assign (0, _1, _3) )
# 487 "parser.ml"
               : 'assign))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 146 "parser.mly"
            ( Seq( _1, _2 ) )
# 495 "parser.ml"
               : 'seq))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt2) in
    Obj.repr(
# 150 "parser.mly"
                                                     ( Cond( _3, _5, Skip))
# 503 "parser.ml"
               : 'selection_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 8 : 'expression) in
    let _6 = (Parsing.peek_val __caml_parser_env 5 : 'stmt) in
    let _10 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 151 "parser.mly"
                                                                                                         ( Cond( _3, _6, _10 ) )
# 512 "parser.ml"
               : 'selection_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expression) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 155 "parser.mly"
                                                                      ( While(_3, _6) )
# 520 "parser.ml"
               : 'while_statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 160 "parser.mly"
                             ( Return _2 )
# 527 "parser.ml"
               : 'return_statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 166 "parser.mly"
          ( BoolT )
# 533 "parser.ml"
               : 'typeD))
; (fun __caml_parser_env ->
    Obj.repr(
# 167 "parser.mly"
          ( IntT )
# 539 "parser.ml"
               : 'typeD))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typeD) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 171 "parser.mly"
              ( Vardecl(_1, _2) )
# 547 "parser.ml"
               : 'varDeclaration))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'varDeclaration) in
    Obj.repr(
# 175 "parser.mly"
                    ( [_1] )
# 554 "parser.ml"
               : 'varListe))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'varDeclaration) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'varListe) in
    Obj.repr(
# 176 "parser.mly"
                                  ( [_1] @ _3 )
# 562 "parser.ml"
               : 'varListe))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'typeD) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'varListe) in
    Obj.repr(
# 180 "parser.mly"
                                        ( Fundecl( _1, _2, _4 ) )
# 571 "parser.ml"
               : 'funDeclaration))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'funDeclaration) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 184 "parser.mly"
                                                 ( Fundefn(_1, [], _3) )
# 579 "parser.ml"
               : 'funDefinition))
(* Entry start *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let start (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : int Lang.fundefn)
