x=input("Please enter a positive integer:")
while True:
    try:
        x=int(x)
    except:
        print("Invalid input!")
        x=input("Please enter a positive integer again:")
    x=int(x)
    if x>1:
        break
    else:
        print("Invalid input!")
        x = input("Please enter a positive integer again:")
y=int(x)
L=[]
for i in range(2,y):
    a=2
    while a<i:
        if i%a==0:
            break
        a+=1
    else:
            L.append(i)
m=0
while m< len(L):
    print(L[m],end=" ")
    m+=1
    if m % 8==0:
        print("")