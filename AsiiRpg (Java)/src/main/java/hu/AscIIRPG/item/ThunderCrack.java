package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

import java.util.Random;

public class ThunderCrack extends Item{
    public ThunderCrack(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){
        Random r = new Random();
        String m = "";
        for (Monster mon : gc.getMonsters()){
            int damage = r.nextInt(10)+2;
            mon.setCurrentHP(mon.getCurrentHP()-damage);
            if (m.equals("")) {
                m = mon.getName() + " took " + damage + " damage!";
            } else {
                m = m + System.lineSeparator() + mon.getName() + " took " + damage + " damage!" ;

            }
            if (mon.getCurrentHP()<1){
                mon.setCurrentHP(0);
                mon.setDead(true);
                int exp = gc.calculateEXPgain(mon);
                m = m + System.lineSeparator() + (mon.getName() + " died, you gained "+ exp + " EXP.");
                gc.getRandomGoodness(mon.getName());
            } else {
                if (mon.getBuffImmunityTick() == true){
                    m = m + System.lineSeparator()+ (mon.getName() + " is immuned to buffs right now!");
                } else {
                    int num = gc.gcHero().getLevel()-mon.getLevel();
                    if (num<2) num = 2;
                    mon.setStunnedTick(num);
                    m = m + System.lineSeparator() + mon.getName() + " is stunned for " + (num-1) + " turns.";
                }
            }

        }
        return (m);

    }
    @Override
    public  String effectOnHero(Hero hero){return null;} ;
    @Override
    public  String effectOnEnemies(Monster m)
    {
        return null;
    }
}
