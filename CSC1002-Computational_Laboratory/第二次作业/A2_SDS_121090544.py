#  import 
import turtle
import random
from turtle import *

#  constant variables 
r_size = 70                                                   # the size of rectangle
w_size = 6                                                    # the size of white space
o_boarder_size = 5                                            # the size of outline boarder 
u_size = r_size + w_size                                      # the size of white space and rectangle
l_colour = ['red', 'yellow', 'purple','orange' ,'blue']       # the kind of color
#   global variables 
g_board = None                                                # the brush of board
g_set  = None                                                 # the brush of color set
g_ink  = None                                                 # the brush of ink
g_screan = None                                               # the show of screen 
g_click_status = False                                        # mouse status : [ choose / flip ]
g_index_rec = None                                            # the rectangle by selected 
g_color = []                                                  # store the random board color

# create the rectangle element,set and fill the the position and color of brush
def put_rectangle(t, x, y, col):
    pos_x, pos_y = x * u_size, y *u_size                  
    t.pu()
    t.pensize(0)
    t.goto(pos_x - r_size//2, pos_y - r_size//2)
    t.color(l_colour[col])
    t.pd()
    t.begin_fill()                                            
    for i in range(4):
        t.forward(r_size)
        t.left(90)
    t.end_fill()
   
# draw figure of rectangle element and config (position & color & pensize) of brush
def rectangle_inking(t, x, y, col='black'):
    pos_x, pos_y = x * u_size, y *u_size    
    t.pu()
    t.goto(pos_x - u_size//2 , pos_y - u_size//2)
    t.color(col)
    t.pensize(o_boarder_size)
    t.pd()                                                    
    for i in range(4):
        t.forward(u_size)
        t.left(90)
   
# find the right rectangle and use recursion
def flipping(rect, col, t_col):
    p_x, p_y = rect
    if abs(p_x) <= 2 and abs(p_y) <= 2 and g_color[p_x+2][p_y+2]  == col:                       
        g_color[p_x+2][p_y+2] = t_col
        flipping((p_x+1, p_y), col, t_col)
        flipping((p_x-1, p_y), col, t_col)
        flipping((p_x, p_y+1), col, t_col)
        flipping((p_x, p_y-1), col, t_col)
    else:
        return 

# denote the position of click point and  judge contions (# such as the distance between and click points and position points, the click point is located in which rectangle)
def select_rectangle(p_click_x, p_click_y): 
    global g_click_status, g_index_rec
    if abs(p_click_x) <= (2*u_size + 0.5*r_size) and abs(p_click_y) <= (2*u_size + 0.5*r_size) and (not r_size//2  < abs(p_click_x) % u_size < r_size//2 + w_size) and (not r_size//2  < abs(p_click_y) % u_size < r_size//2 + w_size):
        x = int((p_click_x + 2*u_size + 0.5*r_size) // u_size)   
        y = int((p_click_y + 2*u_size + 0.5*r_size) // u_size)    
        g_click_status = True
        g_index_rec = (x-2, y-2)
        g_ink.clear()
        rectangle_inking(g_ink, x-2, y-2)
        g_screan.update()
        return
    if g_click_status is True:
        if abs(p_click_x) <= 2.5*u_size and (not r_size//2  < abs(p_click_x) % u_size < u_size//2) and -3.85* u_size <= p_click_y <= -2.85* u_size:
            x = int ((p_click_x + 2.5*u_size)// u_size)
            g_click_status = False
            g_ink.clear()
            if x != g_color[g_index_rec[0]+2][g_index_rec[1]+2]:
                flipping(g_index_rec, g_color[g_index_rec[0]+2][g_index_rec[1]+2], x)
                g_board.clear()
                # create the square board.
                for x in range(0, 5):
                    for y in range(0, 5):
                        put_rectangle(g_board, x-2, y-2, g_color[x][y])
                g_screan.update()
                return
    else:
        return

# main body
# create the turtle module and start to play
title(' Wang Jiaju Color Flipping')
g_board = Turtle()
g_set = Turtle()
g_ink = Turtle()
g_board.ht()
g_set.ht()
g_ink.ht()
g_screan = Screen()
g_screan.delay(0)
# create the random color 
for i in range(5):                                                                              
        tmp = []
        for j in range(5):
            tmp.append(random.randint(0, 4))
        g_color.append(tmp)
# create the square board
for x in range(0, 5):
        for y in range(0, 5):
            put_rectangle(g_board, x-2, y-2, g_color[x][y])
# create the select colors
for x in range(0, 5):
    put_rectangle(g_set, x-2, -3.35, x)
    rectangle_inking(g_set, x-2, -3.35, 'black')                                                   
g_screan.tracer(0)
g_screan.onclick(select_rectangle)
g_screan.mainloop()