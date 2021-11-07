class Generator{

    int level;
    int output;// in dollars
    String onTick = ""; //
    // need id???

    public Generator(int output, String onTick){
        level = 0;
        this.output = output;
        this.onTick = onTick;
    }

    // I have no clue if this works
    void doTick(){
        if(onTick != null && !onTick.isEmpty() && level != 0)
            thread(onTick);
    }

}
