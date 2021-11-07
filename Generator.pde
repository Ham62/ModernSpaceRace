class Generator{

    int level;
    int output;// in dollars
    String onTick = ""; //
    // need id???

    public Generator(){
        level = 0;
        output = 100;
    }

    // I have no clue if this works
    void doTick(){
        if(onTick != null && !onTick.isEmpty())
            thread(onTick);
    }

}
