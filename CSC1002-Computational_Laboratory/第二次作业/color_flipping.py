import turtle
import random
from turtle import *

#  constant variables 
r_size = 70                                                   #the size of rectangle
w_space = 9                                                   #the size of white space
o_boarder_size = 3                                            #the size of outline boarder 
u_size = r_size + w_space                                     #the size of white space and rectangle
l_colour = ['red', 'yellow', 'purple','orange' ,'blue']       # table of color id 
#   global variables 
g_board, g_bar, g_ink = None, None, None                      # brush of board, color bar, ink
g_screan = None                                               # screen control
g_screantatus = False                                            # mouse status : [ choose / flip ]
s_rectangle = None                                            # selected rectangle
g_color = []                                                  # random board color

# generate the rectangle element and config (position & color) of brush
def put_rectangle(t, x, y, col):
    pos_x, pos_y = x * u_size, y *u_size                  
    t.pu()
    t.pensize(0)
    t.goto(pos_x - r_size//2, pos_y - r_size//2)
    t.color(l_colour[col])
    t.pd()
    t.begin_fill()                                                                      # start to fill the rectangle with colors
    for i in range(4):
        t.fd(r_size)
        t.left(90)
    t.end_fill()
 # draw figure of rectangle element and config (position & color & pensize) of brush
def rectangle_inking(t, x, y, col='indigo'):
    pos_x, pos_y = x * u_size, y *u_size    
    t.pu()
    t.goto(pos_x - u_size//2 , pos_y - u_size//2)
    t.color(col)
    t.pensize(o_boarder_size)
    t.pd()                                                                              # show the tracks around the  rectangles
    for i in range(4):
        t.fd(u_size)
        t.left(90)

# generate the square board.
def generate_board():
    for x in range(0, 5):
        for y in range(0, 5):
            put_rectangle(g_board, x-2, y-2, g_color[x][y])

# generate the select colors
def generate_colors():
    for x in range(0, 5):
        put_rectangle(g_bar, x-2, -3.35, x)
        rectangle_inking(g_bar, x-2, -3.35, 'black')

def flipping(rect, col, t_col):
    x, y = rect
    if abs(x) <= 2 and abs(y) <= 2 and g_color[x+2][y+2]  == col:                        # meet the right range
        g_color[x+2][y+2] = t_col
        flipping((x+1, y), col, t_col)
        flipping((x-1, y), col, t_col)
        flipping((x, y+1), col, t_col)
        flipping((x, y-1), col, t_col)
    else:                                                                                # out of range and not a feasible rectangle
        return

# denote the position of click point and  judge contions
def select_rectangle(cli_x, cli_y): 
    global g_screantatus, s_rectangle
    for x in range(0, 5):
        for y in range(0, 5):
            pos_x, pos_y = (x-2)* u_size, (y-2)*u_size
            if abs(cli_x - pos_x) <= r_size//2 and abs(cli_y - pos_y) <= r_size//2:     #judge the distance between and click points and position points
                g_screantatus = True
                s_rectangle = (x-2, y-2)
                g_ink.clear()
                rectangle_inking(g_ink, x-2, y-2)
                g_screan.update()
                return
    if g_screantatus is True:
        for x in range(0, 5):
            pos_x = (x-2)* u_size
            pos_y = (-3.35)* u_size
            if abs(cli_x - pos_x) <= r_size//2 and abs(cli_y - pos_y) <= r_size//2:
                # find which rectangle the point is located in.
                g_screantatus = False
                g_ink.clear()
                if x != g_color[s_rectangle[0]+2][s_rectangle[1]+2]:
                    flipping(s_rectangle, g_color[s_rectangle[0]+2][s_rectangle[1]+2], x)
                    # repaint the board
                    g_board.clear()
                    generate_board()
                    g_screan.update()
                return

# create the turtle module
if __name__ == "__main__":
    title('Color Flipping')
    g_board = Turtle()
    g_bar = Turtle()
    g_ink = Turtle()
    g_board.ht()
    g_bar.ht()
    g_ink.ht()
    g_screan = Screen()
    g_screan.delay(0)
    for i in range(5):                                                    # generate random board color
        tmp = []
        for j in range(5):
            tmp.append(random.randint(0, 4))
        g_color.append(tmp)
    generate_board()
    generate_colors()                                                     # graphic user interface
    g_screan.tracer(0)
    g_screan.onclick(select_rectangle)
    g_screan.mainloop()