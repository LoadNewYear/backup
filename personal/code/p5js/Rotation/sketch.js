let angle = 0;
let angleV = 0;
let angleA = 0.001;

function setup() {
	createCanvas(400, 400);
}

function draw() {
	angleA = map(mouseX, 0, width, -0.01, 0.01);
	angleV = constrain(angleV, -0.2, 0.2)

	background(51);
	noStroke();
	rectMode(CENTER);
	translate(200, 200);
	rotate(angle);
	rect(0, 0, 200, 10);

	angle += angleV;
	angleV += angleA;
}
