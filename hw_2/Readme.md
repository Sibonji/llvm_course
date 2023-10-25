# Build Pass.o
```
make build_pass
```

# Build app with linked Pass

```
make build_app
```

# Run app

With traces go to log.txt:
```
make run_with_log
```

With traces for to standard output:
```
make run
```

Make sure to fastly stop programm running or log.txt will become too big. Also you could change resolution of app window in main.h:

```
int array_base_len = 100;
int arr_len = 102; // array_base_len + 2
```

I don't recommend using values more that 200-300 (log.txt will be at least 800Mb for array_base_len = 400).

# Generate graphs with unstructions analytics
```
make make_graphs
```

# Results

Results could be seen at 40\*40 and 100\*100 folders (different resolution). intrst_x.png, where x - is number of consecutive instructions.