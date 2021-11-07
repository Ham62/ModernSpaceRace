ArrayList<GeneratorPanel> generatorList = new ArrayList<GeneratorPanel>(6);// only 6 gens in game

class GeneratorPanel{
  int x,y;
  int width,height;
  String pannelText;

  Button btn;

  Generator gen;

  //note you cannot change the code of a button or tick

  public GeneratorPanel(String btnText, int x, int y, int width, int height, String code(GeneratorPanel)){
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
    btn = new Button(btnText,x,y,100,height,code);
    registerButton(btn);

    // Inits Generator
    //TODO: add update tick
    gen = new Generator();
    generatorList.add(this);

  }

  void render(){
    fill(0,0,150);// TODO: current default, replace with image later
    rect(x, y, width, height);
    btn.render();
  }

}

void renderPannels(){
    for(GeneratorPanel p : generatorList){
        //println("Rendered Pannel");
        p.render();
    }
}

void handlePannelTicks(){
    for(GeneratorPanel g : generatorList){
        g.gen.doTick();
    }
}