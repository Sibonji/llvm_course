build_pass:	
	clang++ Pass_cfg.cpp -c -fPIC -I`llvm-config --includedir` -o Pass.o
	clang++ Pass.o -fPIC -shared -o libPass.so

build_app:
	clang ../hw_1/src/app.c -c -o app.o -Xclang -load -Xclang ./libPass.so -O2 -flegacy-pass-manager
	clang ../hw_1/src/main.c log.c app.o -o app_IR -lSDL2

run_with_log:
	./app_IR > log.txt

run:
	./app_IR

make_graphs:
	python3 Analize.py log.txt