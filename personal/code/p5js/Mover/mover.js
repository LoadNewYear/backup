class Mover {
	constructor(x, y, vx, vy, m) {
		this.pos = createVector(x, y);
		this.vel = createVector(vx, vy);
		this.acc = createVector(0, 0);
		this.mass = m;
		this.r = sqrt(this.mass) * 2;
		fill(random(255), random(255), random(255), 100);
	}


	applyForce(force) {
		let f = p5.Vector.div(force, this.mass);
		this.acc.add(f);
	}

	friction() {
		let diff = height - (this.pos.y + this.r);

		if(diff < 1) {
			let friction = this.vel.copy();
			friction.normalize();
			friction.mult(-1);

			let mu = 0.1;
			let normal = this.mass;

			friction.setMag(mu * normal);
			this.applyForce(friction);
		}
	}

	drag(c) {
		// Direction of drag
		let drag = this.vel.copy();
		drag.normalize();
		drag.mult(-1);
		
		// let surfaceArea = this.width * 0.05;
		let speed = this.vel.magSq();
		drag.setMag(c * speed);
		
		this.applyForce(drag);
	}

	edges() {
		if (this.pos.y >= height - this.r) {
			this.pos.y = height - this.r;
			this.vel.y *= -1;
		}

		if (this.pos.x >= width - this.r) {
			this.pos.x = width - this.r;
			this.vel.x *= -1;
		} else if (this.pos.x <= this.r) {
			this.pos.x = this.r;
			this.vel.x *= -1;
		} else if (this.pos.y <= this.r) {
			this.pos.y = this.r;
			this.vel.y *= -1;
		}
	}

	attract(mover) {
		let force = p5.Vector.sub(this.pos, mover.pos);
		let distanceSq = constrain(force.magSq(), 25, 2500);

		let G = 25;

		let strength = G * (this.mass * mover.mass) / distanceSq;

		force.setMag(strength);
		mover.applyForce(force);
	}

	update() {
		this.vel.add(this.acc);
		this.pos.add(this.vel);
		this.acc.set(0, 0);
	}

	show() {
		noStroke();
		ellipse(this.pos.x, this.pos.y, this.r * 2, this.r * 2);
	}
}
