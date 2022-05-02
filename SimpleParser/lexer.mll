{
  open Lexing
  open Parser
  open Lang
  exception Lexerror

  let pos lexbuf = (lexeme_start lexbuf, lexeme_end lexbuf)

  let advance_line_pos pos =
    { pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum; }

  let advance_line lexbuf =
    lexbuf.lex_curr_p <- advance_line_pos lexbuf.lex_curr_p

  let level = ref 0

}

let alph =           ['a'-'z''A'-'Z']*
let num  =           ['0'-'9'] 
let decimal	=	'0'|(['1'-'9']['0'-'9']*)
(*let comment = '/' '*' (alph|num)?* '*' '/'*)


rule token = parse
 [' ' '\t']
    { token lexbuf }    (* white space: recursive call of lexer *)
|'\n'
    {advance_line lexbuf; token lexbuf }    (* white space: recursive call of lexer *)
| "/*"
    {  level:=1; comment lexbuf }    (* comment --> ignore *)
| "//" { commentLigne lexbuf}
    
    
(*Retour des valeurs*)
| decimal  as i { INTCONSTANT (int_of_string i) }
| "True"        { BCONSTANT true }
| "False"       { BCONSTANT false }

(* Declaration de type *)
| "int"         { IntT }
| "bool"        {BoolT }

(* Virgule *)
| ","           {COMMA}

(* binary arithmetic operators: +, -, *, /, mod *)
| "+"           {BA_ADD}
| "-"           {BA_SUB}
| "*"           {BA_MUL}
| "/"           {BA_DIV}
| "mod"         {BA_MOD}

(* binary comparison operators: ==, >=, >, <=, <, != *)
| "=="           {BC_EG}
| ">="          {BC_SUP_EG}
| "<="          {BC_INF_EG}
| ">"           {BC_SUP}
| "<"           {BC_INF}
| "!="          {BC_DIF}

(*parentheses*)
| "("           {PAR_OPEN}
| ")"           {PAR_CLOSE}
| "{"           {BRACKET_OPEN}
| "}"           {BRACKET_CLOSE}


(* Structure de controle *)
| "if"          {IF}
| "then"        {THEN}
| "else"        {ELSE}
| "for"         {FOR}
| "while"       {WHILE}
| "return"      {RETURN}
| "let"         {LET}

(*fin d'expression*)
| ';'           { SEMICOLON }

(* Expression de variable *)
| alph as a     { VAR a }
| "="           { EG }

(*fin de fichier*)
| eof           {EOF}

| _  {Printf.printf "ERROR: unrecogized symbol '%s'\n" (Lexing.lexeme lexbuf);
      raise Lexerror }

and
    ruleTail acc = parse
| eof { acc }
| _* as str { ruleTail (acc ^ str) lexbuf }

and (*gestion des commentaires*)
    comment = parse
| "*/" { decr level; if !level>0 then comment lexbuf else token lexbuf}
| "/*" { incr level; comment lexbuf }
| _    { comment lexbuf }
|eof   { failwith " '*/' is missing. Never ending comment"}

and
      commentLigne = parse
| "\n" { token lexbuf }
| _    { commentLigne lexbuf }
