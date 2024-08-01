import random
# test whether the totalnum is even, minimum 2
def testTotalnum(num):
    if num %2 == 1 or num < 2:
        print("Invalid input!!!\nThe number your input should be an even and minimum 2.\n") 
        return False
    else:
        return True 

# transform a string to a int_list and test whether the inputs are ints
def transformIntoList(string):
    str_list = string.split()
    try:
        return [int(x) for x in str_list]
    except:
        return False    

# test whether the balls' identifiers are right
def testIdentifiers(num,ball_list=[]):
    for i in ball_list:
            if i < 1 or i > num:
                return False
    return True

# test if there have duplicte ball 
def testDuplicteBall(ball_list=[]):
    set_ball = set(ball_list)
    if len(ball_list) != len(set_ball):
        return False
    else:
        return True

# test whether the numbers of balls on the pan are the same and at least have one on each side
def testBallsNum(L,R):
    if L == 0 or R == 0 or L != R:
        return False
    else:
        return True

# check whether the input is right, ask another input if it is not
def checkInputs(totalNum):
    while True:
        print("You are prompted to enter the balls to be placed on the pans of the scale, separate each ball identifier with one minimum space, e.g. 1 2 3")
        global g_left
        global g_right
        g_left = input("Enter the ball indentifiers to be placed on left pan:")
        g_right = input("Enter the ball indentifiers to be placed on right pan:")
        left_list = transformIntoList(g_right)     # a list of the identifiers on left pan the user inputs
        right_list = transformIntoList(g_right)     # a list of the identifiers on right pan the user inputs
        ball_list = transformIntoList(g_left+" "+g_right)     # a list of the identifiers on both pan the user inputs
        # check whether inputs are ints
        if ball_list == False:  
            print("Invalid input!!!\n\nYour inputs for left:",g_left,",right:",g_right)
            print("Please ensure correct ball identifiers(1-8) are entered on each pan,\nno duplicate balls on either or both pans.")
            print("Both pans should have the same number of balls and must have at least on ball.\n")
            continue
        # check whether inputs are at least one, have right identifiers and not have same num.
        if testIdentifiers(totalNum,ball_list) and testDuplicteBall(ball_list) and testBallsNum(len(left_list),len(right_list)):
            break
        else:
            print("Invalid input!!!\n\nYour inputs for left:",g_left,",right:",g_right)
            print("Please ensure correct ball identifiers(1-8) are entered on each pan,\nno duplicate balls on either or both pans.")
            print("Both pans should have the same number of balls and must have at least on ball.\n")
            continue

# get the scale result
def scale(oddnum,right,left):
    if str(oddnum) in right:
        print("Right Heavier")
        return True
    elif str(oddnum) in left:
        print("Left Heavier")
        return True
    else:
        print("Balanced")
        return False

# check whether the answer is correct
def checkAnswer(answer,oddnum):
    if answer == oddnum:
        print("Your answer is correct!")
        return True
    else:
        print("Your answer is not correct!")
        return False


# main body      
print("Welcome to Liana's odd-ball game!")
print("You are given an even number of balls, labelled,and among the balls one is heavier than the rest, called the odd ball.")
print("Your goal is to find out which one is the odd one.\nYou are given a weighing scale!\nGood Luck and have fun!")
# check whether the input is an even int and minimum 2, ask another input if it is not
while True:
    try:
        g_total_num = int(input("Enter the number of balls for the game? "))
    except:
        print("Invalid input!!!\nThe input should be a number.\n")
        continue
    if testTotalnum(g_total_num):
        break
# randomly choose a num to be the odd ball 
g_oddnum = random.randint(1,g_total_num)
count = 0 # a variable counts the scale usage
# the game cycle
while True:
    count = count + 1 
    checkInputs(g_total_num)  
    if scale(g_oddnum,g_right,g_left):
        try:
            g_answer = int(input("Enter the odd ball number or press Enter to weigh:"))
        except:
            continue
    else:
        continue
    if checkAnswer(g_answer,g_oddnum):
        print("Scale usage count:",count)
        break
    else:
        continue
