all: compiler

compiler: lang.cmo parser.cmo lexer.cmo interf.cmo typing.cmo instrs.cmo gen.cmo main.cmo
	ocamlc -o compiler $^

#### Main file

main.cmo: main.ml lang.cmo parser.cmo lexer.cmo interf.cmo typing.cmo gen.cmo instrs.cmo
	ocamlc -c $<

#### Compilation of files

lang.cmo: ./SimpleParser/lang.ml
	ocamlc -o lang.cmo -c $<

interf.cmo: ./SimpleParser/interf.ml lexer.cmo parser.cmo
	ocamlc -o interf.cmo -c $<

# Parser files

parser.ml: ./SimpleParser/parser.mly lang.cmo
	ocamlyacc -v $<

parser.mli: ./SimpleParser/parser.mly lang.cmo
	ocamlyacc -v $<
	mv ./SimpleParser/parser.mli .

parser.cmo: ./SimpleParser/parser.ml parser.cmi lang.cmo
	ocamlc -o parser.cmo -c $<

# Lex files

lexer.ml: ./SimpleParser/lexer.mll lang.cmo
	ocamllex $<
	mv ./SimpleParser/lexer.ml .

lexer.cmo: ./lexer.ml parser.cmo
	ocamlc -o lexer.cmo -c $<


# Typing file

typing.cmo: ./Typage/typing.ml lang.cmo
	ocamlc -o typing.cmo -c $<

# Generation Assembler files

gen.cmo: ./GenerationAssembler/gen.ml lang.cmo instrs.cmo
	ocamlc -o gen.cmo -c $<

# Execution Assembler files

instrs.cmo: ./ExecutionAssembler/instrs.ml
	ocamlc -o instrs.cmo -c $<

#### Generic rules

%.cmi: %.mli
	ocamlc -c $<


.PHONY: clean

clean: 
	rm -f *.cmo *.cmi parser.mli lexer.ml
