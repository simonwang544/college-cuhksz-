x=input("Enter a trigonometric function(sin,cos,tan):")
while True:
    if x == "sin":
        break
    elif x=="cos":
        break
    elif x == "tan":
        break
    else:
        print("Invalid input!")
        x = input("Enter a trigonometric function(sin,cos,tan) again:")
i = 1
z = 0
a = input("Enter a lower bound :")
while True:
    try:
        a==float(a)
        break
    except:
        print("Invalid input!")
        a = input("Enter a lower bound again:")
b = input("Enter a upper bound :")
while True:
    try:
        b==float(b)
        break
    except:
        print("Invalid input!")
        b = input("Enter a upper bound again:")
while True:
    if a>b:
        print("Invalid input!")
        a=input("Enter a lower bound again:")
        while True:
            try:
                a == float(a)
                break
            except:
                print("Invalid input!")
                a = input("Enter a lower bound again:")
        b=input("Enter a upper bound again:")
        while True:
            try:
                b == float(b)
                break
            except:
                print("Invalid input!")
                b = input("Enter a upper bound again:")
    else:
        break
n = input("Enter yhe number of sub-intervals n:")
while True:
    try:
        n==int(n)
        break
    except:
        print("Invalid input!")
        n = input("Enter the number of sub-intervals n again:")
while True:
    n=int(n)
    if n <= 0:
        print("Invalid input!")
        n = input("Enter the number of sub-intervals n again:")
    else:
        break
n=int(n)
a=float(a)
b=float(b)
if x=="sin":
    from math import sin
    while i <= n:
        y = (b - a) / n
        z = y * sin(a + y * (i - 0.5)) + z
        i += 1
if x == "cos":
    from math import cos
    while i <= n:
        y = (b - a) / n
        z = y * cos(a + y * (i - 0.5)) + z
        i += 1
if x == "tan":
    from math import tan
    while i <= n:
        y = (b - a) / n
        z = y * tan(a + y * (i - 0.5)) + z
        i += 1
print(z)