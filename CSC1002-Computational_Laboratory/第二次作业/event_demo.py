import turtle

g_turtle = None

def toggleColor(x, y):
    # the current color
    c = g_turtle.color()[1]
    
    # toggle color
    c = "red" if c == "blue" else "blue"
    g_turtle.color(c)    

def moveUp():
    x,y = g_turtle.pos()
    g_turtle.goto(x, y+50)

def moveDown():
    x,y = g_turtle.pos()
    g_turtle.goto(x, y-50)

def moveLeft():
    x,y = g_turtle.pos()
    g_turtle.goto(x-50, y)

def moveRight():
    x,y = g_turtle.pos()
    g_turtle.goto(x+50, y)

def goHome():
    g_turtle.home()

if __name__ == "__main__":
    g_turtle = turtle.Turtle('square')
    g_turtle.shapesize(3,3,5)
    g_turtle.color('red')
    g_turtle.up()
    
    s = turtle.Screen()
    s.onclick(toggleColor)
    
    s.onkey(moveUp, "Up")
    s.onkey(moveDown, "Down")
    s.onkey(moveLeft, "Left")
    s.onkey(moveRight, "Right")
    s.onkey(goHome, "space")
    
    s.listen()  # for the onkey()
    s.mainloop()