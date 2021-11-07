ArrayList<GeneratorPanel> generatorList = new ArrayList<GeneratorPanel>(6);// only 6 gens in game

class GeneratorPanel{
  Button btn;
  Generator gen;
  String text;

  int x,y;
  int width,height;

  public GeneratorPanel(){
    //init button
    //init size
    //int panel color

  }

  void render(){
    rect(x, y, width, height);
    btn.render();
  }

}