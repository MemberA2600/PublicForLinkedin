package hu.AscIIRPG;

import java.io.IOException;
import java.util.ArrayList;

public class Dices {
    private static Dices single_instance = null;
    String[] dicePic;

    private Dices() throws IOException {
        ImageLoader loader = ImageLoader.getInstance();
        this.dicePic = loader.loadPicture("dices.txt").split(System.lineSeparator());
    }

    public static Dices getInstance() throws IOException {
        if (single_instance == null)
            single_instance = new Dices();

        return single_instance;
    }

    public String getDiceLine(int dice, int line){
        return(dicePic[dice*5+line]);
    }
}
