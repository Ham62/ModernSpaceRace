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
        gen = new Generator(output, "gen" + btnText + "Tick");
        generatorList.add(this);


        this.genName = genName;
    }

    void render() {
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

void renderPannels() {
    for (GeneratorPanel p : generatorList) {
        //println("Rendered Pannel");
        p.render();
    }
}

void handlePannelTicks() {
    for (GeneratorPanel g : generatorList) {
        g.gen.doTick();
    }
}
