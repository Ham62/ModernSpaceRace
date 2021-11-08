Button btnClosePopup;
Popup _activepopup;
int _popupTimer = 0;

// Show a popup
void showPopup(Popup popup, int iShowTime) {
    if (_activepopup == null) {
        _activepopup = popup;
        _popupTimer = iShowTime;
        registerButton(btnClosePopup);
    }
}

void showPopup(Popup popup) {
    showPopup(popup, 216000);
}
    
void hidePopup() {
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
    color activeColor;
    color activeFontColor;

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

    void closePopup() {
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
        text(sCaption, iX+10, iY+20+(iFontSz / 2.75)); // Draws text centered on button
        
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

boolean doPopupTick() {
    if (_popupTimer >= 1) {
        _popupTimer--;
        _activepopup.render();
        
        if (_popupTimer < 1)
            unregisterButton(btnClosePopup);
        return true;
    }
    return false;
}
