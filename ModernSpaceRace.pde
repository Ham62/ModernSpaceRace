
// Button
// Prog bar?
// money display
//
// Stuart - "Dont put my name on it please!"

GeneratorPanel btnGen1;
GeneratorPanel btnGen2;
GeneratorPanel btnGen3;
GeneratorPanel btnGen4;
GeneratorPanel btnGen5;
GeneratorPanel btnGen6;


int totalMoney = 0;


void setup(){
  frameRate(60);
  size(1280, 720);

  btnGen1 = new GeneratorPanel();
  btnGen2 = new GeneratorPanel();
  btnGen3 = new GeneratorPanel();
  btnGen4 = new GeneratorPanel();
  btnGen5 = new GeneratorPanel();
  btnGen6 = new GeneratorPanel();

  btnGen1.btn = new Button("BUY\nElrc Tchnlogy",64,72,100,115,"Button1");
  btnGen2.btn = new Button("button2",666,72,100,115,"Button2");
  btnGen3.btn = new Button("button3",64,220,100,115,"Button3");
  btnGen4.btn = new Button("button4",666,220,100,115,"Button4");
  btnGen5.btn = new Button("button5",64,368,100,115,"Button5");
  btnGen6.btn = new Button("button6",666,368,100,115,"Button6");

  registerButton(btnGen1.btn);
  registerButton(btnGen2.btn);
  registerButton(btnGen3.btn);
  registerButton(btnGen4.btn);
  registerButton(btnGen5.btn);
  registerButton(btnGen6.btn);

}

void draw(){

  background(160);

  fill(0,150,0);
  rect(50,60,1180,600);

  fill(0,0,150);

  // Button Rects
{
  // button 1
  rect(64,72,550,115);

  // button 2
  rect(666,72,550,115);

  // button 3
  rect(64,220,550,115);

  // button 4
  rect(666,220,550,115);

  // button 5
  rect(64,368,550,115);

  // button 6
  rect(666,368,550,115);

  fill(150,150,0);
  rect(50, 516, 1180, 144);
}

  // total money
  fill(150,0,0);
  rect(339,500, 602, 70);
  fill(0);
  textAlign(CENTER);
  textSize(64);
  text("$"+totalMoney,640,555);



  fill(150,0,150);
  rect(476,590,328,50);

  //RenderButtons();
}

void Button1(){
  totalMoney+= 1000;
  println("Button 1 was pressed");
}

void Button2(){
  totalMoney+= 1000;
  println("Button 2 was pressed");
}

void Button3(){
  totalMoney+= 1000;
  println("Button 3 was pressed");
}

void Button4(){
  totalMoney+= 1000;
  println("Button 4 was pressed");
}

void Button5(){
  totalMoney+= 1000;
  println("Button 5 was pressed");
}

void Button6(){
  totalMoney+= 1000;
  println("Button 6 was pressed");
}

void mouseMoved() {
  checkButtonHover(); // highlights a button when you hover over it
}

void mouseClicked() {
  // Checks if a button was clicked and exit if one was
  if (checkButtonClick())
    return;
}
