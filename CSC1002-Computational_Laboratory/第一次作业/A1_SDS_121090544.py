# import
import random
# global
g_number_of_balls = None
g_number_of_odd_ball = None
count = 1    # count the scale usage    
# prompt the user to enter the number of the balls
def get_number_of_balls():
    global g_number_of_balls
    g_number_of_balls = input("Enter the number of balls for the game? ")
    return g_number_of_balls
    
# test whether the number of balls is even and minimum 2
def text_number_of_balls(p_num):
    while True:
        try:
            p_num = int(p_num)
        except:    
            p_num = 0   #if the input isn't an integer, we assign 0 to the variable, since 0 is also an invalid input.
        if p_num %2 == 1 or p_num < 2:
            print("Invalid input!!!")
            print("Please ensure a correct ball number is entered.The number your input should be an even and minimum 2.") 
            p_num = input("Enter the number of balls for the game? ")
        else:
            return p_num
            break

# choose one ball as the odd ball randomly
def get_number_of_odd_ball():
    global g_number_of_odd_ball
    g_number_of_odd_ball = random.randint(1, g_number_of_balls)  # randomly pick the number of the odd ball in the correct range (minimum 1 and maximum g_number_of_balls)
    return g_number_of_odd_ball

# prompt the user to enter the correct ball identifiers to be placed on both pans 
def identifiers_on_pans():
    global  flag, identifiers
    while True:
        flag = True
        identifiers = [0] * g_number_of_balls
        print("You are prompted to enter the balls to be placed on the pans of the scale, separate each ball identifier with one minimum space, e.g. 1 2 3")
        left_pan = input("Enter the ball identifier(s) to be placed on left pan: ")
        right_pan = input("Enter the ball identifier(s) to be placed on right pan: ")
        L_left = left_pan.split()    # a list of the identifiers on left pan the user inputs
        L_right = right_pan.split()  # a list of the identifiers on right pan the user inputs
        flag = True                  # indicate whether the ball identifiers are valid
        if len(L_left) != len(L_right): 
            flag = False
        if L_left == []:
            flag = False
        if L_right == []:
            flag = False
        L_left  = text_identifiers_on_pans(L_left)      #let the elements'type of L_left translate to int type
        L_right = text_identifiers_on_pans(L_right)     #let the elements'type of L_right translate to int type
        if flag == False:
            print("Your inputs for left:" , left_pan , ", right:", right_pan ,sep = "")
            print("Invalid input!!!!")
            print("Please ensure correct ball identifiers (1-",g_number_of_balls,") are entered on each pan, no duplicate balls on either or both pans. Both pans should have the same number of balls and must have at least one ball.",sep = "")
        else:
            if check_the_odd_ball(identifiers) == True:     #if the oddball is in the pans, two pans aren't balanced
                if g_number_of_odd_ball in L_left:
                    print("The scale shows: Left pan is down")
                    break 
                if g_number_of_odd_ball in L_right:
                    print("The scale shows: Right pan is down")
                    break
            if check_the_odd_ball(identifiers) == False:     #if the oddball isn't in the pans, two pans must are balanced
                print("The scale shows: Two pans are balanced")
                break

# check whether the inputs of balls identifiers in two pans are right
def  text_identifiers_on_pans(p_l_list):
    global  flag, identifiers
    index = 0         #index is the index of p_l_list, and it can help change the elements of p_l_list
    for i in p_l_list:
        try:
            i = int(i)           
            p_l_list[index] = i       #let str into int
            index +=1
        except:
            i = 0      # if the input is not a number, we assign 0 to this element, since 0 is also not in the correct range
        if (i > 0) and (i <= g_number_of_balls) and (identifiers[i-1] == 0):
            identifiers[i-1] = 1
        else:
            flag = False 
    return p_l_list    # now the p_l_list is the int's list

#check if the oddball is in the pans 
def check_the_odd_ball(p_list):
    if p_list[g_number_of_odd_ball-1] == 1:
        return True
    else:
        return False   

# prompt the user to make a guess for the odd number
def check_answer():
    answer = input("Enter the odd ball number or press enter to weigh: ")
    if answer == str(g_number_of_odd_ball):
        return True
    else:
        print("Your answer is not correct!")
        return False

#main body
while True:
    print("Welcome to Jiaju's odd-ball game! You are given an even number of balls, labelled, and among the balls one is heavier than the rest, called the odd ball.")
    print("Your goal is to find out which one is the odd one. You are given a weighing scale!")
    print("Good luck and have fun!")
    g_number_of_balls = get_number_of_balls()
    g_number_of_balls = text_number_of_balls(g_number_of_balls)
    g_number_of_odd_ball = get_number_of_odd_ball()
    identifiers = [0] * g_number_of_balls  # original list to store the occurrences of each identifier
    while True:
        identifiers_on_pans()
        the_answer = check_answer()        # indicates whether the answer of the user is correct or not
        if the_answer == False:
            count+=1
        if the_answer == True:
            print("Congratulations!!!! Scale usage count:" , count)
            break
    want_again = input("Do you want to quit (please type No) or start a new game (please type Yes) : ")  # get respose from the user on whether he/she wants to start a new game
    if want_again == "No":
        break  