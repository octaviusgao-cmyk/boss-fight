float floory = 420;

//boss variables
float bossx   = 370;
float bossy   = floory;
float bossw   = 60;
float bossh   = 100;
float bossvy  = 0;
boolean bossonground = true;


//player variables
float playerx = 200;
float playery = floory;
float playerw = 36;
float playerh = 60;
float playervy = 0;
boolean playeronground = true;
int playerhp = 5;
int hittimer = 0;
boolean ready = false;
int readycount = 0;

//attack variables
int attacktimer = 0;
int attackstate = 0;
float lungespeed = 0;
float jumpspeed = 14;

//keyboard booleans
boolean leftkey = false;
boolean rightkey = false;
boolean jumpkey = false;

void setup() {
  size(800, 500);
}

void draw() {
  background(0);


  fill(255);
  noStroke();
  rect(0, 0, 30, height);

  rect(width - 30, 0, 30, height);

  rect(0, floory + 10, width, height);

  moveBoss();
  movePlayer();
  damage();
  boss();
  player();
  hearts();
}

void moveBoss() {
  //gravity
  bossvy = bossvy + 0.6;
  bossy = bossy + bossvy;


  if (bossy >= floory) {
    bossy = floory;
    bossvy = 0;
    bossonground = true;
  }

  //telegraph
  if (attackstate == 0) {
    attacktimer = attacktimer + 1;

    if (attacktimer >= 120) {
      attacktimer = 0;
      attackstate = 1;

      if (playerx > bossx) {
        lungespeed = 14;
      }
      if (playerx <= bossx) {
        lungespeed = -14;
      }
    }
    
  }

  //idle
  if (attackstate == 1) {
    attacktimer = attacktimer + 1;

    if (attacktimer >= 50) {
      attacktimer = 0;
      attackstate = 3;
    }
  }

  //lunging
  if (attackstate == 2) {
    bossx = bossx + lungespeed;

    if (bossx < 30) {
      bossx = 30;
      attackstate = 0;
    }
    if (bossx + bossw > width - 30) {
      bossx = width - 30 - bossw;
      attackstate = 0;
    }
  }
  
  //jumping
  if (attackstate == 3) {
    if (attacktimer <= 100) {
      bossy = bossy - jumpspeed;
      bossy = 250;
      attacktimer = attacktimer +1; 
    }
    if (playerx >= bossx && attacktimer >= 100  && attacktimer < 1000) {    
      bossy = 250;
      bossx = bossx + 5;
      if (attacktimer > 1000) {
        bossy = bossy + jumpspeed;
      }
    } else if (playerx <= bossx && attacktimer >= 100 && attacktimer < 1000) {
      bossy = 250;
      bossx = bossx - 5;
      if (attacktimer > 1000) {
      bossy = bossy + jumpspeed;
      }
    }
  }

  if (bossx < 30) {
    bossx = 30;
  }

  if (bossx + bossw > width - 30) {
    bossx = width - 30 - bossw;
  }
}

void movePlayer() {

  if (leftkey) {
    playerx = playerx - 4;
  }

  if (rightkey) {
    playerx = playerx + 4;
  }


  if (jumpkey && playeronground) {
    playervy = -13;
    playeronground = false;
  }


  playervy = playervy + 0.6;
  playery  = playery + playervy;


  if (playery >= floory) {
    playery = floory;
    playervy = 0;
    playeronground = true;
  }


  if (playerx < 30) {
    playerx = 30;
  }


  if (playerx + playerw > width - 30) {
    playerx = width - 30 - playerw;
  }
}

void damage() {
  //center of boss and player
  float bosscx   = bossx + bossw / 2;
  float bosscy   = bossy - bossh / 2;
  float playercx = playerx + playerw / 2;
  float playercy = playery - playerh / 2;

  if (hittimer > 0) {
    hittimer = hittimer - 1;
  }

  //damage when close + i frame
  if (dist(bosscx, bosscy, playercx, playercy) < (bossw + playerw) / 2 && hittimer == 0) {
    playerhp = playerhp - 1;
    hittimer = 60;
  }
}

void boss() {
  //flash
  if (attackstate == 1 && frameCount % 8 < 4) {
    fill(255);
    noStroke();
    rect(bossx, bossy - bossh, bossw, bossh);
  }

  //hitbox
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(bossx, bossy - bossh, bossw, bossh);
}

void player() {
  //i frames
  if (hittimer > 0 && hittimer % 6 < 3) {
    hittimer = 0;
  }

  //hitbox
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(playerx, playery - playerh, playerw, playerh);
}

void hearts() {

  if (playerhp >= 1) {
    fill(255);
  } else {
    noFill();
  }
  stroke(255);
  strokeWeight(1);
  ellipse(48, 25, 14, 14);
  ellipse(58, 25, 14, 14);
  triangle(41, 29, 65, 29, 53, 42);

  if (playerhp >= 2) {
    fill(255);
  } else {
    noFill();
  }
  ellipse(78, 25, 14, 14);
  ellipse(88, 25, 14, 14);
  triangle(71, 29, 95, 29, 83, 42);

  if (playerhp >= 3) {
    fill(255);
  } else {
    noFill();
  }
  ellipse(108, 25, 14, 14);
  ellipse(118, 25, 14, 14);
  triangle(101, 29, 125, 29, 113, 42);

  if (playerhp >= 4) {
    fill(255);
  } else {
    noFill();
  }
  ellipse(138, 25, 14, 14);
  ellipse(148, 25, 14, 14);
  triangle(131, 29, 155, 29, 143, 42);

  if (playerhp >= 5) {
    fill(255);
  } else {
    noFill();
  }
  ellipse(168, 25, 14, 14);
  ellipse(178, 25, 14, 14);
  triangle(161, 29, 185, 29, 173, 42);
}
