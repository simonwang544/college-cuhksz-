import random

# Global variables
g_number_of_balls = None
g_number_of_odd_ball = None

# prompt the user to enter the number of the balls
# deal with the invalid input and prompt the user to input again
# return the number of the balls once the user enters a correct number
def get_ball_number():
    while True:
        global g_number_of_balls
        g_number_of_balls = input("Enter the number of balls for the game? ")
        try:
            g_number_of_balls = int(g_number_of_balls)
        except:
            g_number_of_balls = -1  # if the input isn't an integer, we asign -1 to the variable, since -1 is also an invalid input     
        if g_number_of_balls % 2 == 0 and g_number_of_balls > 1:
            break
        else:
            print("Invalid input!!!!")
            print("Please ensure a correct ball number is entered. The number must be even, minimum 2.")
    return g_number_of_balls

# choose one ball as the odd ball randomly
def odd_ball():
    global g_number_of_odd_ball
    g_number_of_odd_ball = random.randint(1, g_number_of_balls)  # randomly pick the number of the odd ball in the correct range (minimum 1 and maximum g_numberOfBalls)
    return g_number_of_odd_ball

# prompt the user to enter the correct ball identifiers to be placed on both pans
# deal with the invalid input and prompt the user to input again
def indentifiers_on_pans():
    while True:
        left = input("Enter the ball identifier(s) to be placed on left pan: ")
        right = input("Enter the ball identifier(s) to be placed on right pan: ")
        identifiers_on_left = left.split()  # a list of the identifiers on left pan the user inputs
        identifiers_on_right = right.split()  # a list of the identifiers on right pan the user inputs
        identifiers = [0] * (g_number_of_balls*2)  # original list to store the occurrences of each identifier on two pans (first half of the elements correspond to identifiers on left pan, and the second half correspond to the right pan)
        flag = True  # indicate whether the ball identifiers are valid
        if len(identifiers_on_left) != len(identifiers_on_right):
            flag = False
        if identifiers_on_left == []:
            flag = False
        for i in identifiers_on_left:
            try:
                i = int(i)
            except:
                i = -1  # if the input is not a number, we assign -1 to this element, since -1 is also not in the correct range
            if (i > 0) and (i <= g_number_of_balls) and (identifiers[i-1] == 0):
                identifiers[i-1] += 1
            else:
                flag = False 
                break
        for i in identifiers_on_right:
            try:
                i = int(i)
            except:
                i = -1  # if the input is not a number, we assign -1 to this element, since -1 is also not in the correct range
            if (i > 0) and (i <= g_number_of_balls) and (identifiers[i-1] + identifiers[i+g_number_of_balls-1] == 0):
                identifiers[i+g_number_of_balls-1] += 1
            else:
                flag = False 
                break
        if not flag:
            print("Your inputs for left:" , left , ", right:",right,sep = "")
            print("Invalid input!!!!")
            print("Please ensure correct ball identifiers (1-",g_number_of_balls,") are entered on each pan, no duplicate balls on either or both pans. Both pans should have the same number of balls and must have at least one ball.",sep = "")
        else:
            return identifiers  # return the list of occurrences of each identifier on two pans

# check the result of the scale
def scale(p_idt): # idt: the list of occurrences of each identifier on two pans
    if p_idt[g_number_of_odd_ball-1] == 1:
        print("The scale shows: Left pan is down")
    elif p_idt[g_number_of_odd_ball+g_number_of_balls-1] == 1:
        print("The scale shows: Right pan is down")
    else:
        print("The scale shows: Two pans are balanced")

# check the answer of the user
# return True if the answer is correct; return False if the answer is not correct
def ans_check():
    ans = input("Enter the odd ball number or press enter to weigh: ")  # prompt the user to make a guess for the odd number
    if ans == str(g_number_of_odd_ball):
        return True
    elif ans == "":
        return
    else:
        print("Your answer is not correct!")
        return False

# main body
while True:
    count = 1  # count the scale usage
    print("Welcome to Haoyun's odd-ball game! You are given an even number of balls, labelled, and among the balls one is heavier than the rest, called the odd ball.")
    print("Your goal is to find out which one is the odd one. You are given a weighing scale!")
    print("Good luck and have fun!")
    get_ball_number()
    odd_ball()
    while True:
        print("You are prompted to enter the balls to be placed on the pans of the scale, separate each ball identifier with one minimum space, e.g. 1 2 3")
        idt = indentifiers_on_pans()
        scale(idt)
        answer = ans_check()  # indicates whether the answer of the user is correct or not
        if answer:
            break
        count+=1
    print("Congratulations!!!! Scale usage count:" , count)
    response = input("Do you want to quit (please type No) or start a new game (please type Yes) : ")  # get respose from the user on whether he/she wants to start a new game
    if response != "Yes":
        break