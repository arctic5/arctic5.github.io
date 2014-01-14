import math

loop = 1
while loop == 1:
    print "distance formula calculator"
    x1 = input("x1 = ")
    y1 = input("y1 = ")
    x2 = input("x2 = ")
    y2 = input("y2 = ")
    # distance formula
    d = math.sqrt((x1-x2)**2+(y1-y2)**2)

    print d