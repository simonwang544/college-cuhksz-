num_0 = input("Please enter a positive integer:")
while True:
    try:
        num_1 = int(num_0)
        if num_1 <= 1:
            print("your input is invalid")
            num_0 = input("Please enter a positive integer again:")
            continue
        else:
            break
    except:
        print("you input is invalid")
        num_0 = input("Please enter a positive integer again:")
        continue
num = int(num_0)
L = []
for t in range(2, num):
    i = 2
    while i < t:
        if t % i == 0:
            break
        i += 1
    else:
        L.append(i)
x = 0
while x < len(L):
    print(L[x], end=" ")
    x += 1
    if x % 8 == 0:
        print("")

