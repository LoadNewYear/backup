// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/learning/noise/0.5-2d-noise.html
// https://youtu.be/ikwNrFvnL3g
// https://editor.p5js.org/codingtrain/sketches/2_hBcOBrF

// This example has been updated to use es6 syntax. To learn more about es6 visit: https://thecodingtrain.com/Tutorials/16-javascript-es6

let inc = 0.01;
let start = 0;

let pos;

function setup() {
	createCanvas(200, 200);
	pixelDensity(1);
	pos = createVector(0, 0);
}

function draw() {
	let yoff = start;

	loadPixels();

	for (pos.y; pos.y < height; pos.y++) {
		let xoff = start;
		for (pos.x; pos.x < width; pos.x++) {
			let index = (pos.x + pos.y * width) * 4;
			// let r = random(255)
			let r = noise(xoff, yoff) * 255;
			pixels[index + 0] = r;
			pixels[index + 1] = r;
			pixels[index + 2] = r;
			pixels[index + 3] = 255;

			xoff += inc;
		}
		yoff += inc;
	}
	start += inc;

	updatePixels();
	//noLoop();
}
