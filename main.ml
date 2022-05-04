(*  
  this file is the main file of the compiler
  to use the compiler, run the command :

  make && ./compiler "./Examples/even.c"
*)

let parser = try Interf.parse Sys.argv.(1) with
  | Invalid_argument _ -> failwith "Please enter a file path as argument."
;;

let typing = Typing.tpFunDefn parser;;
let generation = Gen.gen_stmt typing;;

let rec get_arguments args =
  match args with
  | e::l -> int_of_string e :: get_arguments l
  | _ -> []
;;
let arguments = get_arguments (Array.to_list(Array.sub (Sys.argv) 2 (- 2 + Array.length Sys.argv)));;

let execution = Instrs.run_code generation arguments;;



let print_array array = 
  let rec print_array array =
    match array with
    | [Lang.IntV(n)] -> print_int(n); print_string("|]")
    | [Lang.BoolV(b)] -> if b then print_string("true|]") else print_string("false|]")

    | Lang.IntV(n)::array -> print_int(n); print_string(", "); print_array array
    | Lang.BoolV(b)::array ->
      if b then
        begin
          print_string("true, ");
          print_array array
        end
      else
        begin
          print_string("false, ");
          print_array array
        end
    | _ -> ()
  in
  print_string("[|");
  print_array array
;;


let variables, returned_value = execution;;

print_string("Variables : ");
print_array(Array.to_list(variables));;
print_string("\n");

print_string("Result : ");
print_int(returned_value);
print_string("\n");