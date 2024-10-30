from manim import *

class CreateCircle(Scene):
    def construct(self):
        circle = Circle()  # create a circle
        circle.set_fill(PINK, opacity=0.5)  # set the color and transparency
        self.play(Create(circle))  # show the circle on screen

class WriteText(Scene):
    def construct(self):
        text = Text(text="Hello, Jyotirmay", font="JetBrainsMono Nerd Font")
        self.play(Write(text))

class CircleToRectangle(Scene):
    def construct(self):
        circle = Circle()
        circle2 = Circle()
        circle2.to_edge(RIGHT)
        text = Text(text="Hello I am Jyotirmay Nayak")

        self.play(Write(text))
        self.play(Transform(text[0], circle))
        self.play(Transform(text[1], circle))
        self.play(Transform(text[2], circle))
        self.play(Transform(text[3], circle))
        self.play(Transform(text[4], circle))
        self.play(Transform(text[5], circle))
        self.play(Transform(text[6], circle))
        self.play(Transform(text[7], circle))
        self.play(Transform(text[8], circle))
        self.play(Transform(text[9], circle))
        self.play(Transform(text[10], circle))
        self.play(Transform(text[11], circle))
        self.play(Transform(text[12], circle))
        self.play(Transform(text[13], circle))
        self.play(Transform(text[14], circle))
        self.play(Transform(text[15], circle))
        self.play(Transform(text[16], circle))
        self.play(Transform(text[17], circle))
        self.play(Transform(text[18], circle))
        self.play(Transform(text[19], circle))
        self.play(Transform(text[20], circle))
        self.play(Transform(text[21], circle2))
        
