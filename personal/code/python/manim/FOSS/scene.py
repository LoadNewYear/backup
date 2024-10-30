from manim import *

class intro(Scene):
    def construct(self):
        freeandopensourcesoftwareText = Text("Free And Open Source Software")

        self.play(Write(freeandopensourcesoftwareText), func_time=1.5)

        fossText = Text("FOSS")

        self.play(ReplacementTransform(freeandopensourcesoftwareText, fossText), func_time=0.3)

        flossText = Text("FLOSS")
        
        self.play(ReplacementTransform(fossText, flossText), func_time=0.3)

class onemainreason(Scene):
    def construct(self):
        onemainreasonText = Text("1 Main Reason")
        self.play(Write(onemainreasonText), func_time=1.84)

class youtheuser(Scene):
    def construct(self):
        userText = Text("The User")
        arrow = Arrow(start=RIGHT, end=LEFT)

        arrow.shift(RIGHT * 3)
        userText.shift(RIGHT * 5)

        arrow.scale(0.5)

        self.wait(0.7)

        self.play(Write(arrow), Write(userText))

class githublogo(Scene):
    def construct(self):
        logo = SVGMobject("github.svg")
        self.play(Write(logo), func_time=1.2)

class githublogotospeech(Scene):
    def construct(self):
        speech = SVGMobject("comment.svg")
        logo = SVGMobject("github.svg")

        speech.set_stroke(width=2)  # Optional: Adjust stroke width if needed
        speech.set_fill(opacity=1)  # Ensure it stays filled
        self.play(ReplacementTransform(logo, speech))  # Try FadeIn to keep it displayed
        self.wait(1.32)

class today(Scene):
    def construct(self):
        todayText = Text("TODAY")
        self.play(Write(todayText), func_time=0.3)
