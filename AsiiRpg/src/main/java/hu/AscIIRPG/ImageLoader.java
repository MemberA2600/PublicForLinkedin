package hu.AscIIRPG;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ImageLoader {
    private static ImageLoader single_instance = null;
    private BufferedReader reader;

    private String loader(String path) throws IOException {
        reader = new BufferedReader(new InputStreamReader(this.getClass().getClassLoader().
                                    getResourceAsStream(path)));
        String temp = "";
        String line ;
        try {
            while ((line = reader.readLine()) != null) {
                temp += line + System.lineSeparator();
            }
        }catch (IOException e) {
            e.printStackTrace();
        }
        return(temp);
    }

    public String loadPicture(String path) throws IOException {
        return (this.loader(path));
    }

    private ImageLoader()
    {
    }

    public static ImageLoader getInstance()
    {
        if (single_instance == null)
            single_instance = new ImageLoader();

        return single_instance;
    }

}