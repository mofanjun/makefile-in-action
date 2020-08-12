all: math.o
	ar rc libmath.a $^ 
math:
	$(CC) -c -Wall math.c -o math.o

clean:
	rm -f *.o *.a