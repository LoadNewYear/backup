from manim import *

class main(Scene):
    def construct(self):
        image = ImageMobject("image.jpg")
        image.scale(0.1)
        text = Text("text")
        self.play(Write(text))
        self.play(ReplacementTransform(text, image))
        self.wait(3)
