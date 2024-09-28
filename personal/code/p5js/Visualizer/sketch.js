let song;
let fft;
let w;
let button;

function preload() {
  song = loadSound("http://192.168.1.6:3000/song.mp3");
}

function setup() {
  createCanvas(256, 256);
  colorMode(HSB);
  angleMode(DEGREES);
  button = createButton("toggle");
  button.mousePressed(toggleSong);
  song.play();

  // Set smoothing to 0, 256 bins
  fft = new p5.FFT(0.9, 64);
  w = width / 64;
}

function toggleSong() {
  if (song.isPlaying()) {
    song.pause();
  } else {
    song.play();
  }
}

function draw() {
  background(0);
  let spectrum = fft.analyze();
  // console.log(spectrum);
  // stroke(255);
  for (let i = 0; i < spectrum.length; i++) {
    let ampl = spectrum[i];
    fill(i, 255, 255);
    let y = map(ampl, 0, 256, height, 0);
    rect(i*w, y, w, height - y);
  }
}
