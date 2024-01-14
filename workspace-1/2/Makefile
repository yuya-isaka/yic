CFLAGS=-std=c11 -g -fno-common

yic: main.o
	$(CC) -o yic main.o $(LDFLAGS)

test: yic
	./test.sh

clean:
	rm -f yic *.o tmp* *~

.PHONY: test, clean
