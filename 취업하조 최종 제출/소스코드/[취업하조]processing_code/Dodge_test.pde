import processing.serial.*;                           //아두이노 통신
Serial myPort;     

int numBullets = 20;                                  //총알 갯수
PImage photo;                                         //배경 이미지
PImage photo2;                                        //플레이어 이미지
User[] Player = new User[1];                          //사용자
Stopwatch Time;                                       //시간
Bullets[] Bullet = new Bullets[numBullets];           //총알 객체생성

void setup() {
  myPort = new Serial(this, "COM4", 9600);
  myPort.bufferUntil('\n');                           //찾고자 하는 특정 문자를 볼때까지 들어오는 데이터를 버퍼에 저장,

  size(500, 600);  
  photo = loadImage("Image3.jpg");                    //배경 이미지
  photo2 = loadImage("fly2.png");                   //플레이어 이미지
  textAlign(CENTER, CENTER);
  for (int j = 0; j < Player.length; j++) {
    Player[j] = new User();
  }
  Time = new Stopwatch();                             //시간표시
  for (int i = 0; i < numBullets; i++) {
    Bullet[i] = new Bullets();                        //numBullets 총알 갯수만큼 Bullets객체 생성
  }
}

void draw() {
  imageMode(CORNER);                                  
  image(photo, 0, 0);                                 
  imageMode(CENTER);                                  
  for (int j = 0; j < Player.length; j++) {           //플레이어 정보
    Player[j].display();
    Player[j].move();
  }
  Time.display();
  for (int i = 0; i < numBullets; i++) {              //총알 정보
    Bullet[i].display();
    Bullet[i].move();                                 
    Bullet[i].bounce();                               //장애물 바운스(좌우로 흔들림)
    for (int j = 0; j < Player.length; j++) {         //장애물에 닿으면 GameOver
      if (Bullet[i].hit(Player[j])) {
        Bullet[i].GameOver();                         //GameOver 화면 표시
        println("You Die!!!!!!!!!!!!!!");
        noLoop();                                     //중지
      }
    }
  }
}

void serialEvent(Serial myPort) {                   //수신 버퍼에 데이터가 수신된 경우 호출되는 함수
  String inString = myPort.readStringUntil('\n');
  char ch=inString.charAt(0);                         //charAt = 문자열을 검출하는 함수

  println(ch);

  for (int j = 0; j < Player.length; j++) {
    if (ch == 'a') {
      Player[j].setDirX(-0.6); 
      //x-=1;
    } else if (ch == 's') {
      Player[j].setDirY(0.6);
      //y-=1;
    } else if (ch == 'w') {
      Player[j].setDirY(-0.6);
      //x-=1;
    } else if (ch == 'd') {
      Player[j].setDirX(0.6);
      //x+=1;
    }
    //else if (ch == 'g') {
    //  Player[j].setDirX(0);
    //  //Player[j].setDirY(0);
      
    //}
    // else if (ch == 'k') {
    //  Player[j].setDirY(0);
    //  //Player[j].setirY(0);
      
    //}
  }
}

void keyPressed () //키가 눌렸을때
{
  for (int j = 0; j < Player.length; j++) {
    if (keyCode == RIGHT) //키보드 오른쪽 버튼
    {
      Player[j].setDirX(0.5);                         //setDirx(float dir) = 키보드를 눌렀을때의 속도
    } else if (keyCode == LEFT)                       //키보드 왼쪽 버튼
    {                    
      Player[j].setDirX(-0.5);
    }
    if (keyCode == UP)                                 //키보드 위버튼
    {                             
      Player[j].setDirY(-0.5);
    } else if (keyCode == DOWN)                         //키보드 아래 버튼
    {
      Player[j].setDirY(0.5);
    }
  }
}

void keyReleased() {
  for (int j = 0; j < Player.length; j++) {
    Player[j].setDirX(0); //값을 주면 방향키를 한번 눌르고 떼도 눌렀던 방향으로 계속해서 진행함.
    Player[j].setDirY(0);
  }
}
