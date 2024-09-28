class Walker {
	constructor(x, y, t) {
		this.pos = createVector(x, y);
		this.shoudSubtract = false;
		this.target = t;
	}

	setup() {
		this.prev = this.pos.copy();
	}

	update() {
		this.step = p5.Vector.random2D();
		this.r = random(100);
		if (this.r < 1) {
			this.step.mult(random(25, 100));
		} else {
			this.step.setMag(2);
		}

		this.prev.set(this.pos);

		this.pos.add(this.step);

		if (this.pos.x - this.target.x <= 15) {
			this.foundX = true;
		} else {
			this.foundX = false;
		}

		if (this.pos.y - this.target.y <= 15) {
			this.foundY = true;
		} else {
			this.foundY = false;
		}

		if (this.foundX && this.foundY) {
			console.log('found');
		}
	}

	edges() {
		if (this.pos.x >= width) {
			this.pos.x = width;
		} else if (this.pos.x <= 0) {
			this.pos.x = 0;
		}

		if (this.pos.y >= height) {
			this.pos.y = height;
		} else if (this.pos.y <= 0) {
			this.pos.y = 0;
		}
	}

	show() {
		stroke(random(255), random(255), random(255));
		strokeWeight(2);
		line(this.pos.x, this.pos.y, this.prev.x, this.prev.y);
	}
}
