# README 

Projet de fin de licence Informatique INUC 2022, diriges par Martin Strecker.
___
### Compilateur


Ce projet presente un compilateur reconnaissant un langage similaire au C.  
Il est operationnel mais pas optimal.

___
### Developpeurs

Trois etudiants ont travaille sur ce projet.

Auberval Florian, https://github.com/Me-k-01  
Cavailles Theo, https://github.com/igneefleur  
Duzes Florian, https://github.com/FloDarPie  
___
### Guide d'utilisation
Pour compiler le projet, il suffit de lancer la commande suivante dans la racine du projet :
```
make
```
Une fois compilé, le fichier `compiler` devrait apparaitre dans la racine du projet, pour l'executer, il faut y ajouter en arguments le chemin du fichier à compiler et la valeur de chaque argument du fichier (la valeur ne peut être qu'un entier).
Voici un exemple, fait dans la racine du projet :
```
./compiler ./Examples/even.c 5
```

Les 5 parties du projet sont situées dans un répertoire différent, et chaque répertoire contenant une partie possède un `Makefile`, faire un `make` permettra de lancer un fichier compilé testant un exemple (sans affichage), mais aussi de pouvoir éxecuter un fichier de test.
Voici un exemple pour la partie d'execution de l'assembleur, fait dans la racine du projet :
```
cd ./ExecutionAssembler
make
ocaml < test.ml
```
___
### Source d'aide

Documentation et Compilateur Officiel OcamL :   
- [Parser](https://github.com/ocaml/ocaml/blob/trunk/lex/parser.mly)  
- [Lexer](https://github.com/ocaml/ocaml/blob/trunk/lex/lexer.mll)  

Supplement de cours - Laboratoire de Recherche en Informatique :   
[Cours de Lri](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjo_JPYpsH3AhUDCewKHda7C2EQFnoECAkQAQ&url=https%3A%2F%2Fwww.lri.fr%2F~conchon%2FOMED%2F3%2Focamllex.pdf&usg=AOvVaw2F3Rk2C4Zm999iNqFC1rU5)
