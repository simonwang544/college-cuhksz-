import turtle
import random
from turtle import *

#   global constants
TILE_SIZE = 70   # set the length of sides of each tile
WHITE_SPACE = 10   # set the length of each white space between two colored tiles
BORDER_WIDTH = 5    # set the width of each border 
UNIT_LENGTH = TILE_SIZE + WHITE_SPACE   # compute the total length of sides of each unit tile (including the white space)
COLOR_LIST = ['red', 'skyblue', 'lightcoral', 'SlateBlue4', 'blue']

#   global variables 
g_board = None   # board control
g_colorset = None   # color set control
g_ink = None   # ink of the pen control
g_screen = None   # screen control
g_mouse = False    # denote the region of last click (True if the last click is on the borad rather than the color set, else False)
g_tile_index = None   # denote the indexes of selected tile ranging from [0,0] to [4,4]
g_color = []   # the list of the actual random colors of tiles on the board

# generate a random color for each tile and store the colors in the list g_color
def color_on_board():
     for i in range(5):                                                    
        temp = []
        for j in range(5):
            temp.append(random.randint(0, 4))
        g_color.append(temp)

# generate the tiles of given indexes and fill the tiles with specific colors
# the parameters p_x and p_y denote the indexes of tiles
def colored_tiles(p_t, p_x, p_y, p_fill_color):
    pos_x = (p_x-2) * UNIT_LENGTH   # denote and compute the x-coordinate of the center of the tile        
    pos_y = (p_y-2) * UNIT_LENGTH   # denote and compute the y-coordinate of the center of the tile
    p_t.penup()
    p_t.pensize(0)
    p_t.goto(pos_x - TILE_SIZE/2, pos_y - TILE_SIZE/2)   # go to the lower left corner of the tile
    p_t.color(COLOR_LIST[p_fill_color])
    p_t.pendown()
    p_t.begin_fill()   # begin to fill the tile with the parameter "p_fill_color"
    for i in range(4):
        p_t.fd(TILE_SIZE)
        p_t.left(90)
    p_t.end_fill()

# ink the border of the selected tiles given its index
def tile_inking(p_t, p_x, p_y, p_ink_color = 'black'):
    pos_x = (p_x-2) * UNIT_LENGTH     
    pos_y = (p_y-2) * UNIT_LENGTH
    p_t.penup()
    p_t.goto(pos_x - UNIT_LENGTH/2 , pos_y - UNIT_LENGTH/2)   # go to the lower left corner of the unit tile including the white space
    p_t.color(p_ink_color)
    p_t.pensize(BORDER_WIDTH)
    p_t.pendown()
    for i in range(4):
        p_t.fd(UNIT_LENGTH)
        p_t.left(90)

# display the board and colored tiles
def board():
    for col in range(0, 5):
        for row in range(0, 5):
            colored_tiles(g_board, col, row, g_color[col][row])

# diaplay the color set
def color_set():
    for x in range(0, 5):
        colored_tiles(g_colorset, x, -1.5, x)   # the index of all the tiles in the color bar is -1.5 in the direction of the y-axis
        tile_inking(g_colorset, x, -1.5, 'black')

# make color flipping in a recursive way
# parameters p_tile, p_orig_color, p_to_color denote the index of the selected tile, the original color of selected tile and the ultimate color the user wants, respectively
def color_flipping(p_tile, p_orig_color, p_to_color):
    col = p_tile[0]
    row = p_tile[1]
    if (0 <= col <= 4) and (0 <= row <= 4) and (g_color[col][row] == p_orig_color):   # check whether the selected tile is within the board
        g_color[col][row] = p_to_color
        color_flipping([col+1, row], p_orig_color, p_to_color)
        color_flipping([col-1, row], p_orig_color, p_to_color)
        color_flipping([col, row+1], p_orig_color, p_to_color)
        color_flipping([col, row-1], p_orig_color, p_to_color)
    else:                                                                               
        return

# select one tile from the board and one color and make color flipping
def select_tile(p_click_x, p_click_y):   # the parameters p_click_x and p_click_y denote the x- and y- coordinates of the clicking point 
    global g_mouse, g_tile_index
    # select a tile from the board 
    if (-190 <= p_click_x <= 190) and (-190 <= p_click_y <= 190) and (not 35 < abs(p_click_x) % 80 < 45) and (not 35 < abs(p_click_y) % 80 < 45):   # validate the right clicking region and check whether the clicking point is in this region
        col = int((p_click_x + 195) // 80)   # compute the index in the direction of the x-axis
        row = int((p_click_y + 195) // 80)   # compute the index in the direction of the y-axis
        g_mouse = True   # successfully select a tile, so turn the variable g_mouse to True
        g_tile_index = [col, row]
        g_ink.clear()
        tile_inking(g_ink, col, row)   # the last selected tile is framed with a border
        g_screen.update()
    
    # pick one color from the colorset if the user has already selected a tile from the board, and then make color flipping 
    if g_mouse:
        if (-190 <= p_click_x <= 190) and (not 35 < abs(p_click_x) % 80 <= 45) and (-315 <= p_click_y <= -245):   # validate the right clicking region and check whether the clicking point is in this region when choosing colors
            col = int((p_click_x + 195) //80)
            g_mouse = False   # the variable g_mouse is reset back to False after successfully selecting the color
            g_ink.clear()
            if col != g_color[g_tile_index[0]][g_tile_index[1]]:
                color_flipping(g_tile_index, g_color[g_tile_index[0]][g_tile_index[1]], col)
                g_board.clear()   # repaint the board
                board()
                g_screen.update()
            return

# main body
if __name__ == "__main__":
    title('Color Flipping by Haoyun Hu')
    g_board = Turtle()
    g_colorset = Turtle()
    g_ink = Turtle()
    g_board.ht()
    g_colorset.ht()
    g_ink.ht()
    g_screen = Screen()
    g_screen.delay(0)
    color_on_board()
    board()
    color_set()                                                     
    g_screen.tracer(0)
    g_screen.onclick(select_tile)
    g_screen.mainloop()