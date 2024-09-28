let walker;

function setup() {
	createCanvas(400, 400);
	walker = new Walker(width/2, height/2);
}

function draw() {
	background(51);
	walker.update();
	walker.show();
}
