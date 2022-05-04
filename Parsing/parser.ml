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
# 2 "Parsing/parser.mly"
open Lang
# 39 "Parsing/parser.ml"
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
\010\000\014\000\014\000\012\000\011\000\016\000\016\000\017\000\
\018\000\018\000\019\000\002\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\009\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\004\000\003\000\
\002\000\005\000\011\000\007\000\003\000\001\000\001\000\002\000\
\001\000\003\000\005\000\004\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\038\000\039\000\045\000\001\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\023\000\024\000\025\000\026\000\027\000\000\000\000\000\000\000\
\000\000\000\000\000\000\002\000\003\000\004\000\000\000\000\000\
\018\000\019\000\020\000\000\000\021\000\022\000\044\000\000\000\
\040\000\000\000\043\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\037\000\000\000\042\000\031\000\000\000\
\000\000\005\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\008\000\009\000\010\000\000\000\028\000\
\029\000\030\000\034\000\000\000\000\000\000\000\000\000\000\000\
\000\000\036\000\000\000\000\000\000\000\000\000\000\000\000\000\
\017\000\035\000"

let yydgoto = "\002\000\
\005\000\006\000\033\000\034\000\035\000\036\000\037\000\038\000\
\040\000\017\000\018\000\019\000\020\000\021\000\083\000\022\000\
\023\000\024\000\008\000"

let yysindex = "\001\000\
\006\255\000\000\000\000\000\000\000\000\000\000\009\255\251\254\
\255\254\041\255\006\255\242\254\005\255\010\255\054\255\254\254\
\000\000\000\000\000\000\000\000\000\000\015\255\037\255\027\255\
\054\255\054\255\054\255\000\000\000\000\000\000\054\255\054\255\
\000\000\000\000\000\000\078\255\000\000\000\000\000\000\041\255\
\000\000\006\255\000\000\089\255\191\255\204\255\217\255\177\255\
\054\255\054\255\054\255\054\255\054\255\054\255\054\255\054\255\
\054\255\054\255\054\255\000\000\041\255\000\000\000\000\051\255\
\025\255\000\000\054\255\230\255\230\255\230\255\230\255\230\255\
\230\255\245\254\245\254\000\000\000\000\000\000\041\255\000\000\
\000\000\000\000\000\000\041\255\147\255\000\255\026\255\034\255\
\035\255\000\000\030\255\042\255\054\255\041\255\162\255\039\255\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\045\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\049\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\052\255\000\000\000\000\000\000\
\000\000\000\000\000\000\120\255\229\255\232\255\235\255\247\255\
\250\255\101\255\124\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\238\255\000\000\000\000\
\246\255\000\000\015\000\016\000\017\000\000\000\000\000\081\000\
\000\000\041\000\000\000"

let yytablesize = 279
let yytable = "\016\000\
\012\000\001\000\012\000\057\000\058\000\059\000\044\000\045\000\
\046\000\003\000\004\000\009\000\047\000\048\000\010\000\025\000\
\011\000\041\000\039\000\013\000\089\000\013\000\026\000\014\000\
\015\000\014\000\015\000\027\000\012\000\061\000\068\000\069\000\
\070\000\071\000\072\000\073\000\074\000\075\000\076\000\077\000\
\078\000\012\000\042\000\012\000\084\000\043\000\090\000\013\000\
\085\000\093\000\061\000\014\000\015\000\012\000\028\000\029\000\
\030\000\091\000\092\000\098\000\013\000\094\000\013\000\041\000\
\014\000\015\000\014\000\015\000\086\000\033\000\079\000\031\000\
\032\000\087\000\095\000\032\000\014\000\015\000\080\000\081\000\
\082\000\007\000\062\000\096\000\049\000\050\000\051\000\052\000\
\053\000\054\000\055\000\056\000\057\000\058\000\059\000\049\000\
\050\000\051\000\052\000\053\000\054\000\055\000\056\000\057\000\
\058\000\059\000\060\000\006\000\006\000\006\000\006\000\006\000\
\006\000\006\000\006\000\000\000\000\000\063\000\000\000\006\000\
\006\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\006\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\011\000\011\000\011\000\000\000\007\000\007\000\
\007\000\000\000\000\000\000\000\011\000\000\000\000\000\000\000\
\007\000\049\000\050\000\051\000\052\000\053\000\054\000\055\000\
\056\000\057\000\058\000\059\000\000\000\000\000\000\000\088\000\
\049\000\050\000\051\000\052\000\053\000\054\000\055\000\056\000\
\057\000\058\000\059\000\000\000\000\000\000\000\097\000\049\000\
\050\000\051\000\052\000\053\000\054\000\055\000\056\000\057\000\
\058\000\059\000\000\000\000\000\067\000\049\000\050\000\051\000\
\052\000\053\000\054\000\055\000\056\000\057\000\058\000\059\000\
\000\000\064\000\049\000\050\000\051\000\052\000\053\000\054\000\
\055\000\056\000\057\000\058\000\059\000\000\000\065\000\049\000\
\050\000\051\000\052\000\053\000\054\000\055\000\056\000\057\000\
\058\000\059\000\000\000\066\000\049\000\050\000\051\000\052\000\
\053\000\054\000\055\000\056\000\057\000\058\000\059\000\012\000\
\012\000\012\000\013\000\013\000\013\000\014\000\014\000\014\000\
\000\000\012\000\000\000\000\000\013\000\000\000\000\000\014\000\
\000\000\015\000\015\000\015\000\016\000\016\000\016\000\000\000\
\000\000\000\000\000\000\015\000\000\000\000\000\016\000"

let yycheck = "\010\000\
\003\001\001\000\003\001\015\001\016\001\017\001\025\000\026\000\
\027\000\004\001\005\001\003\001\031\000\032\000\020\001\030\001\
\018\001\003\001\021\001\022\001\021\001\022\001\018\001\026\001\
\027\001\026\001\027\001\018\001\003\001\040\000\049\000\050\000\
\051\000\052\000\053\000\054\000\055\000\056\000\057\000\058\000\
\059\000\003\001\006\001\003\001\020\001\019\001\021\001\022\001\
\067\000\020\001\061\000\026\001\027\001\003\001\001\001\002\001\
\003\001\024\001\024\001\021\001\022\001\020\001\022\001\019\001\
\026\001\027\001\026\001\027\001\079\000\021\001\020\001\018\001\
\021\001\084\000\093\000\022\001\026\001\027\001\064\000\064\000\
\064\000\001\000\042\000\094\000\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\029\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\014\001\255\255\255\255\029\001\255\255\019\001\
\020\001\021\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\029\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\019\001\020\001\021\001\255\255\019\001\020\001\
\021\001\255\255\255\255\255\255\029\001\255\255\255\255\255\255\
\029\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\016\001\017\001\255\255\255\255\255\255\021\001\
\007\001\008\001\009\001\010\001\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\255\255\255\255\255\255\021\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\255\255\255\255\020\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\016\001\017\001\
\255\255\019\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\255\255\019\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\255\255\019\001\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\019\001\
\020\001\021\001\019\001\020\001\021\001\019\001\020\001\021\001\
\255\255\029\001\255\255\255\255\029\001\255\255\255\255\029\001\
\255\255\019\001\020\001\021\001\019\001\020\001\021\001\255\255\
\255\255\255\255\255\255\029\001\255\255\255\255\029\001"

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
# 72 "Parsing/parser.mly"
                     ( _1 )
# 267 "Parsing/parser.ml"
               : int Lang.fundefn))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 79 "Parsing/parser.mly"
               ( Const(0, BoolV _1) )
# 274 "Parsing/parser.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 80 "Parsing/parser.mly"
               ( Const(0, IntV _1) )
# 281 "Parsing/parser.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "Parsing/parser.mly"
     ( VarE(0, _1) )
# 288 "Parsing/parser.ml"
               : 'variable))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 90 "Parsing/parser.mly"
                                 ( (_2) )
# 295 "Parsing/parser.ml"
               : 'parenthesage))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 95 "Parsing/parser.mly"
                               ( BinOp(0, BArith BAadd, _1 , _3 ) )
# 303 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 96 "Parsing/parser.mly"
                               ( BinOp(0, BArith BAsub, _1 , _3 ) )
# 311 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 97 "Parsing/parser.mly"
                               ( BinOp(0, BArith BAmul, _1 , _3 ) )
# 319 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 98 "Parsing/parser.mly"
                               ( BinOp(0, BArith BAdiv, _1 , _3 ) )
# 327 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 99 "Parsing/parser.mly"
                               ( BinOp(0, BArith BAmod, _1 , _3 ) )
# 335 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 102 "Parsing/parser.mly"
                                  ( BinOp(0, BCompar BCeq, _1 , _3 ) )
# 343 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 103 "Parsing/parser.mly"
                                  ( BinOp(0, BCompar BCge, _1 , _3 ) )
# 351 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 104 "Parsing/parser.mly"
                                  ( BinOp(0, BCompar BCgt, _1 , _3 ) )
# 359 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 105 "Parsing/parser.mly"
                                  ( BinOp(0, BCompar BCle, _1 , _3 ) )
# 367 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 106 "Parsing/parser.mly"
                                  ( BinOp(0, BCompar BClt, _1 , _3 ) )
# 375 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 107 "Parsing/parser.mly"
                                  ( BinOp(0, BCompar BCne, _1 , _3 ) )
# 383 "Parsing/parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : 'expression) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'expression) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 111 "Parsing/parser.mly"
                                                                                                ( IfThenElse(0, _2, _4, _8 ) )
# 392 "Parsing/parser.ml"
               : 'ifthenelse))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'constant) in
    Obj.repr(
# 116 "Parsing/parser.mly"
                   ( _1 )
# 399 "Parsing/parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'variable) in
    Obj.repr(
# 117 "Parsing/parser.mly"
                   ( _1 )
# 406 "Parsing/parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'parenthesage) in
    Obj.repr(
# 118 "Parsing/parser.mly"
                   ( _1 )
# 413 "Parsing/parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'binary_operation) in
    Obj.repr(
# 119 "Parsing/parser.mly"
                   ( _1 )
# 420 "Parsing/parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ifthenelse) in
    Obj.repr(
# 120 "Parsing/parser.mly"
                   ( _1 )
# 427 "Parsing/parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'seq) in
    Obj.repr(
# 127 "Parsing/parser.mly"
                      ( _1 )
# 434 "Parsing/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'return_statement) in
    Obj.repr(
# 128 "Parsing/parser.mly"
                      ( _1 )
# 441 "Parsing/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'while_statement) in
    Obj.repr(
# 129 "Parsing/parser.mly"
                      ( _1 )
# 448 "Parsing/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'assign) in
    Obj.repr(
# 130 "Parsing/parser.mly"
                      ( _1 )
# 455 "Parsing/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'selection_statement) in
    Obj.repr(
# 131 "Parsing/parser.mly"
                      ( _1 )
# 462 "Parsing/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'return_statement) in
    Obj.repr(
# 135 "Parsing/parser.mly"
                      ( _1 )
# 469 "Parsing/parser.ml"
               : 'stmt2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'while_statement) in
    Obj.repr(
# 136 "Parsing/parser.mly"
                      ( _1 )
# 476 "Parsing/parser.ml"
               : 'stmt2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'assign) in
    Obj.repr(
# 137 "Parsing/parser.mly"
                      ( _1 )
# 483 "Parsing/parser.ml"
               : 'stmt2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 142 "Parsing/parser.mly"
                             ( Assign (0, _1, _3) )
# 491 "Parsing/parser.ml"
               : 'assign))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 146 "Parsing/parser.mly"
                  (Seq( Seq( _1, _2), _3) )
# 500 "Parsing/parser.ml"
               : 'seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 147 "Parsing/parser.mly"
             ( Seq( _1, _2 ) )
# 508 "Parsing/parser.ml"
               : 'seq))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt2) in
    Obj.repr(
# 151 "Parsing/parser.mly"
                                                     ( Cond( _3, _5, Skip))
# 516 "Parsing/parser.ml"
               : 'selection_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 8 : 'expression) in
    let _6 = (Parsing.peek_val __caml_parser_env 5 : 'stmt) in
    let _10 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 152 "Parsing/parser.mly"
                                                                                                         ( Cond( _3, _6, _10 ) )
# 525 "Parsing/parser.ml"
               : 'selection_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expression) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 156 "Parsing/parser.mly"
                                                                      ( While(_3, _6) )
# 533 "Parsing/parser.ml"
               : 'while_statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 161 "Parsing/parser.mly"
                             ( Return _2 )
# 540 "Parsing/parser.ml"
               : 'return_statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 167 "Parsing/parser.mly"
          ( BoolT )
# 546 "Parsing/parser.ml"
               : 'typeD))
; (fun __caml_parser_env ->
    Obj.repr(
# 168 "Parsing/parser.mly"
          ( IntT )
# 552 "Parsing/parser.ml"
               : 'typeD))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typeD) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 172 "Parsing/parser.mly"
              ( Vardecl(_1, _2) )
# 560 "Parsing/parser.ml"
               : 'varDeclaration))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'varDeclaration) in
    Obj.repr(
# 176 "Parsing/parser.mly"
                    ( [_1] )
# 567 "Parsing/parser.ml"
               : 'varListe))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'varDeclaration) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'varListe) in
    Obj.repr(
# 177 "Parsing/parser.mly"
                                  ( [_1] @ _3 )
# 575 "Parsing/parser.ml"
               : 'varListe))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'typeD) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'varListe) in
    Obj.repr(
# 181 "Parsing/parser.mly"
                                        ( Fundecl( _1, _2, _4 ) )
# 584 "Parsing/parser.ml"
               : 'funDeclaration))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'funDeclaration) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 185 "Parsing/parser.mly"
                                                 ( Fundefn(_1, [], _3) )
# 592 "Parsing/parser.ml"
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
