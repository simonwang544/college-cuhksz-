def HanoiTower(n):
    rod_belong = [0] * n
    if n % 2 == 0:
        rod_name = ['A', 'B', 'C']
    else:
        rod_name = ['A', 'C', 'B']
    for step in range(1, 2**n):
        bin_step = bin(step)
        disks = len(bin_step) - bin_step.rfind('1') - 1
        print(f"{rod_name[rod_belong[disks]]}->",end='')
        if disks % 2 == 0:
            rod_belong[disks] = (rod_belong[disks] + 1) % 3
        else:
            rod_belong[disks] = (rod_belong[disks] + 2) % 3
        print(rod_name[rod_belong[disks]])
n = int(input("Enter a positive integer n:"))
HanoiTower(n)