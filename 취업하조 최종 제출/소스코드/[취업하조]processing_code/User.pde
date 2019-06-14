class User //사용자 정보
{                        
  float x, y;
  float xSpeed, ySpeed;
  float r;

  User() //생성자, 
  {
    x = width/2;
    y = height - 16;
    xSpeed = 0;
    ySpeed = 0;
    r = 4.9;
  }

  void display() 
  {
    noTint();             //이미지의 채우기 값 제거(색조 사용 x)
    fill(255);
    image(photo2, x, y);
  }
  
  void setDirX(float dir) //X축 방향성 조절할 메서드
  {
    xSpeed = dir;
  }
  
  void setDirY(float dir) //Y축 방향성 조절할 메서드
  {
    ySpeed = dir;
  }
  
  void move()             //움직임 조절할 메서드
  {
    x = x + xSpeed*4;
    if (x > width - r) {
      x = width - r;
    } else {
      if (x < 0 + r) {
        x = 0 + r;
      }
    }
    y += ySpeed*4;
    if (y > height - r) {
      y = height - r;
    } else {
      if (y < 0 + r) {
        y = 0 + r;
      }
    }
  }
  void radius () {
    r = 15;
  }
}
