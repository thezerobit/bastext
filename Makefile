# Makefile for bastext -------------------------------------------------------
OBJS=main.o inmode.o outmode.o tokens.o tokenize.o dtokeniz.o select.o t64.o

# All targets ----------------------------------------------------------------
all: bastext

# Main executable ------------------------------------------------------------
bastext: $(OBJS)
	gcc -o bastext $(OBJS)

tokens.o: tokens.c tokens.h
	gcc -c tokens.c

tokenize.o: tokenize.c tokenize.h tokens.h
	gcc -c tokenize.c

dtokeniz.o: dtokeniz.c tokenize.h tokens.h
	gcc -c dtokeniz.c

main.o: main.c inmode.h outmode.h tokenize.h
	gcc -c main.c

inmode.o: inmode.c tokenize.h version.h inmode.h select.h t64.h
	gcc -c inmode.c

outmode.o: outmode.c tokenize.h version.h outmode.h select.h t64.h
	gcc -c outmode.c

select.o: select.c select.h tokenize.h
	gcc -c select.c

t64.o: t64.c t64.h
	gcc -c t64.c

# Cleanup --------------------------------------------------------------------
clean:
	-rm core *.o *~
