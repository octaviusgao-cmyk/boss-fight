void keyPressed() {
  if (key == 'a' || key == 'A') {
    leftkey = true;
  }
  if (key == 'd' || key == 'D') {
    rightkey = true;
  }
  if (key == 'w' || key == 'W') {
    jumpkey = true;
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A') {
    leftkey = false;
  }
  if (key == 'd' || key == 'D') {
    rightkey = false;
  }
  if (key == 'w' || key == 'W') {
    jumpkey = false;
  }
}
