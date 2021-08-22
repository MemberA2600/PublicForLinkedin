package hu.AscIIRPG;

import com.sun.source.tree.SynchronizedTree;
import com.sun.source.tree.Tree;
import hu.AscIIRPG.Monster.*;
import hu.AscIIRPG.item.Bomb;
import hu.AscIIRPG.item.Item;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.annotation.Target;
import java.nio.channels.ScatteringByteChannel;
import java.util.*;

public class GameController {
    private String name;
    private Hero hero;
    private Dungeon dungeon;
    private Game game;
    private BufferedReader reader;
    private Integer[] lastPoz;

    protected int gameView;
    private boolean gameEnded;
    private String theThingYouTouched;
    private Random random;
    private List<String> alreadyFound;

    protected String message;
    private int bombX;
    private int bombY;
    public int bombTick;
    private List<Monster> Monsters;

    private ASCIIPics Pics;
    private Dices dices;
    private boolean fastMode;


    private String getReaderLine() throws IOException {
        reader = new BufferedReader(new InputStreamReader(System.in));
        return (reader.readLine());
    }

    public Hero gcHero() {
        return this.hero;
    }

    public void addToMessage(String t){
        if (message == ""){
            message = t;
        } else {
            message = message + System.lineSeparator() + t;
        }
    }

    public String getName(){
        return this.name;
    }

    public List<Monster> getMonsters(){
        return this.Monsters;
    }

    public GameController(Hero hero, Dungeon dungeon, Game game, String name, ASCIIPics Pics) throws IOException, InterruptedException {
        this.alreadyFound = new ArrayList<>();
        this.hero = hero;
        this.dungeon = dungeon;
        this.game = game;
        this.message = "";
        this.Pics = Pics;
        fastMode = false;
        alreadyFound.add(this.hero.getCurrentWeapon().getName());
        alreadyFound.add(this.hero.getCurrentArmor().getName());
        for (String w : this.hero.getInventory().get("Weapon")){
            alreadyFound.add(w);
        }
        for (String a : this.hero.getInventory().get("Armor")){
            alreadyFound.add(a);
        }

        lastPoz = new Integer[2];
        gameView = 0; // 0: Map view, 1: Fight view; 2: Shop view 3: Defeat 4: Victory
        gameEnded = false;
        random = new Random();
        game.Items.setThings(hero, this);
        Monsters = new ArrayList<>();
        this.name = name;
        dices = Dices.getInstance();

        while (gameEnded == false) {
            if (hero.getLevel()<10) levelUp();

            if (gameView == 0) {
                dungeonTurn(name);
            } else if (gameView == 1) {
                fightTurn(name);
            } else if (gameView == 2){
                shopTurn(name);
            }
            else if (gameView == 3){
                deadTurn(name);
            } else {
                winTurn(name);
            }
        }
    }

    private void levelUp(){
        if (hero.getEXP() > calculateEXPNeededForNextLevel()-1){
            int tempMaxHP = calculateMaxHP();
            hero.setEXP(hero.getEXP()-calculateEXPNeededForNextLevel());
            hero.setLevel(hero.getLevel()+1);
            String m = "You achieved the next level!";
            hero.setHP(hero.getHP() + (calculateMaxHP()-tempMaxHP));


            if (message == "") {
                this.message = m;
            } else {
                this.message = message + System.lineSeparator() + m;
            }
        }
    }

    private String[] getCommandAndArguments(String command) {
        return (command.split(" "));
    }


    private void dungeonParser(String command) {
        try {
            String com = parser(command)[0];
            String arg = parser(command)[1];

            switch (com) {
                case ("go"):
                    move(arg);
                    break;
                case ("use"):
                    if (arg == "") {
                        message = "This command needs an item name as argument!";
                    } else {
                        useItemOnMap(arg);
                    }
                    break;
                case ("list"):
                    listInventory();
                    break;
                /*
                CHEATS FOR TESTING

                case ("vision"):
                    dungeon.setVision();
                    break;
                case ("addkey"):
                    hero.getInventory().get("Item").add("Key");
                    break;
                case ("addbomb"):
                    hero.getInventory().get("Item").add("Bomb");
                    break;
                case ("oni"):
                    hero.getInventory().get("Item").add("Blood Of The Oni");
                    break;
                case ("goshop"):
                    gameView = 2;
                    break;
                case ("money"):
                    hero.setMoney(hero.getMoney() + 1000);
                    break;
                case ("fight"):
                    prepareForBattle(false);
                    break;
                case ("boss"):
                    prepareForBattle(true);
                    break;
                case("additem"):
                    int chance = random.nextInt(5);
                    if (chance == 0) {
                        randomWeapon();
                    } else if (chance == 1) {
                        randomArmor();
                    } else {
                        randomItem();
                    }
                    break;

                case("dead"):
                    hero.setHP(0);
                    break;
                case("won"):
                    gameView = 4;
                    break;
                case("exp"):
                    hero.setEXP(hero.getHP()+calculateEXPNeededForNextLevel());
                    break;

                case("test"):
                    hero.getInventory().get("Item").add("Bomb");
                    hero.setLevel(10);
                    hero.setHP(calculateMaxHP());
                    randomItem();
                    randomItem();
                    randomItem();
                    randomItem();
                    randomItem();
                    randomItem();
                    randomItem();
                    randomItem();
                    randomItem();
                    randomWeapon();
                    randomWeapon();
                    randomArmor();
                    randomArmor();
                    break;

                case("remove"):
                    dungeon.testRemoveAllMonster();
                    break;

                */
                default:
                    message = "Unknown command!";
            }
        } catch (Exception e) {
            message = "Illegal syntax!";
            e.printStackTrace();

        }

    }


    private String[] parser(String command) {
        String[] thingsToDo = getCommandAndArguments(command.toLowerCase());
        String com = thingsToDo[0];
        String arg = "";
        if (Arrays.asList(thingsToDo).size() > 1) {
            for (int x = 1; x < thingsToDo.length; x++) {
                arg = arg + thingsToDo[x].substring(0, 1).toUpperCase() + thingsToDo[x].substring(1).toLowerCase() + " ";
            }
            arg = arg.substring(0, arg.length() - 1).trim();
        }

        return (new String[]{com, arg});
    }


    public void setBomb() {
        bombX = hero.getPosition()[0];
        bombY = hero.getPosition()[1];
        bombTick = 3;
    }


    private void useItemOnMap(String item) {
        if (hero.getInventory().get("Weapon").contains(item)) {
            hero.getInventory().get("Weapon").remove(item);
            hero.getInventory().get("Weapon").add(hero.getCurrentWeapon().getName());
            hero.setCurrentWeapon(hero.getWeaponList().getWeaponByName(item));
        } else if (hero.getInventory().get("Armor").contains(item)) {
            hero.getInventory().get("Armor").remove(item);
            hero.getInventory().get("Armor").add(hero.getCurrentArmor().getName());
            hero.setCurrentArmor(hero.getArmorList().getArmorByName(item));
        } else if (hero.getInventory().get("Item").contains(item)) {
            if (hero.getItemList().getItemByName(item).canBeUsedOnMap() == false) {
                message = "Cannot use this item on the map!";
            } else {
                hero.getInventory().get("Item").remove(item);
                message = hero.getItemList().getItemByName(item).effectOnHero(this.hero);
                if (message == null) message = hero.getItemList().getItemByName(item).effectWithoutTarget();
            }
        } else {
            message = "Item was not found.";
        }
    }

    private void listInventory() {
        message = "Your inventory has:" + System.lineSeparator();
        if (hero.getInventory().get("Weapon").isEmpty() == true) {
            message = message + "The inventory has no weapons!" + System.lineSeparator();
        } else {
            int num = 1;
            message = message + "--Weapons:" + System.lineSeparator();
            for (String item : hero.getInventory().get("Weapon")) {
                message = message + String.format("%d.: %s", num, item) + System.lineSeparator();
                num++;
            }
        }

        if (hero.getInventory().get("Armor").isEmpty() == true) {
            message = message + "The inventory has no armors!" + System.lineSeparator();
        } else {
            int num = 1;
            message = message + "--Armors:" + System.lineSeparator();
            for (String item : hero.getInventory().get("Armor")) {
                message = message + String.format("%d.: %s", num, item) + System.lineSeparator();
                num++;
            }
        }
        if (hero.getInventory().get("Item").isEmpty() == true) {
            message = message + "The inventory has no items!" + System.lineSeparator();
        } else {
            int num = 1;
            message = message + "--Items:" + System.lineSeparator();
            for (String item : hero.getInventory().get("Item")) {
                message = message + String.format("%d.: %s", num, item);
                if (hero.getItemList().getItemByName(item).canBeUsedOnMap() == false) {
                    message = message + " (Combat only!)";
                } else if (hero.getItemList().getItemByName(item).isCanBeUsedDuringBattle() == false)
                {
                    message = message + " (Map only!)";
                }
                message = message + System.lineSeparator();
                num++;
            }
        }
    }

    public void setVision() {
        dungeon.setVision();
    }

    private void checkForBomb() {
        if (bombTick > 2) {


            if (bombX != hero.getPosition()[0] || bombY != hero.getPosition()[1]) {
                dungeon.setMapTile(bombX, bombY, "BOMB");
            }
        } else if (bombTick == 2) {
            dungeon.someBoom(bombX, bombY, this);
        } else {
            dungeon.removeBoom(bombX, bombY, this);
            bombY = -1;
            bombX = -1;
        }

        bombTick--;
    }

    private void dungeonTurn(String name) throws IOException {
        if (hero.getHP()<1){
            gameView = 3;
            return;
        }

        dungeon.openBossDoorIfCan();
        if (bombTick > 0) checkForBomb();
        dungeon.drawMe();
        printStats();
        System.out.println("Acceptable commands: go {up, down, left, right}, use {item}, list");
        System.out.println("-------------------------------------------------------------------");
        if (this.message != "") System.out.println(message);
        System.out.print(name + ", what do you do?> ");
        this.message = "";
        dungeonParser(getReaderLine());
    }

    private void printStats() {
        System.out.println(String.format("HP: %d/%d ARMOR VALUE: %d DAMAGE: %d GOLD: %d SPEED: %d", hero.getHP(), calculateMaxHP(), calculateArmor(), calculateDamage(), hero.getMoney(), calculateSpeed()));
        System.out.println(String.format("LEVEL: %d EXP: %d (next level: %d)", hero.getLevel(), hero.getEXP(), calculateEXPNeededForNextLevel()));
        System.out.println(String.format("WEAPON: %s ARMOR: %s", hero.getCurrentWeapon().getName(), hero.getCurrentArmor().getName()));
    }

    private void move(String arg) {
        arg = arg.toLowerCase();
        switch (arg) {
            case ("up"):
                checkIfHeroCanMove(-2, 0);
                break;
            case ("down"):
                checkIfHeroCanMove(2, 0);
                break;
            case ("left"):
                checkIfHeroCanMove(0, -2);
                break;
            case ("right"):
                checkIfHeroCanMove(0, 2);
                break;
            default:
                message = "Unknown argument for 'go'!";
        }

    }

    private void checkIfHeroCanMove(int x, int y) {

        String between = dungeon.getMapTile(hero.getPosition()[0] + (x / 2), hero.getPosition()[1] + (y / 2));
        String temp = dungeon.getMapTile(hero.getPosition()[0] + x, hero.getPosition()[1] + y);
        //System.out.println(temp);
        if (temp == "####" || between == "####") {
            this.message = "You smash your face into the wall!";
        } else if (between == "DOOR") {
            if (hero.getInventory().get("Item").contains("Key")) {
                if (dungeon.getMapTile(hero.getPosition()[0] + x, hero.getPosition()[1] + y).equals("BOSS")) {
                    message = "This door can be only opened from the inside.";
                } else {
                    hero.getInventory().get("Item").remove("Key");
                    dungeon.setMapTile(hero.getPosition()[0] + x / 2, hero.getPosition()[1] + y / 2, "    ");
                    doMove(x, y, temp);
                }
            } else {
                message = "Door is locked.";
            }
        } else {
            doMove(x, y, temp);
        }
    }

    private void doMove(int x, int y, String temp) {
        lastPoz[0] = hero.getPosition()[0];
        lastPoz[1] = hero.getPosition()[1];
        hero.setPosition(hero.getPosition()[0] + x, hero.getPosition()[1] + y);
        if (this.theThingYouTouched == "SHOP") {
            dungeon.setMapTile(lastPoz[0], lastPoz[1], "SHOP");
        } else if (lastPoz[0] == bombX && lastPoz[1] == bombY) {
            dungeon.setMapTile(lastPoz[0], lastPoz[1], "BOMB");
        } else {
            dungeon.setMapTile(lastPoz[0], lastPoz[1], "    ");
        }
        this.theThingYouTouched = temp;
        if (theThingYouTouched.equals("SHOP")) gameView = 2;
        if (theThingYouTouched.equals("!!!!")) prepareForBattle(false);
        if (theThingYouTouched.equals("BOSS")) prepareForBattle(true);


        dungeon.setMapTile(hero.getPosition()[0], hero.getPosition()[1], "HERO");
        isThereAnyAction();


    }

    private void prepareForBattle(boolean bossBattle) {
        gameView = 1;
        this.fastMode = false;
        Monsters.clear();
        if (bossBattle == true) {
            int chance = random.nextInt(3);
            switch (chance) {
                case(0):
                    Monsters.add(new CyberDemon("Cyberdemon", 400, 13, 0.40, 4, 3, true, this.hero, this));
                    break;
                case(1):
                    Monsters.add(new LichKing("Lich King", 190, 12, 0.30, 3, 4, true, this.hero, this));
                    break;
                case(2):
                    Monsters.add(new Ganon("Ganon", 290, 16, 0.65, 6, 5, true, this.hero, this));
                    break;
                default:
                    break;
            }
        } else {
            while (true) {
                for (int x = 0; x < 3; x++) {
                    summon();
                }
                int levels = 0;
                for (Monster mon : Monsters){
                    levels+=mon.getLevel();
                }
                if (levels>hero.getLevel()*2 || Monsters.size()>hero.getLevel()) Monsters.clear();
                if (Monsters.size() > 0) break;
            }
            Map<String, Integer> writeOut = new HashMap<>();

            for (Monster mon : Monsters) {
                if (writeOut.containsKey(mon.getName()) == false) {
                    writeOut.put(mon.getName(), 1);
                } else
                {
                    int temp = writeOut.get(mon.getName()) ;
                    temp++;
                    writeOut.remove(mon.getName());
                    writeOut.put(mon.getName(), temp);
                }
            }

            String s = "";
            for (String key : writeOut.keySet()){
                String plural = "";
                if (writeOut.get(key)>1) plural = s;
                s = s + writeOut.get(key) + " " + key + ", ";
            }
            this.message = s + "\b\b appeared!";

        }


    }

    public void summon(){
        int chance = random.nextInt((hero.getLevel() * 4) + 50);
        if (chance < 10) {
            //
        } else if (chance < 20) {
            Monsters.add(new Skeleton("Skeleton", 25, 3, 0.05, 0, 3, false, this.hero, this));
        } else if (chance < 30) {
            Monsters.add(new Bat("Bat", 10, 1, 0.02, 0, 10, false, this.hero, this));
        } else if (chance < 40) {
            Monsters.add(new Slime("Slime", 70, 2, 0.02, 10, 3, false, this.hero, this));
        } else if (chance < 47) {
            Monsters.add(new Ghoul("Ghoul", 35, 5, 0.1, 0, 5, false, this.hero, this));
        } else if (chance < 54) {
            Monsters.add(new Ogre("Ogre", 130, 13, 0.20, 2, 5, false, this.hero, this));
        } else if (chance < 61) {
            Monsters.add(new Shapeshifter("Shapeshifter", 140, 5, 0.05, 2, 4, false, this.hero, this));
        } else if (chance < 68) {
            Monsters.add(new Manticore("Manticore", 200, 10, 0.21, 7, 4, false, this.hero, this));
        } else if (chance < 69) {
            Monsters.add(new MindFlayer("Mind Flayer", 160, 11, 0.60, 3, 7, false, this.hero, this));
        } else if (chance < 80) {
            Monsters.add(new Lich("Lich", 130, 11, 0.35, 3, 8, false, this.hero, this));
        } else if (chance < 85) {
            Monsters.add(new Dragonling("Dragonling", 280, 12, 0.35, 9, 6, false, this.hero, this));
        } else {
            Monsters.add(new Archvile("Archvile", 190, 9, 0.40, 1, 10, false, this.hero, this));
        }
    }

    private void decreaseTicks(){
        if (hero.getBuffImmunityTick()==true) hero.Immunity();


        if (hero.getSlowedTick() == true) hero.decSlowedTick();
        if (hero.getBerzerkTick() == true) {
            hero.decBerzerkTick();
            hero.setHP(hero.getHP()-random.nextInt((int) Math.round(hero.getHP()*0.03))+1);
        }
        if (hero.getBuffImmunityTick() == true) hero.decBuffImmunityTick();
        if (hero.getStunnedTick() == true) hero.decStunnedTick();
        if (hero.getPoisonedTick() == true) {
            hero.decPoisonedTick();
            int value = hero.getHP()-random.nextInt((int) Math.round(hero.getHP()*0.05))+1;
            hero.setHP(value);
        }
        for (Monster mon : Monsters){
            if (mon.getBerzerkTick()==true) mon.Immunity();

            if (mon.getSlowedTick() == true) mon.decSlowedTick();
            if (mon.getBerzerkTick() == true) {
                mon.decBerzerkTick();
                mon.setCurrentHP(mon.getCurrentHP()-random.nextInt((int) Math.round(mon.getCurrentHP()*0.03))+1);
            }
            if (mon.getBuffImmunityTick() == true) mon.decBuffImmunityTick();
            if (mon.getStunnedTick() == true) mon.decStunnedTick();
            if (mon.getPoisonedTick() == true) {
                mon.decPoisonedTick();
                mon.setCurrentHP(mon.getCurrentHP()-random.nextInt((int) Math.round(mon.getCurrentHP()*0.05))+1);

            }
        }
    }

    private void isThereAnyAction() {
        switch (theThingYouTouched) {
            case ("    "):
                break;
            case ("TRAP"):
                int damage = random.nextInt(30 - hero.getCurrentArmor().getProtection()) + 1;
                if (damage < 1) damage = 1;
                hero.setHP(hero.getHP() - damage);
                message = String.format("You were caught by a trap! It took %d health!", damage);
                break;
            case ("LOOT"):
                getRandomItem();
        }
    }

    public void getRandomItem(){
        int chance = random.nextInt(101);
        if (chance < 20) {
            int money = random.nextInt(46) + 5;
            hero.setMoney(hero.getMoney() + money);
            addToMessage(String.format("You found %d Gold!", money));
        } else if (chance < 45) {
            addToMessage(String.format("You just found some garbage!"));
        } else if (chance < 60) {
            randomWeapon();
        } else if (chance < 75) {
            randomArmor();
        } else {
            randomItem();
        }
    }

    public void getRandomGoodness(String name)
    {

        if (name.equals("Bat") || name.equals("Slime") || name.equals("Dragonling") || name.equals("Manticore") ||
                name == "Bat" || name =="Slime" || name == "DragonLing" || name == "Manticore") return;


        int chance = random.nextInt(7);
        if (chance == 0) {
            randomWeapon();
        } else if (chance == 1) {
            randomArmor();
        } else if (chance > 1 && chance<4) {
            randomItem();
        }  else {
            int money = random.nextInt(46) + 5;
            hero.setMoney(hero.getMoney() + money);
            addToMessage(String.format("You found %d Gold!", money));
        }
    }

    private void randomWeapon() {
        while (true) {

            int num = random.nextInt(hero.getLevel()*3);
            if (num>hero.getWeaponList().getWeapons().size()-1) continue;

            Weapon tempWeapon = hero.getWeaponList().getWeapons().get(num);
            if (tempWeapon.getOnlyOne() == true) {
                if (alreadyFound.contains(tempWeapon.getName())) {
                    continue;
                } else {
                    int noLegendaryPlease = random.nextInt(101);
                    if (noLegendaryPlease>hero.getLevel()*2) continue;
                    alreadyFound.add(tempWeapon.getName());
                }
            }

            addToMessage(String.format("You found a(n) %s!", tempWeapon.getName()));
            hero.getInventory().get("Weapon").add(tempWeapon.getName());
            break;
        }
    }

    private void randomArmor() {
        while (true) {

            int num = random.nextInt(hero.getLevel()*3);
            if (num>hero.getArmorList().getArmors().size()-1) continue;

            Armor tempArmor = hero.getArmorList().getArmors().get(num);
            if (tempArmor.getOnlyOne() == true) {
                if (alreadyFound.contains(tempArmor.getName())) {
                    continue;
                } else {
                    int noLegendaryPlease = random.nextInt(101);
                    if (noLegendaryPlease>hero.getLevel()*2) continue;
                    alreadyFound.add(tempArmor.getName());
                }
            }

            addToMessage(String.format("You found a(n) %s!", tempArmor.getName()));
            hero.getInventory().get("Armor").add(tempArmor.getName());
            break;
        }
    }

    private void randomItem() {
        while (true) {
            int num = random.nextInt(hero.getItemList().getItems().size());
            Item tempItem = hero.getItemList().getItems().get(num);

            addToMessage(String.format("You found a(n) %s!", tempItem.getName()));
            hero.getInventory().get("Item").add(tempItem.getName());
            break;
        }
    }

    public Integer calculateArmor() {
        return (hero.getCurrentArmor().getProtection()+(int) Math.round(hero.getLevel()/2.0));
    }

    private Integer calculateMaxHP() {
        return ((hero.getLevel() - 1) * 80 + 150);
    }

    public Integer maxHP() {
        return calculateMaxHP();
    }

    public Integer getHeroArmor(){
        return calculateArmor();
    }

    public Integer getHeroDamage() {
        return calculateDamage();

    }
    public Integer getHeroSpeed(){
        return calculateSpeed();
    }

    protected Integer calculateEXPNeededForNextLevel() {
        if (hero.getLevel()==10) return 0;
        return (hero.getLevel() * 15 + 10);
    }

    private Integer calculateDamage() {
        Integer tempDamage = (hero.getLevel() - 1) * 4 + 10 + hero.getCurrentWeapon().getDamage();
        return (tempDamage);
    }

    private Integer calculateSpeed() {
        Integer tempSpeed = (hero.getLevel() - 1) * 5 + 8 + hero.getCurrentWeapon().getSpeed() + hero.getCurrentArmor().getSpeed();
        if (tempSpeed < 1) tempSpeed = 1;

        if (hero.getSlowedTick() == true){
            tempSpeed =(int) Math.round(tempSpeed*0.6);
        } else if (hero.getBerzerkTick() == true) {
            tempSpeed =(int) Math.round(tempSpeed*1.75);
        }
        return (tempSpeed);
    }

    private void shopTurn(String name) throws IOException {
        System.out.println(Pics.getImage("Shop"));
        printStats();
        System.out.println("Acceptable commands: list{Weapon(s), Armor(s), Item(s), Inventory},");
        System.out.println("                     buy {item}, sell {item}, use {item}, bye");
        System.out.println("----------------------------------------------------------------------");
        if (this.message != "") System.out.println(message);
        System.out.print(name + ", how can I help you?> ");
        this.message = "";
        shopParser(getReaderLine());
    }

    private void shopParser(String command) {
        try {
            String com = parser(command)[0];
            String arg = parser(command)[1];

            switch (com) {
                case ("bye"):
                    gameView = 0;
                    break;
                case ("use"):
                    if (arg == "") {
                        message = "This command needs an item name as argument!";
                    } else if (arg == "Bomb" || arg.equals("Bomb")){
                        message = "You shouldn't blow up a shop from the inside!";
                    } else if (arg == "Scroll Of Vision" || arg.equals("Scroll Of Vision")){
                        message = "Won't work here, just wasting your stuff...";
                    }else {
                        useItemOnMap(arg);
                    }
                    break;
                case ("list"):
                    if (arg == "") {
                        message = "This command needs an item type name as argument!";
                    } else {
                        switch (arg) {
                            case ("Inventory"):
                                listInventory();
                                break;
                            default:
                                listForShop(arg);
                        }
                    }
                    break;
                case ("buy"):
                    if (arg == "") {
                        message = "This command needs an item name as argument!";
                    } else {
                        buyItem(arg);
                    }

                    break;
                case ("sell"):
                    if (arg == "") {
                        message = "This command needs an item name as argument!";
                    } else {
                        sellItem(arg);
                    }
                    break;
                default:
                    message = "Unknown command!";

            }
        } catch (Exception e) {
            message = "Illegal syntax!";
            e.printStackTrace();

        }

    }

    private void buyItem(String itemName) {
        if (hero.getWeaponList().getWeaponByName(itemName) != null) {
            if (hero.getWeaponList().getWeaponByName(itemName).getPrice() > hero.getMoney()) {
                message = "Not enough gold, come back later!";
            } else if (hero.getWeaponList().getWeaponByName(itemName).getOnlyOne()==true){
                message = "Nice try! You cannot buy legendary stuff!";
            }else {
                hero.setMoney(hero.getMoney() - hero.getWeaponList().getWeaponByName(itemName).getPrice());
                hero.getInventory().get("Weapon").add(itemName);
                message = "You bought a(n) " + itemName + ", good choice!";
            }
        } else if (hero.getArmorList().getArmorByName(itemName) != null) {
            if (hero.getArmorList().getArmorByName(itemName).getPrice() > hero.getMoney()) {
                message = "Not enough gold, come back later!";
            } else if (hero.getArmorList().getArmorByName(itemName).getOnlyOne()==true){
                message = "Nice try! You cannot buy legendary stuff!";
            } else {
                hero.setMoney(hero.getMoney() - hero.getArmorList().getArmorByName(itemName).getPrice());
                hero.getInventory().get("Armor").add(itemName);
                message = "You bought a(n) " + itemName + ", good choice!";
            }
        } else if (hero.getItemList().getItemByName(itemName) != null) {
            if (hero.getItemList().getItemByName(itemName).getPrice() > hero.getMoney()) {
                message = "Not enough gold, come back later!";
            } else {
                hero.setMoney(hero.getMoney() - hero.getItemList().getItemByName(itemName).getPrice());
                hero.getInventory().get("Item").add(itemName);
                message = "You bought a(n) " + itemName + ", good choice!";
            }
        } else {
            message = "Can't find item called '" + itemName + "'!";
        }
    }

    private void sellItem(String itemName) throws IOException {
        if (hero.getInventory().get("Weapon").contains(itemName)) {
            double p = ((double) (random.nextInt(35) + 30 + hero.getLevel() * 2)) / 100.0;
            if (p > 0.9) p = 0.9;
            int price = (int) Math.round(hero.getWeaponList().getWeaponByName(itemName).getPrice() * p);
            boolean b = askForSell(itemName, price);

            if (b == true) {
                message = "Nice! Next time I will give you discount!";
                hero.getInventory().get("Weapon").remove(itemName);
                hero.setMoney(hero.getMoney() + price);
            } else {
                message = "Too bad...";
            }
        } else if (hero.getInventory().get("Armor").contains(itemName)) {
            double p = ((double) (random.nextInt(35) + 30 + hero.getLevel() * 2)) / 100.0;
            if (p > 0.9) p = 0.9;
            int price = (int) Math.round(hero.getArmorList().getArmorByName(itemName).getPrice() * p);
            boolean b = askForSell(itemName, price);

            if (b == true) {
                message = "Nice! Next time I will give you discount!";
                hero.getInventory().get("Armor").remove(itemName);
                hero.setMoney(hero.getMoney() + price);
            } else {
                message = "Too bad...";
            }
        } else if (hero.getInventory().get("Item").contains(itemName)) {
            double p = ((double) (random.nextInt(35) + 30 + hero.getLevel() * 2)) / 100.0;
            if (p > 0.9) p = 0.9;
            int price = (int) Math.round(hero.getItemList().getItemByName(itemName).getPrice() * p);
            boolean b = askForSell(itemName, price);
            if (b == true) {
                message = "Nice! Next time I will give you discount!";
                hero.getInventory().get("Item").remove(itemName);
                hero.setMoney(hero.getMoney() + price);
            } else {
                message = "Too bad...";
            }
        } else {
            message = "Couldn't find item called '" + itemName + "'!";
        }
    }

    private boolean askForSell(String itemName, int price) throws IOException {
        boolean b = false;
        while (true) {
            System.out.print("Nice " + itemName + " you have! Would you like to sell it for " + price + " golds? (Y/N)> ");
            String s = getReaderLine();
            if (s.toLowerCase().equals("yes") || s.toLowerCase().equals("y")) {
                b = true;
                break;
            } else if (s.toLowerCase().equals("no") || s.toLowerCase().equals("n")) {
                b = false;
                break;
            } else {
                System.out.println("Pardon? I don't understand Elvish!");
            }
        }
        return (b);
    }


    private void listForShop(String type) {
        switch (type) {
            case ("Weapons"):
                listWeapons();
                break;
            case ("Armors"):
                listArmors();
                break;
            case ("Items"):
                listItems();
                break;
            case ("Weapon"):
                listWeapons();
                break;
            case ("Armor"):
                listArmors();
                break;
            case ("Item"):
                listItems();
                break;
            default:
                message = "Unknown argument " + type + " for listing!";
        }
    }

    private void listWeapons() {
        int num = 1;
        for (Weapon w : hero.getWeaponList().getWeapons()) {
            if (w.getOnlyOne() == false) {
                message = message + num + ". " + w.getName() + ": DAMAGE BONUS: " + w.getDamage() + " SPEED BONUS: " + w.getSpeed() +
                        " CRITICAL CHANCE BONUS: " + w.getCriticalChance() + " -- PRICE: " + w.getPrice() + System.lineSeparator();
                num++;
            }
        }
    }

    private void listArmors() {
        int num = 1;
        for (Armor a : hero.getArmorList().getArmors()) {
            if (a.getOnlyOne() == false) {
                message = message + num + ". " + a.getName() + ": PROTECTION VALUE: " + a.getProtection() + " SPEED DECREASE: " + a.getSpeed() +
                        " -- PRICE: " + a.getPrice() + System.lineSeparator();

                num++;
            }
        }
    }

    private void listItems() {
        int num = 1;
        for (Item i : hero.getItemList().getItems()) {
            String use = "";
            if (i.canBeUsedOnMap() == true && i.isCanBeUsedDuringBattle() == false) use = "MAP only";
            if (i.canBeUsedOnMap() == false && i.isCanBeUsedDuringBattle() == true) use = "FIGHT only";
            if (i.canBeUsedOnMap() == true && i.isCanBeUsedDuringBattle() == true) use = "MAP/FIGHT";

            message = message + i.getName() + ": " + i.getDescripton() + " USE: " + use +
                    " -- PRICE: " + i.getPrice() + System.lineSeparator();

            message = message + String.format("%d. %s: %s, USE: %s -- PRICE: %d)" + System.lineSeparator(),
                    num, i.getName(), i.getDescripton(), use, i.getPrice());
            num++;
        }
    }


    private void checkIfTheyAllDied()
    {
        boolean ifAtLeastOneLives = false;
        for (Monster m: Monsters) {
            if (m.getIsDead() == false) {
                if (m.getCurrentHP()>0){
                    ifAtLeastOneLives = true;
                    break;
                }else{
                    m.setCurrentHP(0);
                    m.setDead(true);
                    int exp = calculateEXPgain(m);
                    hero.setEXP(hero.getEXP()+exp);
                    addToMessage((m.getName() + " died, you gained "+ exp + " EXP."));
                    getRandomGoodness(m.getName());

                }
            }
        }
        if (ifAtLeastOneLives == false) {
            hero.setStunnedTick(0);
            hero.setPoisonedTick(0);
            hero.setBuffImmunityTick(0);
            hero.setBerzerkTick(0);
            hero.setSlowedTick(0);
            if (Monsters.get(0).isABoss()==false) {
                gameView = 0;
            } else {
                hero.setHP(calculateMaxHP());
                gameView = 4;
            }
        }
    }


    private void fightTurn(String name) throws InterruptedException, IOException {
        if (hero.getHP()<1) {
            gameView = 3;
            return;
        }
        decreaseTicks();
        if (hero.getHP()<1) {
            gameView = 3;
            return;
        }
        int lineLen = drawMonsterPortrait();
        drawLine(lineLen);
        monsterStats(lineLen);
        drawLine(lineLen);
        if (message!=""){
            System.out.println(message);
            message = "";
        }
        if (!fastMode) Thread.sleep(2500);
        int theOneThatCanHaveAction = Chinchirorin();
        drawLine(lineLen);
        if (theOneThatCanHaveAction==0){
            System.out.println(this.name+" can do a move!");
            drawLine(lineLen);
            monsterStats(lineLen);
            drawLine(lineLen);
            printStats();
            System.out.println("Acceptable commands: attack {enemy name or number},");
            System.out.println("                     use {item} {>> enemy name or number},");
            System.out.println("                     flee, list");
            drawLine(lineLen);
            boolean progress = false;
            while (progress == false) {
                if (this.message != "") System.out.println(message);
                System.out.print(name + ", what do you do?> ");
                this.message = "";
                progress = fightParser(getReaderLine());
                System.out.println(this.message);
                this.message = "";
            }
            if (!fastMode) Thread.sleep(2000);
        } else {
            System.out.println(Monsters.get(theOneThatCanHaveAction-1).getName() + " can do a move!");
            if (!fastMode) Thread.sleep(1500);
            boolean done = false;
            while(true){
                int chance = random.nextInt(65) + (Monsters.get(theOneThatCanHaveAction-1).getLevel()*3) ;
                if (chance<60) {
                    done = monsterAttacksPlayer(Monsters.get(theOneThatCanHaveAction-1));
                } else if (chance<80) {
                    done = Monsters.get(theOneThatCanHaveAction-1).firstAbility();
                } else {
                    done = Monsters.get(theOneThatCanHaveAction-1).secondAbility();
                }
                if (done == false) monsterAttacksPlayer(Monsters.get(theOneThatCanHaveAction-1));
                if (done == true) break;
            }
            if (!fastMode) Thread.sleep(3000);
        }
        checkIfTheyAllDied();
        if (hero.getHP() < 1) {
            hero.setHP(0);
            message += System.lineSeparator() + this.name + " has been killed!";
            gameView = 3;
        }

    }

    private boolean monsterAttacksPlayer(Monster mon){
        if (evasion(mon.getSpeed(), calculateSpeed(), mon.getLevel(), hero.getLevel()) == true && random.nextInt(101)>4 && hero.getStunnedTick()==false)
        {
            message = mon.getName() + " attacked " + this.name +", but missed.";
        }
        else
        {
            int damage = calculateD(mon.getDamage(), mon.getLevel(), calculateArmor(), hero.getLevel(), mon.getCriticalChance(), hero.getHP());
            message = mon.getName() + " attacked " + this.name + " and took " + damage + " damage.";
            hero.setHP(hero.getHP() - damage);

        }
        return (true);
    }

    private boolean fightParser(String command) {
        try{
            String com = parser(command)[0];
            String arg = parser(command)[1];

            switch (com) {
                case ("fast"):
                    if (arg == "On" || arg.equals("On")){
                        this.fastMode = true;
                        message = "Fast mode on!";
                    } else if (arg == "Off" || arg.equals("Off")){
                        this.fastMode = false;
                        message = "Fast mode on!";
                    } else {
                        message = "Pardon?";
                    }
                    return (false);
                case ("flee"):
                    if (Monsters.get(0).isABoss() == true) {
                        message = "There is no escape! Resistance is futile!";
                    } else {
                        if (calculateIfYouCanEscape() == false) {
                            message = "There is no escape! Resistance is futile!";
                        } else {
                            message = "You managed to escape!";
                            dungeon.addMonstersRandom();
                            gameView = 0;
                        }
                    }
                    return (true);

                case ("use"):
                    if (arg == "") {
                        message = "This command needs an item name as argument!";
                        return (false);
                    } else {
                        String[] args = arg.split(">>");
                        if (args.length == 1) {
                            return (useItemDuringBattle(arg, null));
                        } else {
                            return (useItemDuringBattle(args[0].trim(), args[1].trim()));
                        }
                    }
                case ("list"):
                    listInventory();
                    return (false);
                default:
                    message = "Unknown command!";
                    return (false);
                case ("attack"):
                    int living = 0;
                    for (Monster m : Monsters) {
                        if (m.getIsDead() == false) living++;
                    }
                    if (arg == "" && living > 1) {
                        message = "This command needs a target if there are more of them!";
                        return (false);
                    } else {
                        Monster mon = null;
                        if (living == 1) {
                            for (Monster m : Monsters) {
                                if (m.getIsDead() == false) mon = m;
                            }
                        } else {
                            mon = getMonsterByNumOrName(arg);
                            if (mon == null) {
                                message = "Couldn't identify monster!";
                                return (false);
                            }
                        }
                        attackHeroMonster(mon);
                        return (true);
                    }
                }
            }
             catch (Exception e){
                message = "Illegal syntax!";
                e.printStackTrace();
                return (false);

            }

        }


    private void attackHeroMonster(Monster mon){
        if (evasion(calculateSpeed(), mon.getSpeed(), hero.getLevel(), mon.getLevel()) == true && random.nextInt(101)>4 && mon.getStunnedTick()==false)
        {
            message = this.name + " attacked " + mon.getName() +", but missed.";
        }
        else
        {
            int damage = calculateD(calculateDamage(), hero.getLevel(), mon.getArmor(), mon.getLevel(), hero.getCriticalChance(), mon.getCurrentHP());
            message = this.name + " attacked " + mon.getName() + " and took " + damage + " damage.";
            mon.setCurrentHP(mon.getCurrentHP() - damage);
            if (mon.getCurrentHP() < 1) {
                mon.setDead(true);
                int exp = calculateEXPgain(mon);
                hero.setEXP(hero.getEXP()+exp);
                message += System.lineSeparator() + mon.getName() + " died, "+this.name+ " gained "+exp+ " XP.";
                getRandomGoodness(mon.getName());
            }
        }

    }

    public int calculateEXPgain(Monster mon){
        int temp  = mon.getMaxHP() / 7 + mon.getLevel() - hero.getLevel();
        if (temp<1) temp = 1;
        return temp;
    }

    private boolean evasion(int aSpeed, int dSpeed, int aLevel, int dLevel){
        if (random.nextInt(101) > 96 ) return false;

        int attacker = aSpeed + aLevel + random.nextInt(aSpeed);
        int defender = dSpeed + dLevel;

        if (attacker>defender) {
            return(false);
        } else {
            return(true);
        }
    }

    public int calculateD(int aDamage, int aLevel, int dArmor, int dLevel, double aCritical, int dHealth)
    {
        int baseDamage = aDamage - dArmor + aLevel - dLevel + random.nextInt(aLevel+1);
        if (baseDamage<1) baseDamage = 1;

        if (((int) Math.round(aCritical*100.0)) > random.nextInt(100)) {
            System.out.println("CRITICAL DAMAGE!!");
            baseDamage += dArmor + ((int) dHealth / 8);
        }


        return (baseDamage);
    }

    private boolean useItemDuringBattle (String item, String target) {
        if (hero.getInventory().get("Weapon").contains(item)) {
            hero.getInventory().get("Weapon").remove(item);
            hero.getInventory().get("Weapon").add(hero.getCurrentWeapon().getName());
            hero.setCurrentWeapon(hero.getWeaponList().getWeaponByName(item));
            return(true);
        } else if (hero.getInventory().get("Armor").contains(item)) {
            hero.getInventory().get("Armor").remove(item);
            hero.getInventory().get("Armor").add(hero.getCurrentArmor().getName());
            hero.setCurrentArmor(hero.getArmorList().getArmorByName(item));
            return(true);

        } else if (hero.getInventory().get("Item").contains(item)) {
            if (hero.getItemList().getItemByName(item).isCanBeUsedDuringBattle()== false) {
                message = "Cannot use this item during a battle!";
                return(false);

            } else {
                if (hero.getItemList().getItemByName(item).ifNeedsTarget() == true){
                    if (target == null) {
                        message = "Cannot use this item without a target!";
                        return(false);
                    } else {
                        Monster mon = getMonsterByNumOrName(target);
                        if (mon == null){
                            message = "Couldn't identify monster!";
                            return(false);
                        }else{
                            if (mon.getIsDead()==true) {
                                message = "You cannot use item on corpses!";
                                return(false);
                            }else {
                                hero.getInventory().get("Item").remove(item);
                                addToMessage(hero.getItemList().getItemByName(item).effectOnEnemies(mon));
                                return(true);
                            }
                        }
                    }

                } else {
                    hero.getInventory().get("Item").remove(item);
                    message = hero.getItemList().getItemByName(item).effectOnHero(this.hero);
                    if (message == null) message = hero.getItemList().getItemByName(item).effectWithoutTarget();
                    return(true);
                }


            }
        } else {
            message = "Item was not found.";
            return(false);
        }
    }

    private Monster getMonsterByNumOrName(String target) {
        Monster m = null;
        try {
            int i = Integer.parseInt(target);
            for (Monster mon : Monsters) {
                if (mon.getIsDead() == true) continue;
                if (i == 0) {
                    m = mon;
                    break;
                } else {
                    i--;
                }
            }
            return (m);
        } catch (Exception e) {
            for (Monster mon : Monsters) {
                if (mon.getIsDead() == true) continue;
                if (mon.getName().equals(target)) m = mon;
            }
            return (m);
        }
    }

    private boolean calculateIfYouCanEscape(){
        int heroPoints = hero.getLevel() + calculateSpeed();
        int enemyPoints = 0;
        for (Monster m : Monsters){
            if (m.getIsDead() == false){
                enemyPoints += m.getLevel();
                enemyPoints += m.getSpeed();
            }
        }
        if (heroPoints * random.nextInt(calculateSpeed()) > enemyPoints) {
            return true;
        } else {
            return false;
        }
    }


    private int drawMonsterPortrait() {
        int size = 0;
        for (int x = 0; x < Pics.getImage(Monsters.get(0).getName()).split(System.lineSeparator()).length; x++) {
            if (Monsters.get(0).getIsDead() == false) System.out.print(Pics.getImageLine(Monsters.get(0).getName(), x));
            if (Monsters.size() > 1) {
                if (Monsters.get(1).getIsDead() == false) {
                    System.out.print(" || ");
                    System.out.print(Pics.getImageLine(Monsters.get(1).getName(), x));
                }
            }
            if (Monsters.size() > 2) {
                if (Monsters.get(2).getIsDead() == false) {
                    System.out.print(" || ");
                    System.out.print(Pics.getImageLine(Monsters.get(2).getName(), x));
                }
            }

            size = Pics.getImageLine(Monsters.get(0).getName(), x).length();
            System.out.print(System.lineSeparator());
        }
        return (size);
    }

    private void drawLine(int lineLen) {
        int size = 0;
        for (Monster m : Monsters) {
            if (m.getIsDead() == false) size++;
        }

        for (int x = 0; x < ((size * lineLen) + ((Monsters.size() - 1) * 4)); x++) {
            System.out.print("-");
        }
        System.out.print(System.lineSeparator());
    }

    private void monsterStats(int lineLen) {
        monsterNames(lineLen);
        monsterLevels(lineLen);
        monsterHPs(lineLen);
        monsterDamages(lineLen);
        monsterArmors(lineLen);
        monsterSpeeds(lineLen);
    }

    private void printDataPLZ(int lineLen, String first, String second, String third){
        String lastSTR = "";
        if (Monsters.get(0).getIsDead() == false) {
            lastSTR = first;
            if (!lastSTR.equals("")) System.out.print(lastSTR);
        }
        if (Monsters.size() > 1) {
            if (Monsters.get(1).getIsDead() == false) {
                if (!lastSTR.equals("")) addSpace(lastSTR, lineLen);
                lastSTR = second;
                System.out.print(lastSTR);
            }
        }
        if (Monsters.size() > 2) {
            if (Monsters.get(2).getIsDead() == false) {
                if (!lastSTR.equals("")) addSpace(lastSTR, lineLen);
                lastSTR = third;
                System.out.print(lastSTR);
            }
        }
        System.out.print(System.lineSeparator());


    }


    private void monsterNames(int lineLen) {
        String s1 = "";
        String s2 = "";
        String s3 = "";
        if (Monsters.get(0).getIsDead() == false) s1 = Monsters.get(0).getName();
        if (Monsters.size()>1){
            if (Monsters.get(1).getIsDead() == false) s2 = Monsters.get(1).getName();
        }
        if (Monsters.size()>2){
            if (Monsters.get(2).getIsDead() == false) s3 = Monsters.get(2).getName();
        }
        printDataPLZ(lineLen, s1, s2, s3);
    }

    private void monsterLevels(int lineLen){
        String s1 = "";
        String s2 = "";
        String s3 = "";
        if (Monsters.get(0).getIsDead() == false) s1 = "LEVEL: " + Monsters.get(0).getLevel();
        if (Monsters.size()>1){
            if (Monsters.get(1).getIsDead() == false) s2 = "LEVEL: " + Monsters.get(1).getLevel();
        }
        if (Monsters.size()>2){
            if (Monsters.get(2).getIsDead() == false) s3 ="LEVEL: " + Monsters.get(2).getLevel();
        }
        printDataPLZ(lineLen, s1, s2, s3);

        }

    private void monsterHPs(int lineLen) {
        String s1 = "";
        String s2 = "";
        String s3 = "";
        if (Monsters.get(0).getIsDead() == false) s1 = "HP: " + Monsters.get(0).getCurrentHP() + "/" + Monsters.get(0).getMaxHP();
        if (Monsters.size()>1){
            if (Monsters.get(1).getIsDead() == false) s2 = "HP: " + Monsters.get(1).getCurrentHP() + "/" + Monsters.get(1).getMaxHP();
        }
        if (Monsters.size()>2){
            if (Monsters.get(2).getIsDead() == false) s3 = "HP: " + Monsters.get(2).getCurrentHP() + "/" + Monsters.get(2).getMaxHP();
        }
        printDataPLZ(lineLen, s1, s2, s3);
    }

    private void monsterDamages(int lineLen) {
        String s1 = "";
        String s2 = "";
        String s3 = "";
        if (Monsters.get(0).getIsDead() == false) s1 = "DAMAGE: " + Monsters.get(0).getDamage();
        if (Monsters.size()>1){
            if (Monsters.get(1).getIsDead() == false) s2 = "DAMAGE: " + Monsters.get(1).getDamage();
        }
        if (Monsters.size()>2){
            if (Monsters.get(2).getIsDead() == false) s3 = "DAMAGE: " + Monsters.get(2).getDamage();
        }
        printDataPLZ(lineLen, s1, s2, s3);
    }

    private void monsterArmors(int lineLen) {
        String s1 = "";
        String s2 = "";
        String s3 = "";
        if (Monsters.get(0).getIsDead() == false) s1 = "ARMOR: " + Monsters.get(0).getArmor();
        if (Monsters.size()>1){
            if (Monsters.get(1).getIsDead() == false) s2 = "ARMOR: " + Monsters.get(1).getArmor();
        }
        if (Monsters.size()>2){
            if (Monsters.get(2).getIsDead() == false) s3 = "ARMOR: " + Monsters.get(2).getArmor();
        }
        printDataPLZ(lineLen, s1, s2, s3);
    }

    private void monsterSpeeds(int lineLen) {
        String s1 = "";
        String s2 = "";
        String s3 = "";
        if (Monsters.get(0).getIsDead() == false) s1 = "SPEED: " + Monsters.get(0).getSpeed();
        if (Monsters.size()>1){
            if (Monsters.get(1).getIsDead() == false) s2 = "SPEED: " + Monsters.get(1).getSpeed();
        }
        if (Monsters.size()>2){
            if (Monsters.get(2).getIsDead() == false) s3 = "SPEED: " + Monsters.get(2).getSpeed();
        }
        printDataPLZ(lineLen, s1, s2, s3);
    }

    private void addSpace(String name, int lineLen) {
        for (int x = 0; x < lineLen - name.length() + 3; x++) {
            System.out.print(" ");
        }
    }

    private int Chinchirorin() throws InterruptedException {
        int theOne = -1;
        while (true) {
            int[] allOfThem = new int[4];
            if (hero.getStunnedTick()==true){
                System.out.println(this.name + " is stunned, so can't do much.");
                allOfThem[0] = -1;
            } else {
                System.out.println(this.name + "'s turn...");
                allOfThem[0] = dices(hero.getBerzerkTick());
            }
            for (int x = 0; x < Monsters.size(); x++) {
                if (Monsters.get(x).getIsDead() == false) {
                    if (Monsters.get(x).getStunnedTick()==true){
                        System.out.println(Monsters.get(x).getName() + " is stunned, so can't do much.");
                        allOfThem[x+1] = -1;
                    } else {
                        System.out.println(Monsters.get(x).getName() + "'s turn...");
                        allOfThem[x+1] = dices(Monsters.get(x).getBerzerkTick());
                    }

                } else {
                    allOfThem[x+1] = -1;
                }
            }
            int max = -9999;
            int index = -1;
            for (int x=0; x<4; x++){
                if (allOfThem[x]>max){
                    max = allOfThem[x];
                    index = x;
                }
            }
            int count = 0;
            for (int x=0; x<4; x++){
                if (allOfThem[x] == max){
                    count++;
                }
            }
            if (count == 1) {
                theOne = index;
                break;
            }

        }
        return (theOne);
    }

    private int dices(boolean berzerk) throws InterruptedException {
        System.out.println("Rolling dices...");
        if (!fastMode) Thread.sleep(500);
        int value = -1;

        while (true) {
            value = -1;
            int[] dices = new int[3];
            for (int x = 0; x < 3; x++) {
                if (berzerk == true){
                    dices[x] = random.nextInt(2) + 4;
                } else {
                    dices[x] = random.nextInt(5) + 1;
                }
            }
            drawDices(dices);
            if (dices[0] == dices[1] && dices[0] == dices[2]){

                value = dices[0] + 7;

            } else if (dices[0] == dices[1] || dices[0] == dices[2] || dices[1] == dices[2]){
                if (dices[0] == dices[1]) {
                    value = dices[2]+1;
                } else if (dices[0] == dices[2]) {
                    value = dices[1]+1;
                } else {
                    value = dices[0]+1;
                }
            } else {
                List<Integer> temp = new ArrayList<>();
                for (int x=0; x<3; x++){
                    temp.add(dices[x]);
                }
                Collections.sort(temp);
                if (temp.get(0) == 0 && temp.get(1) == 1 && temp.get(2) == 2){
                    value = 0;
                    break;
                } else if (temp.get(0) == 3 && temp.get(1) == 4 && temp.get(2) == 5){
                    value = 9999;
                } else {
                    value = -1;
                }
            }
            if (!fastMode) Thread.sleep(250);
            if (value>0) break;
        }
        System.out.println("ROLL VALUE: "+value);
        if (!fastMode) Thread.sleep(750);
        return(value);
    }

    private void drawDices(int[] d){
        for (int x = 0; x<5; x++){
            System.out.println(String.format("%s %s %s", this.dices.getDiceLine(d[0], x), this.dices.getDiceLine(d[1], x), this.dices.getDiceLine(d[2], x)));
        }
    }

    private void deadTurn(String name){
        game.newHero = true;
        System.out.println(Pics.getImage("Grave"));
        System.out.println("---------------------------------------------------------------------------------");
        if (message!="") {
            System.out.println(message);
            message="";
        }
        System.out.print("You are dead. Would you like to play again? (Y/N)> ");
        try {
            String thing = reader.readLine();

            if (thing.toLowerCase().equals("y") || thing.toLowerCase().equals("yes")) {
                this.game.playAgain = true;
                gameEnded = true;
            } else if (thing.toLowerCase().equals("n") || thing.toLowerCase().equals("no")) {
                System.out.println("We should play again soon, bye, "+ this.name+" !");
                this.game.playAgain = false;
                gameEnded = true;
            } else {
                message = "Should I ask a Necromancer to translate your speaking?";
            }
        } catch (Exception e){
            message = "Invalid Syntax!";
            e.printStackTrace();
        }
    }

    private void winTurn(String name){
        game.newHero = false;
        System.out.println(Pics.getImage("Knight"));
        System.out.println("---------------------------------------------------------------------------------");
        if (message!="") {
            System.out.println(message);
            message="";
        }
        System.out.println("You had defeated the forces of evil, peace shall return.");
        System.out.print("Would you like to continue your adventure? (Y/N)> ");
        try {
            String thing = reader.readLine();

            if (thing.toLowerCase().equals("y") || thing.toLowerCase().equals("yes")) {
                this.game.playAgain = true;
                gameEnded = true;
            } else if (thing.toLowerCase().equals("n") || thing.toLowerCase().equals("no")) {
                System.out.println("We should play again soon, bye, "+ this.name+" !");
                this.game.playAgain = false;
                gameEnded = true;
            } else {
                message = "It's some kind of Elvish. I can't read it.";
            }
        } catch (Exception e){
            message = "Invalid Syntax!";
            e.printStackTrace();
        }
    }
}