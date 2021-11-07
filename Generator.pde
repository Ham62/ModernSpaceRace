ArrayList<Generator> generatorList = new ArrayList<Generator>(6);// only 6 gens in game


void handleGeneratorTicks(){
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
        level = 1;
        output = 100;
        generatorList.add(this);
    }

    // I have no clue if this works
    void doTick(){
        if(onTick != null && !onTick.isEmpty())
            thread(onTick);
    }

}