from manim import *

class main(Scene):
    def construct(self):
        rect1 = Rectangle(height = 0.5, width=0.5, fill_opacity=1)
        rect2 = Rectangle(height = 0.5, width=0.5, fill_opacity=1)
        
        r1 = Rectangle(height = 0.5, width=0.5, fill_opacity=1)
        r2 = Rectangle(height = 0.5, width=0.5, fill_opacity=1)
        r3 = Rectangle(height = 0.5, width=0.5, fill_opacity=1)
        r4 = Rectangle(height = 0.5, width=0.5, fill_opacity=1)
        r5 = Rectangle(height = 0.5, width=0.5, fill_opacity=1)

        g1 = VGroup(r1, r2, r3, r4, r5)
        g1.arrange()
        g1.set_color_by_gradient(RED, YELLOW, YELLOW_C, PURE_GREEN)

        rect1.move_to([-5, 0, 0])
        rect2.move_to([5, 0, 0])


        self.play(Write(rect1))
        self.play(Write(rect2))

        g2 = VGroup(rect1, rect2)
        
        self.play(rect2.animate.next_to(rect1, RIGHT))
        self.play(ReplacementTransform(g2, g1))

        s1 = SurroundingRectangle(g2, color=WHITE)
        self.play(Write(s1))

        s2 = SurroundingRectangle(s1, color=WHITE)
        self.play(Write(s2), run_time=1.5)

        t = Text("1 2 3 4 5")
        t.next_to(s2, UP, buff=0.4)
        t.scale(1.2)
        
        self.play(Write(t))

        self.play(Indicate(t[0], color=RED), Indicate(r1, color=RED, scale_factor=0.3))
        self.play(Indicate(t[1], color=RED), Indicate(r2, color=RED, scale_factor=0.3))
        self.play(Indicate(t[2], color=RED), Indicate(r3, color=RED, scale_factor=0.3))
        self.play(Indicate(t[3], color=RED), Indicate(r4, color=RED, scale_factor=0.3))
        self.play(Indicate(t[4], color=RED), Indicate(r5, color=RED, scale_factor=0.3))

        d = Dot(color=RED).scale(10)

        g3 = VGroup(g1, g2, t, s1, s2)
        
        self.play(ReplacementTransform(g3, d))
        self.play(d.animate.scale(150))
        self.play(FadeOut(d))

        self.wait(3)
