let walker;
let target;

function setup() {
	createCanvas(600, 600);
	target = new Target(random(255), random(255));
	walker = new Walker(width/2, height/2, target);
	background(51);
	walker.setup();
}

function draw() {
	background(51, 2);
	target.show();

	walker.update();
	walker.edges();
	walker.show();
}
