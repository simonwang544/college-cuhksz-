x = input("Please enter a positive integer:")
while True:
    try:
        y = int(x)
        if y>=0:
            break
        else:
            print("Invalid input!")
            x=input("Please enter a positive integer again:")
            continue
    except:
        print("Invalid input!")
        x=input("Please enter a positive integer again:")
    continue
print("m","m+1","m**(m+1)",sep="\t")
i=1
while i<=y:
    print(i,i+1,i**(i+1),sep="\t",end="\n")
    i+=1