import sys
if len(sys.argv) != 3 :
    print("python3 loopgen.py <string needed> <p=1> <variable name>")
    sys.exit(1)
s,p,var = sys.argv[1:]
def loopgen(s: str,p: int,var: str)->None:
    for i in s:
        print(f"mov byte [{var}+{p}],{i}")
        p+=1

