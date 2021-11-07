ArrayList<Generator> generatorList = new ArrayList<Generator>(6);// only 6 gens in game


void handleGeneratorTick(){
    for(Generator g : generatorList){
        g.doTick();
    }

}

class Generator{

    int level;
    float output;// in dollars
    String onTick; //
    // need id???


    public Generator(){

    }

    // I have no clue if this works
    void doTick(){
        thread(onTick);
    }

}