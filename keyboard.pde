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
  if (key == 'q' || key == 'Q') {
    shiftkey = true;
  }
  if (key == 'e' || key == 'E') {
    shiftkey2 = true;
  }
  if (key == 's' || key == 'S') {
    attackkey = true;
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
  if (key == 'q' || key == 'Q') {
    shiftkey = false;
  }
  if (key == 'e' || key == 'E') {
    shiftkey2 = false;
  }
  if (key == 's' || key == 'S') {
    attackkey = false;
  } 
}
