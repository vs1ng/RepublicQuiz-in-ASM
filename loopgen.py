import sys
if len(sys.argv) != 4 :
    print("python3 loopgen.py <string needed> <p=1> <variable name>")
    sys.exit(1)
s,p,var = sys.argv[1:]
def loopgen(s: str,p: str,var: str)->None:
    p=int(p)
    for i in s:
        if i != " ":
            print(f"mov byte [{var}+{p}],'{i}'")
            p+=1
        elif i == " ":
            print(f"mov byte [{var}+{p}],' '")
            p+=1
loopgen(s,p,var)
