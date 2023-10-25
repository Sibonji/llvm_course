run:
	g++ src/main.c src/app.c -o game -lSDL2
	./game

create_IR:
	clang src/app.c -o IR/app.ll -S -emit-llvm -O2