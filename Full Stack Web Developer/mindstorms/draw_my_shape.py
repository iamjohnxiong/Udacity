import turtle

def draw_shape():
    john = turtle.Turtle()
    john.shape("turtle")
    john.color("blue")
    john.speed(100)

    for i in range(1, 46):
        for i in range(4):
            john.forward(100)
            john.right(90)
        john.right(10)

    john.forward(200)

def main():
    window = turtle.Screen()
    window.bgcolor("white")

    draw_shape()

    window.exitonclick()


main()
