import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ModernSpaceRace extends PApplet {


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
Button payWorkers;
Button btnWin;

int tick = 0;
double totalMoney = 1;
int baseOutput = 1;
int baseCost = 100;
int btn2Mult = 5;
int btn3Mult = 15;
int btn4Mult = 100;
int btn5Mult = 875;
int btn6Mult = 6000;

int introCounter = 2;
int winCounter = 0;

public void setup(){
  frameRate(60);
  
  
  // Intro slides
  PImage imgIntro = loadImage("images\\elonsad.png");
  Popup popup = new Popup("You've just made your 5th\ntweet about doge coin today\nand X Æ A-12 is getting\nhungry again. Since when\nwas life on Earth supposed\nto be this mundane?", imgIntro);
  showPopup(popup, 1800);
  
  
  btnGen1 = new GeneratorPanel("1","Emerald Mine",64,72,550,115, "button1", baseOutput);
  btnGen2 = new GeneratorPanel("2","Stolen Idea",666,72,550,115, "button2", baseOutput*btn2Mult);
  btnGen3 = new GeneratorPanel("3","Bad Subway",64,220,550,115, "button3", baseOutput*btn3Mult);
  btnGen4 = new GeneratorPanel("4","Emotion Algorithm",666,220,550,115, "button4", baseOutput*btn4Mult);
  btnGen5 = new GeneratorPanel("5","Controversial Tweet",64,368,550,115, "button5", baseOutput*btn5Mult);
  btnGen6 = new GeneratorPanel("6","Fraud",666,368,550,115, "button6", baseOutput*btn6Mult);

  payWorkers = new Button("Pay Workers",75,525,100,100,"hello");
  btnWin = new Button("Buy Space Ship - $69000000",476,590,330,50,"win");
  
  registerButton(payWorkers);
  registerButton(btnWin);
}

public void draw(){
  
  if(tick < 60)
  {
    tick++;
  }
  else
  {
    tick = 0;
  }

  background(160);

  fill(0,150,0);
  rect(50,60,1180,600);


  renderPannels(); // dw Graham, this also renders the buttons. From GeneratorPanel.pde
  
  if (doPopupTick()) 
    return;

  handlePannelTicks();

  fill(150,150,0);
  rect(50, 516, 1180, 144);

  // total money
  fill(150,0,0);
  rect(339,500, 602, 70);
  fill(0);
  textAlign(CENTER);
  textSize(64);
  text("$"+(int)totalMoney,640,555);


  fill(150,0,150);
  rect(476,590,328,50);
  
  RenderButtons();

}

// Made to be called at the top of every button code
public void buttonCode(){

}

// check if we have enough money to buy an upgrade
public boolean canBuyUpgrade(double upgradeCost){
  if(upgradeCost > totalMoney)
  {
    return false;
  }
  return true;
}

public void newBezosPopup() {
    PImage imgBezos = loadImage("images\\bezos.png");
    String[] sCaptions = new String[] {
        "*Ring* *Ring*\n\nYou pick up the phone and\nit's Jeff Bezos inquiring\nabout that succulent juicy\nbunda.",
        "Jeff Bezos:\n\"Musky!\nThe minecraft server's down\"",
        "Jeff Bezos:\n\"Which hair clinic did you\nuse... asking for a friend.\"",
        "Jeff Bezos:               8:34pm\n\n\"So you're single now,\nright? ;)\"",
        "Jeff Bezos:\n\"Ree. ree. ree ree ree.\n\nMegazoid project.\nMusk, for the last time, no.\"",
        "Jeff Bezos:\n\"Can you make a tweet about\ntesla stock again? I need to\nmake some capital.\"",
        "Jeff Bezos:\n\"You can't be a paladin,\nBranson already called it for\nthursday.\"",
        "Jeff Bezos:\n\"Do you think it would look\ncool if I wore a cowboy hat?\n\nI heard space cowboys were\ntrending on a certain site.\"",
        "Jeff Bezos:\n\"You can't sue me for\ndressing up as Picard on my\nnext space flight.\n\nI WILL DOUBLE DOG SUE\nYOU!\"",
        "Jeff Bezos:\n\"If you say my rocket only\ndoes low orbit one more\ntime, I'm going to buy your\nfavorite franchise and ruin\nit!\"",
        "Jeff Bezos:\n\"Alexa, Bing 'Living with\nbaldness...'\""
    };
    
    Popup popup = new Popup(sCaptions[(int)random(sCaptions.length)], imgBezos);
    showPopup(popup);
}

public void button1(){
  newBezosPopup();
  double upgradeCost = btnGen1.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen1.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 1 was pressed");
}

public void button2(){
  newBezosPopup();
  double upgradeCost = btnGen2.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen2.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 2 was pressed");
}

public void button3(){
  newBezosPopup();
  double upgradeCost = btnGen3.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen3.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 3 was pressed");
}

public void button4(){
  newBezosPopup();
  double upgradeCost = btnGen4.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen4.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 4 was pressed");
}

public void button5(){
  newBezosPopup();
  double upgradeCost = btnGen5.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen5.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 5 was pressed");
}

public void button6(){
  newBezosPopup();
  double upgradeCost = btnGen6.gen.getCost();
  if(canBuyUpgrade(upgradeCost))
  {
    btnGen6.gen.level++;
    totalMoney-=upgradeCost;
  }
  println("Button 6 was pressed");
}

public void win() {
    if (canBuyUpgrade(69000000)) {
        winCounter = 1;
        PImage imgWin = loadImage("images\\win.png");
        Popup popup = new Popup("\"Finally,\" you say as you let\nout a sigh of relief. \"I never\nthought I would get away\nfrom Jeff Beezoes. Anyways,\nI have returned to Mars!\"", imgWin);
        showPopup(popup);
    }
}

// generator 1 calls this every tick
public void gen1Tick(){
  totalMoney = totalMoney + (btnGen1.gen.output * btnGen1.gen.level)/60;
}

public void gen2Tick(){
  totalMoney = totalMoney + (btnGen2.gen.output * btnGen2.gen.level)/60;
}

public void gen3Tick(){
  totalMoney = totalMoney + (btnGen3.gen.output * btnGen3.gen.level)/60;
}

public void gen4Tick(){
  totalMoney = totalMoney + (btnGen4.gen.output * btnGen4.gen.level)/60;
}

public void gen5Tick(){
  totalMoney = totalMoney + (btnGen5.gen.output * btnGen5.gen.level)/60;
}

public void gen6Tick(){
  totalMoney = totalMoney + (btnGen6.gen.output * btnGen6.gen.level)/60;
}

public void mouseMoved() {
  checkButtonHover(); // highlights a button when you hover over it
}

public void mouseClicked() {
  // Checks if a button was clicked and exit if one was
  if (checkButtonClick())
    return;
}
ArrayList<Button> buttonList = new ArrayList<Button>(); // internal list of registered buttons

// Register a button to make it active
public void registerButton(Button btn) {
    // Only register button if it's not already registered
    if (!buttonList.contains(btn)) {
        buttonList.add(btn);
    }
}

// Unregister a button to hide it and make it in active
public void unregisterButton(Button btn) {
    buttonList.remove(btn);
}

final int BUTTON_PADDING = 10; // Padding around edges for auto-size text


class Button {
    String sCaption;

    RECT area; // Area of buttons

    int bWidth;
    int bHeight;

    buttonColors colors;
    buttonFont font;

    String buttonCode; // Function we call when you click a button

    // Do not modify these values, they're dymanic varaiables to handle hover animation, etc.
    int activeColor;
    int activeFontColor;

    PImage img;

    // Initalizers with various amounts of customization
    public Button(String text, int X, int Y, int bWidth, int bHeight, String buttonCode, buttonFont font_, buttonColors colors_) {
        init(text, X, Y, bWidth, bHeight, buttonCode, font_, colors_);
    }
    public Button(String text, int X, int Y, int bWidth, int bHeight, String buttonCode, buttonFont font_) {
        buttonColors colors_ = new buttonColors(color(100), color(180), color(150, 150, 255)); // default button colors
        init(text, X, Y, bWidth, bHeight, buttonCode, font_, colors_);
    }
    public Button(String text, int X, int Y, int bWidth, int bHeight, String buttonCode) {
        buttonFont font_ = new buttonFont(color(0)); // default font is variable-size black
        buttonColors colors_ = new buttonColors(color(100), color(180), color(150, 150, 255)); // default button colors
        init(text, X, Y, bWidth, bHeight, buttonCode, font_, colors_);
    }
    public Button(PImage image_, int X, int Y, int bWidth, int bHeight, String buttonCode) {
        init("", X, Y, bWidth, bHeight, buttonCode, new buttonFont(color(0)), new buttonColors(0, color(128), 0));
        this.img = image_;
    }

    public Button(PImage image_, int X, int Y, int bWidth, int bHeight, String buttonCode, buttonColors colors_) {
        init("", X, Y, bWidth, bHeight, buttonCode, new buttonFont(color(0)), colors_);
        this.img = image_;
    }

    // initalizes the button
    private void init(String text, int X, int Y, int bWidth, int bHeight, String buttonCode, buttonFont font_, buttonColors colors_)
    {
        img = null;
        this.sCaption = text;
        this.bWidth = bWidth;
        this.bHeight = bHeight;
        this.area = new RECT(X, Y, X+bWidth, Y+bHeight); //calculating button area

        this.buttonCode = buttonCode;

        this.colors = colors_;
        this.font = font_;
    }

    // renders button on screen
    public void render() {
        int iFontSz; // Stores temp font size

        // Draw background
        fill(activeColor);
        rect(area.left, area.top, bWidth, bHeight);

        // Draw font
        if (font.size < 1) {   // Auto-size text
            iFontSz = calcTextSize();
        } else {               // static-sized text
            iFontSz = font.size;
        }
        textSize(iFontSz);  // Set size of font
        textAlign(CENTER);  // Align text to centre of button
        fill(activeFontColor);      // Set font color
        text(sCaption, area.left+(bWidth/2), area.top+(bHeight/2)+(iFontSz / 2.75f)); // Draws text centered on button
        //textAlign(LEFT);    // RESETS alignment for text below

        if (img != null) {
            image(img, area.left, area.top, bWidth, bHeight);

            if (colors != null && activeColor == colors.hover) {
                fill(activeColor, 128);
                rect(area.left, area.top, bWidth, bHeight);
            }
        }
    }

    // Auto-calculate text size for variable-sized font
    private int calcTextSize() {
        int iSz = 1;
        do {
            iSz++;
            textSize(iSz);
        } while (textWidth(sCaption) < bWidth-BUTTON_PADDING && iSz < bHeight-BUTTON_PADDING); // ensure we don't overflow

        return (iSz - 1); // return iSz-1 since iSz is the overflow value
    }

    public void move(int iX, int iY, int iWid, int iHei) {
        area.left = iX;
        area.top = iY;
        area.right = iX+iWid;
        area.bottom = iY+iHei;
        bWidth = iWid; 
        bHeight = iHei;
    }
    public void move(int iX, int iY) {
        area.left = iX;
        area.top = iY;
        area.right = iX+bWidth;
        area.bottom = iY+bHeight;
    }

    // Resize the button
    public void resize(int iWid, int iHei) {
        bWidth = iWid; 
        bHeight = iHei;
        area.right = area.left+iWid;
        area.bottom = area.top+iHei;
    }

    // Check if mouse is over the button
    public boolean mouseOver() {
        if (mouseX >= area.left && mouseX <= area.right && // X bounds
            mouseY >= area.top && mouseY <= area.bottom) { // Y bounds
            return true;
        }
        return false;
    }
}

// Simple structures developed to make buttons easier to manage
class RECT {
    public int left;
    public int top;
    public int right;
    public int bottom;
    public RECT(int left_, int top_, int right_, int bottom_) {
        left = left_;
        top = top_;
        right = right_;
        bottom = bottom_;
    }
}

class buttonFont {
    public int size;
    public int c;
    // Processing doesn't allow you to do int size_ = -1
    // because the compiler sucks ass
    public buttonFont(int c_) {
        c = c_;
        size = -1;
    }
    public buttonFont(int c_, int size_) {
        c = c_;
        size = size_;
    }
}

class buttonColors {
    public int background; // normal background color
    public int hover;      // hover color
    public int click;      // clicked color
    public buttonColors(int background_, int hover_, int click_) {
        background = background_;
        hover = hover_;
        click = click_;
    }
}


// Draws all active buttons to screen
public void RenderButtons() {
    noStroke();
    for (int iB = 0; iB < buttonList.size(); iB++) {
        buttonList.get(iB).render();
    }
}

// Checks all buttons to change the color if the mouse hovers over it
public void checkButtonHover() {
    for (int iB = 0; iB < buttonList.size(); iB++) {
        if (buttonList.get(iB).colors == null)
            continue;

        if (buttonList.get(iB).mouseOver()) {
            buttonList.get(iB).activeColor = buttonList.get(iB).colors.hover;      // color when hovering
        } else {
            buttonList.get(iB).activeColor = buttonList.get(iB).colors.background; // Normal color
        }

        buttonList.get(iB).activeFontColor = buttonList.get(iB).font.c; // font is always the same color
    }
}

// Checks all buttons to see if we clicked one
public boolean checkButtonClick() {
    // Check top most buttons first so they can be layered
    for (int iB = buttonList.size()-1; iB >= 0; iB--) {
        if (buttonList.get(iB).mouseOver()) {
            if (buttonList.get(iB).colors != null)
                buttonList.get(iB).activeColor = buttonList.get(iB).colors.click; // Change color to signify click
            thread(buttonList.get(iB).buttonCode); // Execute the button code on a new thread
            return true; // Don't need to check other buttons, we found the right one
        }
    }
    return false; // no button was being clicked
}
class Generator{

    int level;
    double output;// in dollars
    String onTick = ""; //
    float base = 1;
    // need id???

    public Generator(int output, String onTick, float base){
        level = 0;
        this.output = output;
        this.onTick = onTick;
        this.base = base;
    }

    // I have no clue if this works
    public void doTick(){
        if(onTick != null && !onTick.isEmpty() && level != 0)
            thread(onTick);
    }

    public double getCost(){
        return base * Math.pow(2, level);
    }

}
ArrayList<GeneratorPanel> generatorList = new ArrayList<GeneratorPanel>(6);// only 6 gens in game

class GeneratorPanel {
    int x, y;
    int width, height;
    //String pannelText = "TEST";
    String genName;

    Button btn;

    Generator gen;

    //note you cannot change the code of a button or tick

    public GeneratorPanel(String btnText, String genName, int x, int y, int width, int height, String code, int output) {
        //init button
        //init size
        //int panel color
        // TODO: Panel color? make more customizable/dynamic??

        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;

        // Inits Button
        //change width later to be something more suitable
        btn = new Button(btnText, x, y, height, height, code);
        registerButton(btn);

        // Inits Generator
        //TODO: add update tick
        gen = new Generator(output, "gen" + btnText + "Tick", pow(Integer.parseInt(btnText), Integer.parseInt(btnText)+2));
        generatorList.add(this);


        this.genName = genName;
    }

    public void render() {
        fill(0, 0, 150);// TODO: current default, replace with image later
        rect(x, y, width, height);

        textAlign(LEFT);
        textSize(64);
        fill(255);
        textSize(calcTextSize(genName, 430, 60));
        
        text(genName, x+height, y+(height/2)-15);

        textSize(32);
        text("Current Level: " + gen.level, x+height, y+(height/2)+16);
        text("Upgrade Cost: " + gen.getCost(), x+height, y+(height/2)+48);

        btn.render();
    }

    private int calcTextSize(String sCaption, int bWidth, int bHeight) {
        int iSz = 1;
        do {
            iSz++;
            textSize(iSz);
        } while (textWidth(sCaption) < bWidth-10 && iSz < bHeight-10); // ensure we don't overflow

        return (iSz - 1); // return iSz-1 since iSz is the overflow value
    }
}

public void renderPannels() {
    for (GeneratorPanel p : generatorList) {
        //println("Rendered Pannel");
        p.render();
    }
}

public void handlePannelTicks() {
    for (GeneratorPanel g : generatorList) {
        g.gen.doTick();
    }
}
Button btnClosePopup;
Popup _activepopup;
int _popupTimer = 0;

// Show a popup
public void showPopup(Popup popup, int iShowTime) {
    if (_activepopup == null) {
        _activepopup = popup;
        _popupTimer = iShowTime;
        registerButton(btnClosePopup);
    }
}

public void showPopup(Popup popup) {
    showPopup(popup, 216000);
}
    
public void hidePopup() {
    _activepopup = null;
    _popupTimer = 0;
    unregisterButton(btnClosePopup);
    
    if (winCounter >= 1) {
        winCounter--;
        PImage imgWin = loadImage("images\\win.png");
        Popup popup = new Popup("You look around at the small\nred planet as you unzip your\npants. \"Now to do what I\ncame here to do...\"", imgWin);
        showPopup(popup);
    }
    
    if (introCounter >= 1) {
        introCounter--;
        String[] sIntros = new String[] {
            "\"I've had enough!\" you yell,\nIt is time to return to your\nhome planet of Mars!\nJust like that you set out\non your newest capitalist\nventures.",
            "You take a look in the\nmirror and see your\ndissatisfied face looking\nback."
        };
        PImage imgIntro = loadImage("images\\elonsad.png");
        Popup popup = new Popup(sIntros[introCounter], imgIntro);
        showPopup(popup, 1800);
        return;
    }
}


class Popup {
    String sCaption;
    PImage img;

    int iX, iY;
    
    int iWidth;
    int iHeight;

    // Do not modify these values, they're dymanic varaiables to handle hover animation, etc.
    int activeColor;
    int activeFontColor;

    int iFntSize;

    // Initalizers with various amounts of customization
    /*public Popup(String text, buttonFont font_, buttonColors colors_, PImage img) {
        init(text, X, Y, bWidth, bHeight, buttonCode, font_, colors_);
    }
    public Popup(String text, buttonFont font_, PImage img) {
        buttonColors colors_ = new buttonColors(color(100), color(180), color(150, 150, 255)); // default button colors
        init(text, X, Y, bWidth, bHeight, buttonCode, font_, colors_);
    }*/
    public Popup(String text, PImage img) {
        buttonFont font_ = new buttonFont(color(0)); // default font is variable-size black
        buttonColors colors_ = new buttonColors(color(100), color(180), color(150, 150, 255)); // default button colors
        init(text, font_, colors_, img);
    }

    // initalizes the button
    private void init(String text, buttonFont font_, buttonColors colors_, PImage img)
    {
        this.sCaption = text;
        this.img = img;
        
        this.iX = 340;
        this.iY = 150;
        this.iWidth = 640;
        this.iHeight = 360;
        
        if (btnClosePopup == null)
            btnClosePopup = new Button("Close", 380, 450, 250, 50, "hidePopup");
    }

    public void closePopup() {
        hidePopup();
        unregisterButton(btnClosePopup);
    }

    // renders button on screen
    public void render() {
        int iFontSz = 22; // Stores temp font size

        // Draw border
        fill(0xDF, 0xB5, 0x00);
        rect(iX-10, iY-10, iWidth+20, iHeight+20);

        // Draw background
        fill(0xFF, 0xD5, 0x00);
        rect(iX, iY, iWidth, iHeight);

        // Draw caption
        textSize(iFontSz);  // Set size of font
        textAlign(LEFT);    // RESETS alignment for text below
        fill(0x00, 0x00, 0x00);      // Set font color
        text(sCaption, iX+10, iY+20+(iFontSz / 2.75f)); // Draws text centered on button
        
        // Draw image
        image(img, iX+10+iWidth/2, iY+10, iWidth/2-20, iHeight-20);
        
        btnClosePopup.render();
    }

    // Auto-calculate text size for variable-sized font
    /*private int calcTextSize() {
        int iSz = 1;
        do {
            iSz++;
            textSize(iSz);
        } while (textWidth(sCaption) < bWidth-BUTTON_PADDING && iSz < bHeight-BUTTON_PADDING); // ensure we don't overflow

        return (iSz - 1); // return iSz-1 since iSz is the overflow value
    }*/
}

public boolean doPopupTick() {
    if (_popupTimer >= 1) {
        _popupTimer--;
        _activepopup.render();
        
        if (_popupTimer < 1)
            unregisterButton(btnClosePopup);
        return true;
    }
    return false;
}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ModernSpaceRace" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
