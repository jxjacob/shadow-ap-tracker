lines = []

with open("shadowout.txt","r") as i:
    for line in i:
        lines.append(line.strip())

with open("newout.txt", "w") as o:
    for l in lines:
        pieces = l.split(" = ")
        print(f"[{pieces[1]}]: {{\"{pieces[0]}\", \"inserttypehere\"}}", file=o)