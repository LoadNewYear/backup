let inc = 0.01;
let start = 0;
// let xoff2 = 10000;
function setup() {
	createCanvas(400, 400);
}

function draw() {

	let xoff1 = start;
	background(51);

	noFill();
	stroke(255);
	beginShape();
	for (let x = 0; x < width; x++) {
		var y = noise(xoff1) * height;
		vertex(x, y);

		xoff1 += inc;
	}
	endShape();

	start += inc;
	// var x = noise(xoff1) * width;
	// var y = noise(xoff2) * height;

	// xoff1 += 0.02;
	// xoff2 += 0.02;

	// ellipse(x, y, 24, 24)
}
