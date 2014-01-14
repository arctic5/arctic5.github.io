import math

loop = 1
while loop == 1:
    print "Quadratic calculator: Gets the solution(s) of any equation ax^2+bx+c=0."
    a = input("Please enter a: ")
    b = input("Please enter b: ")
    c = input("Please enter c: ")
    # quadratic equation
    d = b*b-4*a*c;

    if d > 0:
        print "Solution 1:"
        print -b + math.sqrt(d)/(2*a)
        print "Solution 2:"
        print -b - math.sqrt(d)/(2*a)
    elif d == 0:
        print "Only solution:"
        print -b/(2*a)
    else:
        print "There is no (real) solution"