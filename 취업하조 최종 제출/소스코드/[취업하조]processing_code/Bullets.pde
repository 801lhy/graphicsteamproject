class Bullets {                             

  float x, y;
  float xSpeed, ySpeed;
  float r;
  ArrayList<PVector> Trail;
  

  Bullets() {                                //Bullets 생성자
    x = random(500);
    y = random(-20, -10);
    xSpeed = 2;
    ySpeed = random(1, 4);
    r = 7.5;
    Trail = new ArrayList<PVector>();
  }

  void GameOver() {                          //Game Over을 나타내는 메서드
    fill(0);
    textSize(64);
    text("Game Over!!!!", width/2, height/2);
  }

  void display() {                           //총알 display
    for (PVector T : Trail) {
      tint(255, 127);
      fill(HSB, 137, 123, 113);
      noStroke();
      ellipse(T.x, T.y, r*2, r*2);
    }
    fill(#D61122);                           //총알 색상
    noStroke();
    ellipse(x, y, r*2.5, r*2.5);             //총알 정보
  }
  void move() {                              //총알의 이동
    x = x + xSpeed;
    y = y + ySpeed;
    if (y > height) {                        //총알이 화면바닥에 닿았을때,
      x = random(500);
      y = random(-200, -100);
      xSpeed += 0.1;
      ySpeed += 0.01;
    }
  }
  void bounce() {
    if (x < random(0) || x > random(300)) {
      xSpeed = -xSpeed ;
    }
  }
  boolean hit(User Player) {                 //사용자와 총알이 접촉했을때(게임이 끝나는 조건)
    float d = dist(x, y, Player.x, Player.y);
    if (d < r + Player.r) {
      return true;
    } else {
      return false;
    }
  }
}
