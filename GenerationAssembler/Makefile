all: comp

# Compilation of Ocaml files
# Attention: order of object files important 
comp: lang.cmo instrs.cmo gen.cmo
	ocamlc -o comp $^

# Compilation of .ml files
lang.cmo: ../Parsing/lang.ml
	ocamlc -o lang.cmo -c $<

instrs.cmo: ../ExecutionAssembler/instrs.ml
	ocamlc -o instrs.cmo -c $<

gen.cmo:  gen.ml lang.cmo
	ocamlc -c $<

#### Generic rules

.PHONY: clean

clean: 
	rm -f *.cmo
