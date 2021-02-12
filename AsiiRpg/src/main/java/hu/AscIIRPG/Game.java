package hu.AscIIRPG;

import com.sun.jdi.InvalidTypeException;
import hu.AscIIRPG.item.ItemList;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.security.spec.ECField;
import java.util.Arrays;

public class Game {
    private static Game single_instance = null;

    private ASCIIPics Pics;
    private String name;
    private BufferedReader reader;
    private Dungeon dungeon;
    private Hero hero;
    private Boolean[] conditions;
    protected Boolean playAgain;
    protected WeaponList Weapons;
    protected ArmorList Armors;
    protected ItemList Items;
    protected boolean newHero;

    private String getReaderLine() throws IOException {
        reader = new BufferedReader(new InputStreamReader(System.in));
        return(reader.readLine()) ;
    }

    private String WelcomeScreen() throws IOException {

        System.out.println(Pics.getImage("Title"));
        System.out.print("Welcome to my new CRPG style retro RPG! Hope you will enjoy!" + System.lineSeparator() +
        "Please enter your name and let the hammer fall!> ");
        return(getReaderLine());
    }

    private int[] askForSize() throws IOException {
        int[] size = new int[2];
        boolean success=false;
        while (success==false) {
            System.out.print("Add me the dimensions of the dungeon! (format: ___x___) >");
            try
            {
                String inp = getReaderLine().toLowerCase();
                if (inp.equals(""))
                {
                    size[0] = 30;
                    size[1] = 20;
                    break;
                }
                else {
                    size[0] = Integer.parseInt(inp.split("x")[0]);
                    size[1] = Integer.parseInt(inp.split("x")[1]);
                    if (size[0] % 2 == 0 && size[1] % 2 == 0) {
                        if (size[0] > 15 && size[1] > 15) {
                            success = true;
                        } else {
                            System.out.println("Please set a size of 16x16 at least!");

                        }
                    } else {
                        System.out.println("Please use even numbers! Try again!");
                    }

                }
            }
            catch (Exception e)
            {
                System.out.println("Unknown format! Try again!");
            }

        }
        return(size);
    }

    private void setConditionsToFalse(){

        for (int x=0; x<conditions.length; x++)
            conditions[x]=false;
    }

    private Game() throws Exception {
        Pics =  ASCIIPics.getInstance();
        name = WelcomeScreen();
        dungeon = Dungeon.getInstance(askForSize());
        conditions = new Boolean[4];
        playAgain = true;
        Weapons = WeaponList.getInstance();
        Armors = ArmorList.getInstance();
        Items = ItemList.getInstance();
        newHero = false;
        hero = Hero.getInstance(Weapons, Armors, Items);

        while(playAgain == true) {
            setConditionsToFalse();
            playAgain = false;
            while (Arrays.asList(conditions).contains(false)) {
                dungeon.generateNewDungeon(hero);
                conditions[0] = dungeon.contains("HERO");
                conditions[1] = dungeon.contains("SHOP");
                conditions[2] = dungeon.contains("BOSS");
                try {
                    conditions[3] = dungeon.isBossSurrounded();
                } catch (Exception e) {
                    continue;
                }

            }

            GameController controller = new GameController (hero, dungeon, this, name, Pics);

            if (newHero == true) {
                hero.setToDefault();
                newHero = false;
            }
        }
    }

    public static Game getInstance() throws Exception {
        if (single_instance == null)
            single_instance = new Game();

        return single_instance;
    }
}

