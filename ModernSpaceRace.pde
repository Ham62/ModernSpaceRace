
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
int baseOutput = 1;
int baseCost = 100;
int btn2Mult = 20;
int btn3Mult = 150;
int btn4Mult = 1350;
int btn5Mult = 9001;
int btn6Mult = 100000;


void setup(){
  frameRate(60);
  size(1280, 720);

  btnGen1 = new GeneratorPanel("1","Lemonaid stand",64,72,550,115, "button1", baseOutput);
  btnGen2 = new GeneratorPanel("2","ice cream truck",666,72,550,115, "button2", baseOutput*btn2Mult);
  btnGen3 = new GeneratorPanel("3","Emerald mines",64,220,550,115, "button3", baseOutput*btn3Mult);
  btnGen4 = new GeneratorPanel("4","Assless ass",666,220,550,115, "button4", baseOutput*btn4Mult);
  btnGen5 = new GeneratorPanel("5","Nukes",64,368,550,115, "button5", baseOutput*btn5Mult);
  btnGen6 = new GeneratorPanel("6","Fraud",666,368,550,115, "button6", baseOutput*btn6Mult);

}

void draw(){

  background(160);

  fill(0,150,0);
  rect(50,60,1180,600);


  renderPannels(); // dw Graham, this also renders the buttons. From GeneratorPanel.pde
  handlePannelTicks();

  fill(150,150,0);
  rect(50, 516, 1180, 144);

  // total money
  fill(150,0,0);
  rect(339,500, 602, 70);
  fill(0);
  textAlign(CENTER);
  textSize(64);
  text("$"+totalMoney,640,555);


  fill(150,0,150);
  rect(476,590,328,50);

}

// Made to be called at the top of every button code
void buttonCode(){

}

// check if we have enough money to buy an upgrade
boolean canBuyUpgrade(double upgradeCost){
  if(upgradeCost > totalMoney)
  {
    return false;
  }
  return true;
}

void button1(){
  double upgradeCost = btnGen1.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen1.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 1 was pressed");
}

void button2(){
  double upgradeCost = btnGen2.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen2.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 2 was pressed");
}

void button3(){
  double upgradeCost = btnGen3.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen3.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 3 was pressed");
}

void button4(){
  double upgradeCost = btnGen4.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen4.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 4 was pressed");
}

void button5(){
  double upgradeCost = btnGen5.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen5.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 5 was pressed");
}

void button6(){
  double upgradeCost = btnGen6.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen6.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 6 was pressed");
}

// generator 1 calls this every tick
void gen1Tick(){
  totalMoney = totalMoney + btnGen1.gen.output * btnGen1.gen.level;
}

void gen2Tick(){
  totalMoney = totalMoney + btnGen2.gen.output * btnGen2.gen.level;
}

void gen3Tick(){
  totalMoney = totalMoney + btnGen3.gen.output * btnGen3.gen.level;
}

void gen4Tick(){
  totalMoney = totalMoney + btnGen4.gen.output * btnGen4.gen.level;
}

void gen5Tick(){
  totalMoney = totalMoney + btnGen5.gen.output * btnGen5.gen.level;
}

void gen6Tick(){
  totalMoney = totalMoney + btnGen6.gen.output * btnGen6.gen.level;
}

void mouseMoved() {
  checkButtonHover(); // highlights a button when you hover over it
}

void mouseClicked() {
  // Checks if a button was clicked and exit if one was
  if (checkButtonClick())
    return;
}
