import random

# functions
# prompt the player to enter the number of balls for the game
def odd_ball_game():
    while True:
        number_of_balls = input("Enter the number of balls for the game? ")
        number_of_balls = int(number_of_balls)
        if number_of_balls % 2 == 0 and number_of_balls > 1:
            return True
        else:
            print("Invalid input!!!!")
            print("Please ensure a correct ball number is entered. The number must be even, minimum 2.")
    return number_of_balls

Number_Of_Balls=None

# choose the odd ball
def oddball(Number_Of_Balls):
    number_of_the_oddball = random.randint(1, Number_Of_Balls) 
    return number_of_the_oddball
# prompt the number to enter the balls to be placed on two pans
def Pans(Number_Of_Balls):
    while True:
        left = input("Enter the ball identifier(s) to be placed on left pan: ")
        right = input("Enter the ball identifier(s) to be placed on right pan: ")
        Left_on_pan = left.split()  
        Right_on_pan = right.split()  
        identifiers = [0] * (Number_Of_Balls*2)  
        flag = True  
        if len(Left_on_pan) != len(Right_on_pan):
            flag = False
        if Left_on_pan == []:
            flag = False
        for i in Left_on_pan:
            i = int(i)
            if (i > 0) and (i <= Number_Of_Balls) and (identifiers[i-1] == 0):
                identifiers[i-1] += 1
            else:
                flag = False 
            break
        for i in Right_on_pan:
            i = int(i)
            if (i > 0) and (i <= Number_Of_Balls) and (identifiers[i-1] + identifiers[i+Number_Of_Balls-1] == 0):
                identifiers[i+Number_Of_Balls-1] += 1
            else:
                flag = False 
            break
        if not flag:
            print("Your inputs for left:" , left , ", right:",right,sep = "")
            print("Invalid input!!!!")
            print('''
                Please ensure correct ball identifiers (1-",Number_Of_Balls,")
                are entered on each pan, no duplicate balls on either or both pans. 
                Both pans should have the same number of balls and must have at least one ball.''')
        else:
            return identifiers  
# check the user's answer
def check_answer(number_of_the_oddball):
    answer = input("Enter the odd ball number or press Enter to weigh: ") 
    if answer == str(number_of_the_oddball):
        return True
    else:
        print("Your answer is not correct!")
        return False
# judge the result of the scale
def scale(judge, number_of_the_oddball): 
    if judge[number_of_the_oddball-1] == 1:
        print("The scale shows: Left pan is down")
    elif judge[number_of_the_oddball+Number_Of_Balls-1] == 1:
        print("The scale shows: Right pan is down")
    else:
        print("The scale shows: Two pans are balanced")

count=1

#main process
while True:
    print ( '''
            Welcome to Kinley's odd ball game! You are given
            an even number of balls, labelled, and among 
            the balls one is heaver than the rest, called the
            odd ball. 
           
            Your goal is to find out which one is the odd one.
            You are given a weighing scale!

            Good luck and have fun!''')
    Number_Of_Balls = odd_ball_game()
    number_of_the_oddball= oddball(Number_Of_Balls)
    while True:
        print('''
              You are prompted to enter the balls to be placed 
              on the pans of the scale, separate each ball identifier
              with one minimum space, e.g. 1 2 3''')
        judge = Pans(Number_Of_Balls)
        scale(judge, number_of_the_oddball)
        if check_answer(number_of_the_oddball):
            break
        count+=1
    print("Congratulations!!!! Scale usage count:" , count)
    
    