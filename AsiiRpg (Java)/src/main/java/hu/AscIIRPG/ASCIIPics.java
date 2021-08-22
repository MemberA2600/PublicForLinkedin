package hu.AscIIRPG;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ASCIIPics {
    private static ASCIIPics single_instance = null;
    private Map<String,String> images;

    private ASCIIPics() throws IOException {
        ImageLoader loader = ImageLoader.getInstance();
        images = new HashMap<>();
        images.put("Title", loader.loadPicture("title.txt"));
        images.put("Shop", loader.loadPicture("shop.txt"));
        images.put("Archvile", loader.loadPicture("archvile.txt"));
        images.put("Bat", loader.loadPicture("bat.txt"));
        images.put("Dragonling", loader.loadPicture("dragonling.txt"));
        images.put("Ghoul", loader.loadPicture("ghoul.txt"));
        images.put("Lich", loader.loadPicture("lich.txt"));
        images.put("Manticore", loader.loadPicture("manticore.txt"));
        images.put("Mind Flayer", loader.loadPicture("mindflayer.txt"));
        images.put("Ogre", loader.loadPicture("ogre.txt"));
        images.put("Shapeshifter", loader.loadPicture("shapeshifter.txt"));
        images.put("Skeleton", loader.loadPicture("skeleton.txt"));
        images.put("Slime", loader.loadPicture("slime.txt"));
        images.put("Grave", loader.loadPicture("grave.txt"));
        images.put("Lich King", loader.loadPicture("lichking.txt"));
        images.put("Ganon", loader.loadPicture("ganon.txt"));
        images.put("Cyberdemon", loader.loadPicture("cyberdemon.txt"));
        images.put("Knight", loader.loadPicture("knight.txt"));

    }

    public static ASCIIPics getInstance() throws IOException {
        if (single_instance == null)
            single_instance = new ASCIIPics();

        return single_instance;
    }

    public String getImage(String key){
        return(this.images.get(key));

    }

    public String getImageLine(String key, int num){
        try{
            return(this.images.get(key).split(System.lineSeparator())[num]);
        } catch (Exception e){
            return("");
        }
    }
}
