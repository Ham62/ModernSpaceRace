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
    void doTick(){
        if(onTick != null && !onTick.isEmpty() && level != 0)
            thread(onTick);
    }

    double getCost(){
        return base * Math.pow(2, level);
    }

}
