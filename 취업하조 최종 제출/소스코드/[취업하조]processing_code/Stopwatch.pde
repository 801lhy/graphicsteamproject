class Stopwatch {                                                  //Stopwatch
//Member
  int Time;
  int Seconds, Minutes;
//Constructor
  Stopwatch() {
    Time = 0;
  }
//Method
  void display() {
    Seconds = ((millis() - Time)/ 1000);
    Minutes = Seconds / 60;
    Seconds = Seconds % 60;
    textSize(30);
    text("Time : " + (Minutes) + ":" + (Seconds), 410, 15);
  }
}
