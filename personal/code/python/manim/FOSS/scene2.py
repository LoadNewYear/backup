from manim import *

class explore(MovingCameraScene):
    def construct(self):

        dot1 = Dot(radius=0.2, point=[-5, -3, 0])
        dot2 = Dot(radius=0.2, point=[0, 0, 0])
        dot3 = Dot(radius=0.2, point=[5, 3, 0])
        self.add(dot1, dot2, dot3)

        # Path that follows the dot's movement
        path = VMobject()
        dot = Dot(point=[-5, -3, 0])
        path.set_points_as_corners([dot.get_center(), dot.get_center()])
        
        def update_path(path):
            previous_path = path.copy()
            previous_path.add_points_as_corners([dot.get_center()])
            path.become(previous_path)
            
        path.add_updater(update_path)
        self.add(path, dot)

        # Add labels near the dots
        introText = Text("Intro").scale(0.5).move_to([-5, -3.5, 0])
        videoText = Text("Video").scale(0.5).move_to([0, -0.5, 0])
        outroText = Text("Outro").scale(0.5).move_to([5, 2.5, 0])

        # Camera follows the dot continuously
        self.camera.frame.add_updater(lambda frame: frame.move_to(dot.get_center()))
        
        # Scale camera for closer zoom
        self.play(self.camera.frame.animate.scale(0.5))

        # Animate dot movement and write text labels
        self.play(Write(introText), run_time=0.4)
        self.play(dot.animate.shift([5, 3, 0]), run_time=0.4, rate_func=linear)
        self.play(Write(videoText), run_time=0.4)
        self.play(dot.animate.shift([5, 3, 0]), run_time=0.4, rate_func=linear)
        self.play(Write(outroText), run_time=0.4)

        moneyText = Text("$")
        moneyText.shift(dot.get_center())
        moneyText.shift(RIGHT)
        self.play(Write(moneyText))

        self.wait(1)
        self.play(dot.animate.shift([100, 0, 0]))

        # Stop following dot
        self.camera.frame.remove_updater(lambda frame: frame.move_to(dot.get_center()))

        # Reset the camera's frame
        self.play(self.camera.frame.animate.scale(2).move_to(ORIGIN), run_time=0.4)

class spy(Scene):
    def construct(self):
        eyes = SVGMobject("eyes.svg")
        eyes.set_stroke(width=2)
        eyes.set_fill(opacity=1)

        self.play(Write(Text("Tired of").shift(UP*2).scale(2)))
        self.play(Write(eyes))

class gift(Scene):
    def construct(self):
        freeandopensourcesoftwareText = Text("Free And Open Source Software")
        self.play(Write(freeandopensourcesoftwareText))
        
        software = SVGMobject("software.svg")
        software.set_stroke(width=2)
        software.set_fill(opacity=1)
        self.play(ReplacementTransform(freeandopensourcesoftwareText, software))

        gift = SVGMobject("gift.svg")
        gift.set_stroke(width=2)
        gift.set_fill(opacity=1)
        self.play(ReplacementTransform(software, gift))
