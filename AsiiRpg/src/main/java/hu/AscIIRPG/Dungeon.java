package hu.AscIIRPG;

import java.io.Console;
import java.io.IOException;
import java.util.Arrays;
import java.util.Random;
import java.util.logging.Level;

public class Dungeon {

    //Words to use: HERO, ITEM, LOOT, BOSS, DOOR, DEAD

    private static Dungeon single_instance = null;
    private String[][] mapD;
    private Boolean[][] fogOfWar;
    private int[] dim;
    private Hero hero;
    private Random r;
    private int[] BossPoz;
    private boolean scrollOfVision;
    private String temp;

    private void clearDungeon() {
        for (int x = 1; x < this.dim[0]-1; x++) {
            for (int y = 1; y < this.dim[1]-1; y++) {
                this.mapD[x][y] = "    ";
                this.fogOfWar[x][y] = true;
            }
        }

    }

    public void addMonstersRandom() {
        boolean done = false;
        while (done == false) {
            for (int x = 1; x < this.dim[0] - 1; x++) {
                for (int y = 1; y < this.dim[1] - 1; y++) {
                    if (this.mapD[x][y].equals("    ")) {
                        int temp = r.nextInt(101);
                        if ( temp < 3) {
                            this.mapD[x][y] = "!!!!";
                            done = true;
                            break;
                        }
                    }
                }
            }
        }
    }

    public void testRemoveAllMonster(){
        for (int x = 1; x < this.dim[0] - 1; x++) {
            for (int y = 1; y < this.dim[1] - 1; y++) {
                if (this.mapD[x][y].equals("!!!!")) {
                    this.mapD[x][y] = "    ";
                    }
                }
            }
        }


    public void openBossDoorIfCan() {
        boolean hasEnemy = false;
        for (int x = 1; x < this.dim[0] - 1; x++) {
            for (int y = 1; y < this.dim[1] - 1; y++) {
                if (this.mapD[x][y].equals("!!!!")) {
                    hasEnemy = true;
                }
            }
        }
        if (hasEnemy==false) {
            for (int x = 1; x < this.dim[0] - 1; x++) {
                for (int y = 1; y < this.dim[1] - 1; y++) {
                    if (this.mapD[x][y].equals("DOOR")) {
                        if (this.mapD[x-1][y].equals("BOSS") ||
                                this.mapD[x+1][y].equals("BOSS") ||
                                this.mapD[x][y-1].equals("BOSS") ||
                                this.mapD[x][y+1].equals("BOSS")) {
                            this.mapD[x][y] = "    ";
                        }
                    }
                }
            }

        }
    }


    public String getMapTile(int x, int y){
        try{return(mapD[x][y]);}
        catch (Exception e){return("####");}
    }

    public void setMapTile(int x, int y, String tile){
        mapD[x][y] = tile;
    }

    private void buildWalls()
    {

        for (int x =0; x<this.dim[0]; x+=2)
        {
            for (int y =0; y<this.dim[1]; y+=2)
            {
                this.mapD[x][y] = "####";
            }
        }
        for (int x =1; x<this.dim[0]; x+=1)
        {
            for (int y =1; y<this.dim[1]; y+=2)
            {
                this.mapD[x][y] = "####";
            }
        }
    }

    private void buildWallsOutsite(){
        for (int x =0; x<this.dim[0]; x++)
        {
            this.mapD[x][0] = "####";
            this.mapD[x][1] = "####";
            this.mapD[x][this.dim[1]-1] = "####";

        }
        for (int y =0; y<this.dim[1]; y++)
        {
            this.mapD[0][y] = "####";
            this.mapD[this.dim[0]-1][y] = "####";
            this.mapD[this.dim[0]-2][y] = "####";
        }

    }

    private void drawDungeon(){
        if (scrollOfVision == true) vision();
        removeFogOfWarAroundThePlayer();
        for (int x = 0; x < this.dim[0]-1; x++) {
            for (int y = 1; y < this.dim[1]; y++) {
                System.out.print(drawTheTile(x,y));
            }
            System.out.print(System.lineSeparator());
        }
        scrollOfVision = false;
    }

    private void removeFogOfWarAroundThePlayer()
    {
        for (int y=this.hero.getPosition()[1]-2; y<this.hero.getPosition()[1]+3; y++) {
            for (int x = this.hero.getPosition()[0] - 2; x < this.hero.getPosition()[0] + 3; x++) {
                try {
                    this.fogOfWar[x][y] = false;
                } catch (Exception e){
                    continue;
                }
            }
        }
    }

    private String drawTheTile(int x,int y)
    {
        if (scrollOfVision == true) return(this.mapD[x][y]);

        if (this.fogOfWar[x][y]==null) this.fogOfWar[x][y]=true;

        if (this.fogOfWar[x][y] == true){
            return("%%%%");
        } else if (this.mapD[x][y]=="TRAP" || this.mapD[x][y]=="!!!!") {
            return("    ");
        }

        return(this.mapD[x][y]);

    }

    public void drawMe(){
        drawDungeon();
    }

    private void setHeroPosition()
    {
        Boolean success = false;

        while (success==false) {
            Integer x = r.nextInt(dim[0] - 3) + 2;
            Integer y = r.nextInt(dim[1] - 3) + 2;
            if (mapD[x][y] != "####")
            {
                hero.setPosition(x, y);
                success=true;
            }

        }
    }

    public boolean contains(String item){
        for (int y=0; y<dim[1]; y++){
            for (int x=0; x<dim[0]; x++){
                if (mapD[x][y].equals(item)) return true;
            }
        }
        return false;
    }

    private void moveAndGenerateThings()
    {
       Integer steps = dim[0]*dim[1]*2;
       Integer[] tempPoz = new Integer[2];
       Integer[] desiredPoZ = new Integer[2];
       Integer[] halfPoZ = new Integer[2];


       tempPoz[0] = hero.getPosition()[0];
       tempPoz[1] = hero.getPosition()[1];


        while (steps>0)
        {
            Integer direction = r.nextInt(4);
            switch (direction) {
                case (0):
                    desiredPoZ[0] = tempPoz[0]+2;
                    halfPoZ[0] = tempPoz[0]+1;
                    desiredPoZ[1] = tempPoz[1];
                    halfPoZ[1] = tempPoz[1];

                    break;
                case (1):
                    desiredPoZ[0] = tempPoz[0]-2;
                    halfPoZ[0] = tempPoz[0]-1;
                    desiredPoZ[1] = tempPoz[1];
                    halfPoZ[1] = tempPoz[1];

                    break;
                case (2):
                    desiredPoZ[0] = tempPoz[0];
                    halfPoZ[0] = tempPoz[0];
                    halfPoZ[1] = tempPoz[1]+1;
                    desiredPoZ[1] = tempPoz[1]+2;
                    break;
                case (3):
                    desiredPoZ[0] = tempPoz[0];
                    halfPoZ[0] = tempPoz[0];
                    desiredPoZ[1] = tempPoz[1]-2;
                    halfPoZ[1] = tempPoz[1]-1;
                    break;
            }
            /*
            mapD[0][1] = "TEST";
            mapD[0][dim[1]-1] = "TEST";
            mapD[dim[0]-2][1] = "TEST";
            mapD[dim[0]-2][dim[1]-1] = "TEST";
            */
            if (desiredPoZ[0]>0 && desiredPoZ[0]<dim[0]-2 &&
                desiredPoZ[1]>0 && desiredPoZ[1]<dim[1]-1) {

                if (desiredPoZ[0]==hero.getPosition()[0] && desiredPoZ[1]==hero.getPosition()[1]){
                    mapD[desiredPoZ[0]][desiredPoZ[1]] = "HERO";
                }else if (steps==1){
                    createRoom(desiredPoZ[0],desiredPoZ[1], halfPoZ[0], halfPoZ[1], "BOSS");
                    BossPoz = new int[]{desiredPoZ[0],desiredPoZ[1], halfPoZ[0], halfPoZ[1]};
                    steps--;


                }else{
                    mapD[desiredPoZ[0]][desiredPoZ[1]] = putThereSomething(desiredPoZ[0],desiredPoZ[1], halfPoZ[0], halfPoZ[1]);
                }

                if (mapD[halfPoZ[0]][halfPoZ[1]] == "####" || mapD[halfPoZ[0]][halfPoZ[1]] == "   "){
                if  (mapD[halfPoZ[0]][halfPoZ[1]] == "####") {
                    steps-=3;
                }
                    mapD[halfPoZ[0]][halfPoZ[1]] = "    ";
                }
                steps--;

                tempPoz[0] = desiredPoZ[0];
                tempPoz[1] = desiredPoZ[1];

            }

        }


    }

    private String putThereSomething(int x, int y, int doorX, int doorY)
    {
        Integer chance = r.nextInt(101);
        if (chance>70-(hero.getLevel()*3)) {
            return ("!!!!");
        }
        chance = r.nextInt(101);
        if (chance>90-(hero.getLevel()*3))
        {
            return("TRAP");
        }
        chance = r.nextInt(101);
        if (chance<35-(hero.getLevel()*3))
        {
            return("LOOT");
        }
        chance = r.nextInt(101);
        if (chance<15-(hero.getLevel()))
        {
            return("SHOP");
        }
        chance = r.nextInt(101);
        if (chance>100-(hero.getLevel()*3))
        {
            String inside =  "";
            chance = r.nextInt(4);
            switch (chance){
                case 0:
                    inside="!!!!";
                    break;
                case 1:
                    inside="TRAP";
                    break;
                default:
                    inside="LOOT";
                    break;
            }

            createRoom( x,  y,  doorX, doorY, inside);
        }

        return("    ");
    }

    private void createRoom(int x, int y, int doorX, int doorY, String inside){
        for (int i = y-1; i<y+2; i++){
            for (int j = x-1; j<x+2; j++) {
                mapD[j][i] = "####";
            }
        }
        mapD[doorX][doorY] = "DOOR";
        mapD[x][y] = inside;

    }

    private void addWalls()
    {
        for (int y = 1; y<dim[1]-1; y++){
            for (int x = 1; x<dim[0]-1; x++){
                if (x == 0){
                    if (mapD[x][y-1] == "####" && mapD[x+1][y-1] == "####" &&
                            mapD[x+1][y] == "####" &&
                            mapD[x][y+1] == "####" && mapD[x+1][y+1] == "####") {
                        int chance=r.nextInt(101);
                        if (chance<50-hero.getLevel()*2)
                        {
                            mapD[x][y] = "LOOT";
                        }else
                        { mapD[x][y] = "####";
                        }
                    }
                } else {
                    if (mapD[x-1][y-1] == "####" && mapD[x][y-1] == "####" && mapD[x+1][y-1] == "####" &&
                            mapD[x-1][y] == "####" &&  mapD[x+1][y] == "####" &&
                            mapD[x-1][y+1] == "####" && mapD[x][y+1] == "####" && mapD[x+1][y+1] == "####") {
                        int chance=r.nextInt(101);
                        if (chance<50-hero.getLevel()*2)
                        {
                            mapD[x][y] = "LOOT";
                        }else
                        { mapD[x][y] = "####";
                        }
                    }
                }
            }
        }
    }
    private void correctDoors(){
        for (int x = 1; x < this.dim[0]-1; x++) {
            for (int y = 1; y < this.dim[1]-1; y++) {
                if (mapD[x][y] == "DOOR"){
                    if (mapD[x-1][y] == "####"){
                        mapD[x-1][y-1] = "####";
                        mapD[x-1][y+1] = "####";
                        mapD[x+1][y-1] = "####";
                        mapD[x+1][y+1] = "####";
                    } else {
                        mapD[x-1][y+1] = "####";
                        mapD[x+1][y+1] = "####";
                        mapD[x+1][y-1] = "####";
                        mapD[x-1][y-1] = "####";
                    }
                }
            }
        }
    }

    private void removeOpsFromHero(){
        Integer x = hero.getPosition()[0];
        Integer y = hero.getPosition()[1];

        mapD[x][y] = "HERO";
        try{
        if (!mapD[x-2][y].equals("BOSS")) mapD[x-1][y] = "    ";}
        catch (Exception e) {};
        try{
            if (!mapD[x+2][y].equals("BOSS")) mapD[x+1][y] = "    ";}
        catch (Exception e) {};
        try{
            if (!mapD[x][y-2].equals("BOSS")) mapD[x][y-1] = "    ";}
        catch (Exception e) {};
        try{
            if (!mapD[x][y+2].equals("BOSS")) mapD[x][y+1] = "    ";}
        catch (Exception e) {};


    }

    public void setVision(){
        scrollOfVision = true;
    }

    public boolean isBossSurrounded()
    {
        boolean OK = true;
        for (int y=BossPoz[1]-1; y<BossPoz[1]+2; y++){
            for (int x=BossPoz[0]-1; x<BossPoz[0]+2; x++){
                if (x==BossPoz[0] && y==BossPoz[1]){
                    if (mapD[x][y] != "BOSS") OK = false;
                    break;
                } else if (x==BossPoz[2] && y==BossPoz[3]){
                    if (mapD[x][y] != "DOOR") OK = false;
                } else {
                    if (mapD[x][y] != "####") OK = false;
                }
            }
        }
        return(OK);


    }

    public void someBoom(int x, int y, GameController gc){
        temp="";
        if (getMapTile(x,y).equals("BOSS")) temp="BOSS";
        if (getMapTile(x,y).equals("!!!!")) temp="!!!!";


        checkIfItCanBOOM(x, y-1, gc, "<<<<");
        checkIfItCanBOOM(x, y+1, gc, ">>>>");
        checkIfItCanBOOM(x-1, y, gc, "//\\\\");
        checkIfItCanBOOM(x+1, y, gc, "\\\\//");
        checkIfItCanBOOM(x, y, gc, "BOOM");
    }

    public void removeBoom(int x, int y, GameController gc) {
        checkIfItCanBOOM(x, y - 1, gc, "    ");
        checkIfItCanBOOM(x, y + 1, gc, "    ");
        checkIfItCanBOOM(x - 1, y, gc, "    ");
        checkIfItCanBOOM(x + 1, y, gc, "    ");
        if (hero.getPosition()[0] != x || hero.getPosition()[1] != y) {
            if (temp.equals("BOSS") || temp == "BOSS") {
                checkIfItCanBOOM(x, y, gc, "BOSS");
            } else if (temp.equals("!!!!") || temp == "!!!!") {
                checkIfItCanBOOM(x, y, gc, "!!!!");
            } else {
                checkIfItCanBOOM(x, y, gc, "    ");
            }
        } else
            checkIfItCanBOOM(x, y, gc, "HERO");
        }



    private void checkIfItCanBOOM(int x, int y, GameController gc, String s){
        if (x>0 && x<dim[0]-2 && y>1 && y<dim[1]-1) {
            if (x==hero.getPosition()[0] && y==hero.getPosition()[1] && gc.bombTick==2) {
                int mainDamage = r.nextInt(65)+30-gc.getHeroArmor()-hero.getLevel();

                hero.setHP(hero.getHP()-mainDamage);
                gc.message = "You took " + mainDamage +" damage in the detonation!";
            }

            boolean isThereABoss = false;


            for (int a=x-1; a<x+2; a++){
                for (int b=y-1; b<y+2; b++){
                    if (getMapTile(a,b).equals("BOSS")) isThereABoss = true;
                }
            }
            if (isThereABoss==false) setMapTile(x,y,s);
        }

    }

    private void vision(){
        for (int x = 0; x < this.dim[0]; x++) {
            for (int y = 0; y < this.dim[1]; y++) {
                this.fogOfWar[x][y] = false;
            }
        }
    }

    private Dungeon(int[] data)
        {
            this.mapD = new String[data[1]][data[0]];
            this.fogOfWar = new Boolean[data[1]][data[0]];

            dim = new int[2];
            dim[0] = data[1];
            dim[1] = data[0];
            r = new Random();
            scrollOfVision = false;

        }

        public static Dungeon getInstance (int[] data) throws IOException {
            if (single_instance == null)
                single_instance = new Dungeon(data);

            return single_instance;
        }

        public void generateNewDungeon(Hero hero)
        {
            this.hero = hero;

            clearDungeon();
            buildWalls();
            setHeroPosition();
            moveAndGenerateThings();
            correctDoors();
            removeOpsFromHero();
            addWalls();
            buildWallsOutsite();
        }
    }

