package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

import java.util.Random;


public class Bomb extends Item{
    public Bomb(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){
        if (gc.bombTick>0) return("You cannot place more than one bomb at the same time, are you crazy?!");
        gc.setBomb();
        return("You placed a bomb! RUN!!!!");

    }
    @Override
    public  String effectOnHero(Hero hero){return null;} ;
    @Override
    public  String effectOnEnemies(Monster m)
    {
        String LOL="";
        Random r = new Random();
        int mainDamage = r.nextInt(65)+30-m.getArmor()-m.getLevel();
        if (mainDamage<10) mainDamage = 10;
        LOL = gc.getName() + " threw a bomb to "+m.getName() + ". doing "+mainDamage+ " damage.";

        m.setCurrentHP(m.getCurrentHP()-mainDamage);
        if (m.getCurrentHP()<1){
            m.setDead(true);
            m.setCurrentHP(0);
            int exp = gc.calculateEXPgain(m);
            LOL = LOL +System.lineSeparator()+ (m.getName() + " died, you gained "+ exp + " EXP.");
            gc.getRandomGoodness(m.getName());
        }

        for (Monster mon : gc.getMonsters()){
            if (mon.getIsDead() == true || mon == m) continue;
            int d = r.nextInt(20)-mon.getLevel();
            if (d<0) d =1;
            mon.setCurrentHP(mon.getCurrentHP()-d);
            LOL = LOL + System.lineSeparator() + mon.getName()+ " took " + d + " damage.";
            if (mon.getCurrentHP()<1){
                mon.setCurrentHP(0);
                mon.setDead(true);
                int exp = gc.calculateEXPgain(mon);
                LOL = LOL +  System.lineSeparator()+ (mon.getName() + " died, you gained "+ exp + " EXP.");
                gc.getRandomGoodness(mon.getName());

            }
        }

        return(LOL);
    } ;

}