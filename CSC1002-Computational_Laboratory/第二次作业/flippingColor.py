import turtle 
import random

#global constant
Total_color = [['white','LightPink1'],['white','salmon1'],['white','SlateBlue4'],
            ['white','MediumPurple1'],['white','sky blue1']]
color_list = []
turtles = []


def creat_colors():
    # 创建turtle颜色列表
    global color_list
    for r in range(5):
        row = []
        for i in range(5):
            row.append(random.choice([0,1,2,3,4]))
        color_list.append(row)
    return color_list


def creat_turtles():
    #创建turtles合集
    for i in range(5):
        t_row = []
        for r in range(5):
            t = turtle.Turtle()                       
            t.shape('square')
            t.color('white', Total_color[color_list[i][r]][1])
            t.shapesize(4.5, 4.5, 5)
            t.penup()
            t.goto(r * 100 - 200, 300 - i * 100)
            t_row.append(t)      
        turtles.append(t_row)
    return turtles

def color_set():
    #创建color set
    for i in range(5):
        t = turtle.Turtle()
        t.shape('square') 
        t.shapesize(4, 4, 4)
        t.color('black',Total_color[i][1])
        t.penup()
        t.goto(i * 100 - 200, -300)

def flip_square(col, row, game, orig, to):
    if orig == to:
        return game
    if row < 0 or row >= 5:
        return
    if col < 0 or col >= 5:
        return
    if game[row][col] != orig: # Different colors.
        return
    
    game[row][col] = to
    flip_square(col-1, row, game, orig, to)
    flip_square(col+1, row, game, orig, to)
    flip_square(col, row-1, game, orig, to)
    flip_square(col, row+1, game, orig, to)
    return game

count = 0
sq_x = 0
sq_y = 0 

def choose_square(x,y):
    global color_list
    global turtles
    global count
    global sq_x
    global sq_y

    if (x > -250 and x < 250) and (y > -350 and y < 350):
        coln = int((x+250)//100)
        row = int((350-y)//100)

        if y > -150 and y < 350 :   #click on board           
            if count == 0:
                count = 1
            if sq_y != -1 and sq_x != -1:
                turtles[sq_y][sq_x].color('white',Total_color[color_list[sq_y][sq_x]][1])
            sq_x = coln
            sq_y = row
            turtles[row][coln].color('black',Total_color[color_list[row][coln]][1])

        elif y > -350 and y < -250:    #click on color set
            if count == 1:
                count = 0
                color_list = flip_square(sq_x, sq_y, color_list, color_list[sq_y][sq_x], coln)
                sq_x = -1
                sq_y = -1
                for i in range(5):
                    for j in range(5):
                        turtles[i][j].color('white', Total_color[color_list[i][j]][1])

            turtle.update()


#main body
turtle.setup(800,800)
turtle.title("Yan Yuqing's Color Fliping Game")
turtle.delay(0)
creat_colors()
creat_turtles()
t = turtle.Screen()
color_set()
t.onclick(choose_square)
turtle.mainloop()