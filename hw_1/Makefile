run:
	g++ src/main.cpp src/app.cpp -I lib/ -o game -lSDL2
	./game

create_IR:
	clang src/app.cpp -I lib/ -o IR/app.ll -S -emit-llvm -O2