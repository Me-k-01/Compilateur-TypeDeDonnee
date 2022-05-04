all: compiler

compiler: lang.cmo parser.cmo lexer.cmo interf.cmo typing.cmo instrs.cmo gen.cmo\
	graph.cmo code2graph.cmo main.cmo
	ocamlc -o compiler $^



#### Main file

main.cmo: main.ml lang.cmo parser.cmo lexer.cmo interf.cmo typing.cmo gen.cmo instrs.cmo\
	graph.cmo code2graph.cmo
	ocamlc -c $<

#### Compilation of files

lang.cmo: ./Parsing/lang.ml
	ocamlc -o lang.cmo -c $<

interf.cmo: ./Parsing/interf.ml lexer.cmo parser.cmo
	ocamlc -o interf.cmo -c $<

# Parser files

parser.ml: ./Parsing/parser.mly lang.cmo
	ocamlyacc -v $<

parser.mli: ./Parsing/parser.mly lang.cmo
	ocamlyacc -v $<
	mv ./Parsing/parser.mli .

parser.cmo: ./Parsing/parser.ml parser.cmi lang.cmo
	ocamlc -o parser.cmo -c $<

# Lex files

lexer.ml: ./Parsing/lexer.mll lang.cmo
	ocamllex $<
	mv ./Parsing/lexer.ml .

lexer.cmo: ./lexer.ml parser.cmo
	ocamlc -o lexer.cmo -c $<


# Typing file

typing.cmo: ./Typing/typing.ml lang.cmo
	ocamlc -o typing.cmo -c $<

# Generation Assembler files

gen.cmo: ./GenerationAssembler/gen.ml lang.cmo instrs.cmo
	ocamlc -o gen.cmo -c $<

# Execution Assembler files

instrs.cmo: ./ExecutionAssembler/instrs.ml
	ocamlc -o instrs.cmo -c $<

# Graph files
graph.cmo: ./FlowGraph/graph.ml
	ocamlc -o graph.cmo -c $<

code2graph.cmo: ./FlowGraph/code2graph.ml instrs.cmo graph.cmo
	ocamlc -o code2graph.cmo -c $<

#### Generic rules

%.cmi: %.mli
	ocamlc -c $<


.PHONY: clean

clean: 
	rm -f *.cmo *.cmi parser.mli lexer.ml
