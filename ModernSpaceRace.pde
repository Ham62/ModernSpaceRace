
// Button
// Prog bar?
// money display
//
Button button1;
Button button2;
Button button3;
Button button4;
Button button5;
Button button6;


void setup(){
    frameRate(60);
    size(1280, 720);
    button1 = new Button("button1",64,72,100,115,"Button1");
    button2 = new Button("button2",666,72,100,115,"Button2");
    button3 = new Button("button3",64,220,100,115,"Button3");
    button4 = new Button("button4",666,220,100,115,"Button4");
    button5 = new Button("button5",64,368,100,115,"Button5");
    button6 = new Button("button6",666,368,100,115,"Button6");
    registerButton(button1);
    registerButton(button2);
    registerButton(button3);
    registerButton(button4);
    registerButton(button5);
    registerButton(button6);
    
}

void draw(){

    background(160);
    
    fill(0,150,0);
    rect(50,60,1180,600);
    
    
    fill(0,0,150);
    rect(64,72,550,115);
    
    rect(666,72,550,115);
    
    rect(64,220,550,115);
    
    rect(666,220,550,115);
    
    rect(64,368,550,115);
    
    rect(666,368,550,115);
    
    fill(150,150,0);
    rect(50, 516, 1180, 144);
    
    fill(150,0,0);
    rect(339,500, 602, 70);
    
    fill(150,0,150);
    rect(476,590,328,50);
    
    RenderButtons();
}

void Button1(){
  println("Button 1 was pressed");
}

void Button2(){
  println("Button 2 was pressed");
}

void Button3(){
  println("Button 3 was pressed");
}

void Button4(){
  println("Button 4 was pressed");
}

void Button5(){
  println("Button 5 was pressed");
}

void Button6(){
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
