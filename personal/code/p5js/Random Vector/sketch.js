let xoff1 = 0;
let xoff2 = 10000;
let xoff3 = 20000;

function setup() {
	createCanvas(400, 400);
	background(0);
}

function draw() {
	translate(width/2, height/2);

	v = p5.Vector.random2D();
	v.mult(random(50, 100));
	
	strokeWeight(4);
	stroke(noise(xoff1) * 500, noise(xoff2) * 500, noise(xoff3) * 500, 50);
	xoff1 += 0.1;
	xoff2 += 0.1;
	xoff3 += 0.1;
	line(0, 0, v.x, v.y);
}
