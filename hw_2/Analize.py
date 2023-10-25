from matplotlib import pyplot as plt
from sys import argv


def get_label(tuple_names):
    names = []
    if (type(tuple_names[0]) == tuple):
        for name in tuple_names:
            names.append('+'.join(name))
    else:
        names = tuple_names
    
    return names

def make_graph(title, instructions, filename):
    values = list(zip(*instructions))[1]
    names  = get_label(list(zip(*instructions))[0])

    fig, ax = plt.subplots(figsize =(16, 10))
    ax.barh(names[::-1], values[::-1], zorder = 2)

    current_values = plt.gca().get_xticks()
    plt.gca().set_xticklabels(['{:.0f}'.format(x) for x in current_values])
    
    ax.grid(color ='grey', linestyle ='-.', linewidth = 0.5, alpha = 0.5)
    
    ax.set_title(title)
    
    fig.tight_layout()
    plt.savefig(filename)


def main():
    if len(argv) < 2:
        print(f"Usage: {argv[0]} <trace_file>")
        return

    trace_filename = argv[1]
    instructions = []

    with open(trace_filename, "r") as trace_file:
        instructions = trace_file.readlines()

    for i in range(0, len(instructions)):
        instructions[i] = instructions[i].strip()

    instrs_2 = []
    instrs_3 = []
    instrs_4 = []
    instrs_5 = []

    for i in range(0, len(instructions)):
        if i < len(instructions) - 1:
            instrs_2.append((instructions[i], instructions[i + 1]))
        if i < len(instructions) - 2:
            instrs_3.append((instructions[i], instructions[i + 1], instructions[i + 2]))
        if i < len(instructions) - 3:
            instrs_4.append((instructions[i], instructions[i + 1], instructions[i + 2], instructions[i + 3]))
        if i < len(instructions) - 4:
            instrs_5.append((instructions[i], instructions[i + 1], instructions[i + 2], instructions[i + 3], instructions[i + 4]))

    unique_instr_1 = {one   : instructions.count(one) for one   in set(instructions)}
    unique_instr_2 = {two   : instrs_2.count(two)     for two   in set(instrs_2)}
    unique_instr_3 = {three : instrs_3.count(three)   for three in set(instrs_3)}
    unique_instr_4 = {four  : instrs_4.count(four)    for four  in set(instrs_4)}
    unique_instr_5 = {five  : instrs_5.count(five)    for five  in set(instrs_5)}

    unique_instr_1 = sorted(unique_instr_1.items(), key=lambda item: item[1], reverse=True)
    make_graph("10 most frequent instructions",              unique_instr_1[0:10], "instrs_1.png")
    
    unique_instr_2 = sorted(unique_instr_2.items(), key=lambda item: item[1], reverse=True)
    make_graph("10 most frequent 2 consecutive instructions", unique_instr_2[0:10], "instrs_2.png")
    
    unique_instr_3 = sorted(unique_instr_3.items(), key=lambda item: item[1], reverse=True)
    make_graph("10 most frequent 3 consecutive instructions", unique_instr_3[0:10], "instrs_3.png")
    
    unique_instr_4 = sorted(unique_instr_4.items(), key=lambda item: item[1], reverse=True)
    make_graph("10 most frequent 4 consecutive instructions", unique_instr_4[0:10], "instrs_4.png")
    
    unique_instr_5 = sorted(unique_instr_5.items(), key=lambda item: item[1], reverse=True)
    make_graph("10 most frequent 5 consecutive instructions", unique_instr_5[0:10], "instrs_5.png")


if __name__ == '__main__':
    main()