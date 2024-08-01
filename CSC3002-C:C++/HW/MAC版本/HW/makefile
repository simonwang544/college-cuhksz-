# A simple Makefile example for g++ compiler
# written by I-am-Future

all: lianxi

lianxi: lianxi.o
	g++ -std=c++17 lianxi.o -o lianxi

lianxi.o: lianxi.cpp
	g++ -c -std=c++17 lianxi.cpp -o lianxi.o

# below clean is only valid in Linux/MacOS.
clean:
	rm -f *.o lianxi
