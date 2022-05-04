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

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> int Lang.fundefn
