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

}

let alph =           ['a'-'z''A'-'Z']*
let num  =           ['0'-'9'] 
let decimal	=	'0'|(['1'-'9']['0'-'9']*)
let comment = '/' '*' (alph|num)* '*' '/'
  
rule token = parse
 [' ' '\t']
    { token lexbuf }    (* white space: recursive call of lexer *)
|'\n'
    {advance_line lexbuf; token lexbuf }    (* white space: recursive call of lexer *)
| comment
    { token lexbuf }    (* comment --> ignore *)
    
    
(*Retour des valeurs*)
| decimal  as i { INTCONSTANT (int_of_string i) }
| "True"        { BCONSTANT true }
| "False"       { BCONSTANT false }

(* Declaration de type *)
| "int"         {TYPE}
| "bool"        {TYPE}

(* binary arithmetic operators: +, -, *, /, mod *)
| "+"           {BA_ADD}
| "-"           {BA_SUB}
| "*"           {BA_MUL}
| "/"           {BA_DIV}
| "mod"         {BA_MOD}

(* binary comparison operators: =, >=, >, <=, <, != *)
| "="           {BC_EG}
| ">="          {BC_SUP_EG}
| "<="          {BC_INF_EG}
| ">"           {BC_SUP}
| "<"           {BC_INF}
| "!="          {BC_DIF}

(*commentaire*)
| "/*"          {COMM_OPEN}
| "*/"          {COMM_CLOSE}
| "//"          {COMM}

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
| ';'          { SEMICOLON }

(* Expression de variable *)
| alph as a     { VAR a }

(*fin de fichier*)
| eof          {EOF}

| _  {Printf.printf "ERROR: unrecogized symbol '%s'\n" (Lexing.lexeme lexbuf);
      raise Lexerror }

and
    ruleTail acc = parse
| eof { acc }
| _* as str { ruleTail (acc ^ str) lexbuf }
