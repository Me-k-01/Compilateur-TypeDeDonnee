all: comp

# Compilation of Ocaml files
# Attention: order of object files important
comp: lang.cmo instrs.cmo graph.cmo code2graph.cmo
	ocamlc -o comp $^

# Compilation of .ml files
lang.cmo: lang.ml
	ocamlc -c $<

instrs.cmo: instrs.ml lang.cmo
	ocamlc -c $<


graph.cmo: graph.ml
	ocamlc -c $<

code2graph.cmo: code2graph.ml instrs.cmo graph.cmo
	ocamlc -c $<



#### Generic rules

%.cmi: %.mli
	ocamlc -c $<


.PHONY: clean

clean:
	rm -f lexer.ml parser.ml *.mli *.cmi *.cmo
