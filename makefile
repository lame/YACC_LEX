calc: lex.yy.c yy.tab.c yy.tab.h
	gcc lex.yy.c y.tab.c -lfl -o calc

lex.yy.c: calc.l
	lex -i calc.l

yy.tab.c yy.tab.h: calc.y
	yacc -d calc.y

.PHONY: clear
clear:
	rm -f calc
	rm -f y.output
	rm -f lex.yy.c
	rm -f y.tab.c
	rm -f y.tab.h

