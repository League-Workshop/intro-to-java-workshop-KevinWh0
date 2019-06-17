int foodX = 100;
int foodY = 20;
int foodFallspeed = 1;



boolean go = false;
boolean opt1 = true;
int FishX = 100;
int FishSpeed = 10;
int score = 0;
int mouthSize = 10;
int FishY;
int lastMouse[] = {1, 1};
boolean mouthOpen = false;
void setup() {
  //size();
  fullScreen();
  FishX = width-200;
}


void drawFish(int X) {

  noStroke();
  fill(255, 255, 255);
  ellipse(X-17, FishY-17, 20, 20); //back side eye
  fill(255, 200, 88);
  ellipse(X, FishY, score+90, score+50); //body
  triangle(X+30, FishY, X+70, FishY+30, X+70, FishY-30); //tail
  stroke(0);
  triangle(X, FishY, X+15, FishY+10, X+15, FishY-10); //side fin
  noStroke();
  fill(255, 200, 88);
  ellipse(X, FishY, 15, 15); //side fin cover
  noStroke();
  fill(255, 255, 255);
  ellipse(X-25, FishY-15, 20, 20); //front eye
  fill(0, 0, 0);
  ellipse(X-25, FishY-15, 5, 5); //pupil
  fill(141, 233, 237);
  if(mouthOpen == true){
    ellipse(X-45, FishY, 45, 45); //mouth
  }else{
    ellipse(X-45, FishY, 25, 25); //mouth
  }
}
void checkCatch(int x, int y) {
  /*
     if(x > mouseX && x < mouseX+70){
   if(y > mouseY-17 && y < mouseY+30){
   score++;
   foodY = 20; //if the food was eaten, make more food fall from the top
   foodX = (int) random(width-20);
   }
   }
   else if (foodY > height && score > 0){
   score--;
   foodY = 0;
   foodX = round(random(width-250));
   }
   fill(255,0,0,100);
   rect(x,y,x+30,y+17);*/

  if (x-mouthSize < FishX && x+mouthSize > FishX && y-mouthSize < FishY && y+mouthSize > FishY) {
    mouthOpen = true;
    score++;
    foodY = 20; //if the food was eaten, make more food fall from the top
    foodX = (int) random(width-250);
  } else if (foodY > height && score > 0) {
    score--;
    foodY = 0;
    foodX = round(random(width-250));
  }
}

void draw() {
  background(0);
  fill(255);
  text("Score: "+ score/* + "GO: "+go*/, 10, 10);
  ellipse(foodX, foodY, 10, 10);

  if (go == false) {
    FishY = mouseY;
    //lastMouse[0] = mouseX;
    lastMouse[1] = mouseY;
  } else {
    if(opt1 == true){
      FishY = lastMouse[1];
    }
    FishX-=FishSpeed;
    if (FishX < 0) {
      go = false;
      FishX = width-200;
    }
  }

  foodY+=foodFallspeed;
  drawFish(FishX);
    mouthOpen = false;

  checkCatch(foodX, foodY);
  if (mousePressed) {
    go = true;
  }
}
