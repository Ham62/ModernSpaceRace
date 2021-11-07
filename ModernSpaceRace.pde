
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

  btnGen1 = new GeneratorPanel("1",64,72,550,115, "button1", 1);
  btnGen2 = new GeneratorPanel("2",666,72,550,115, "button2", 20);
  btnGen3 = new GeneratorPanel("3",64,220,550,115, "button3", 150);
  btnGen4 = new GeneratorPanel("4",666,220,550,115, "button4", 1350);
  btnGen5 = new GeneratorPanel("5",64,368,550,115, "button5", 9001);
  btnGen6 = new GeneratorPanel("6",666,368,550,115, "button6", 100000);

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
boolean canBuyUpgrade(int upgradeCost){
  if(upgradeCost > totalMoney)
  {
    return false;
  }
  return true;
}

void button1(){
  int upgradeCost = btnGen1.gen.level * 100;
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen1.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 1 was pressed");
}

// generator 1 calls this every tick
void gen1Tick(){
  totalMoney = totalMoney + btnGen1.gen.output * btnGen1.gen.level;
}

void mouseMoved() {
  checkButtonHover(); // highlights a button when you hover over it
}

void mouseClicked() {
  // Checks if a button was clicked and exit if one was
  if (checkButtonClick())
    return;
}
