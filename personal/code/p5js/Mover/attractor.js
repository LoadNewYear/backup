class Attractor {
	constructor(x, y, m) {
		this.pos = createVector(x, y);
		this.mass = m;
		this.r = 10;
	}

	attract(mover) {
		let force = p5.Vector.sub(this.pos, mover.pos);
		let distanceSq = constrain(force.magSq(), 25, 2500);

		let G = 5;

		let strength = G * (this.mass * mover.mass) / distanceSq;

		force.setMag(strength);
		mover.applyForce(force);
	}

	show() {
		noStroke();
		fill(255, 0, 0);
		ellipse(this.pos.x, this.pos.y, this.r*2);
	}
}
