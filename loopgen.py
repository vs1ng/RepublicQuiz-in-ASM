import sys
if len(sys.argv) != 3 :
    print("python3 loopgen.py <string needed> <variable name>")
    sys.exit(1)
s,var = sys.argv[1:]
p: int = 0
def loopgen(s: str,p,var: str)->None:
    for i in s:
        if p == 0:
            print(f"mov byte [{var}],'{i}'")
            p+=1
        elif i != " ":
            print(f"mov byte [{var}+{p}],'{i}'")
            p+=1
        elif i == " ":
            print(f"mov byte [{var}+{p}],' '")
            p+=1
loopgen(s,p,var)
