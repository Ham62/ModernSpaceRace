ArrayList<Button> buttonList = new ArrayList<Button>(); // internal list of registered buttons

// Register a button to make it active
void registerButton(Button btn) {
  // Only register button if it's not already registered
  if (!buttonList.contains(btn)) {
    buttonList.add(btn);
  }
}

// Unregister a button to hide it and make it in active
void unregisterButton(Button btn) {
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
  color activeColor;
  color activeFontColor;
   
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
  
  // initalizes the button
  private void init(String text, int X, int Y, int bWidth, int bHeight, String buttonCode, buttonFont font_, buttonColors colors_)
  {
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
    text(sCaption, area.left+(bWidth/2), area.top+(bHeight/2)+(iFontSz / 2.75)); // Draws text centered on button
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
    bWidth = iWid; bHeight = iHei;
  }
  public void move(int iX, int iY) {
    area.left = iX;
    area.top = iY;
    area.right = iX+bWidth;
    area.bottom = iY+bHeight;
  }
  
  // Resize the button
  public void resize(int iWid, int iHei) {
    bWidth = iWid; bHeight = iHei;
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
  public color c;
  // Processing doesn't allow you to do int size_ = -1 
  // because the compiler sucks ass
  public buttonFont(color c_) {
    c = c_;
    size = -1;
  }
  public buttonFont(color c_, int size_) {
    c = c_;
    size = size_;
  }
}

class buttonColors {
  public color background; // normal background color
  public color hover;      // hover color
  public color click;      // clicked color
  public buttonColors(color background_, color hover_, color click_) {
    background = background_;
    hover = hover_;
    click = click_;
  }
}


// Draws all active buttons to screen
void RenderButtons() {
  noStroke();
  for (int iB = 0; iB < buttonList.size(); iB++) {
    buttonList.get(iB).render();
  }
}

// Checks all buttons to change the color if the mouse hovers over it
void checkButtonHover() {
  for (int iB = 0; iB < buttonList.size(); iB++) {
    if (buttonList.get(iB).mouseOver()) {
      buttonList.get(iB).activeColor = buttonList.get(iB).colors.hover;      // color when hovering
    } else {
      buttonList.get(iB).activeColor = buttonList.get(iB).colors.background; // Normal color
    }
    
    buttonList.get(iB).activeFontColor = buttonList.get(iB).font.c; // font is always the same color
  }

}

// Checks all buttons to see if we clicked one
boolean checkButtonClick() {
  // Check top most buttons first so they can be layered
  for (int iB = buttonList.size()-1; iB >= 0; iB--) {
    if (buttonList.get(iB).mouseOver()) {
      buttonList.get(iB).activeColor = buttonList.get(iB).colors.click; // Change color to signify click
      thread(buttonList.get(iB).buttonCode); // Execute the button code on a new thread
      return true; // Don't need to check other buttons, we found the right one
    }
  }
  return false; // no button was being clicked
}
