all: comp

# Compilation of Ocaml files
# Attention: order of object files important
comp: lang.cmo typing.cmo
	ocamlc -o comp $^

# Compilation of .ml files
lang.cmo: ../FlowGraph/lang.ml
	ocamlc -o lang.cmo -c $<

typing.cmo: typing.ml lang.cmo
	ocamlc -c $<

#### Generic rules

.PHONY: clean

clean:
	rm -f *.cmo
