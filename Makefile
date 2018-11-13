# Write this Makefile
myas: main.o check.o tans.o
	gcc -O myas main.o check.o trans.o -lm
main.o : main.c
	gcc -o -wall -c main.c
check.o : check.c
	gcc -o -wall -c check.c
trans.o : trans.c
	gcc -o -wall -c trans.c
clean:
	rm -f main.o check.o trans.o myas
