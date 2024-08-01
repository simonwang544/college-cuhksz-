from turtle import *
import random

color = ["red", "blue", "yellow", "aqua", "purple"]
beginx = -175
beginy = 240
matrix = [[0 for col in range(0, 5)] for row in range(0, 5)]
Position = [[0 for a in range(0, 10)] for b in range(0, 10)]
choose = [0 for c in range(0, 10)]

def getpos(i, j) :
    return beginx + i * 65, beginy - j * 65

def retangle():
    for i in range(0, 5) :
        seth(90 * i)
        fd(60)

def draw_next() :
    penup()
    fd(5)
    pendown()

def draw_next_line(x) :
    penup()
    setx(beginx)
    setheading(270)
    fd(60 + x)
    setheading(0)
    pendown()

def paint(i, j, x, y, now_color) :
    penup()
    setpos(x, y)
    pendown()
    begin_fill()
    fillcolor(color[now_color])
    retangle()
    end_fill()
    matrix[i][j] = now_color

def draw_GUI() :
    for i in range(0, 5):
        for j in range(0, 5):
            x = int(random.random() * 1000 % 5)
            px, py = getpos(i, j)
            paint(i, j, px, py, x)
            draw_next()
        draw_next_line(5)
    draw_next_line(60)
    for i in range(5) :
        begin_fill()
        fillcolor(color[i])
        retangle()
        draw_next()
        end_fill()

def initialization() :
    hideturtle()
    tracer(False)
    speed(1)
    penup()
    setpos(beginx, beginy)
    pendown()

now = -1

def check(x, y, i, j) :
    px, py = getpos(i, j)
    if px <= x <= px + 60 and py <= y <= py + 60 :
        return True
    else :
        return False

vis = [[0 for i in range(0, 5)] for j in range(0, 5)]

def dfs(i, j) :
    for dx in range(-1, 2) :
        for dy in range(-1, 2) :
            if 0 <= i + dx <= 4 and 0 <= j + dy <= 4 and (dx == 0 or dy == 0):
                if matrix[i + dx][j + dy] == matrix[i][j] and vis[i + dx][j + dy] == 0 :
                    vis[i + dx][j + dy] = 1
                    print("x = %d, y = %d" %(i + dx, j + dy))
                    px, py = getpos(i + dx, j + dy)
                    dfs(i + dx, j + dy)
                    paint(i + dx, j + dy, px, py, now)

def Print() :
    for i in range(0, 5) :
        for j in range(0, 5) :
            print(matrix[j][i], end = " ")
        print("")
    print("\n\n\n\n")

def flip(i, j) :
    px, py = getpos(i, j)
    dfs(i, j)
    paint(i, j, px, py, now)
    for i in range(0, 5) :
        for j in range(0, 5) :
            vis[i][j] = 0
    Print()

def click(x, y) :
    global now
    for i in range(0, 5) :
        for j in range(0, 5) :
            if check(x, y, i, j) == True and now != -1:
                flip(i, j)
    for i in range(5) :
        if check(x, y + 185, i, 4) :
            now = i

def start() :
    Print()
    onscreenclick(click, 1)

def main() :
    initialization()
    draw_GUI()
    start()

main()
done()
