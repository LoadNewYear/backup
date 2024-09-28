class Target {
	constructor (x, y) {
		this.x = x;
		this.y = y;
	}

	show() {
		this.x = mouseX;
		this.y = mouseY;
		ellipse(this.x, this.y, 32, 32);
	}
}
