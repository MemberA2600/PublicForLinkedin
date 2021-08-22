package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

import java.util.Random;


public class HolyWater extends Item{
    public HolyWater(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){
        return null;
    }
    @Override
    public  String effectOnHero(Hero hero){return null;} ;
    @Override
    public  String effectOnEnemies(Monster m)
    {
        String LOL="";
        if (m.getName().equals("Archvile") || m.getName().equals("Ghoul") || m.getName().equals("Lich") || m.getName().equals("Skeleton") || m.getName().equals("Lich King")){
        Random r = new Random();
        int damage = (int) Math.round((r.nextInt(1250)+2000)/ (m.getLevel()+2)) - m.getArmor()*2-m.getSpeed();
        if (damage < 5) damage = 5;
        m.setCurrentHP(m.getCurrentHP()-damage);
        LOL = m.getName() + " takes " + damage + " damage by to holy water.";
        if (m.getCurrentHP()<1){
            m.setCurrentHP(0);
            m.setDead(true);
            int exp = gc.calculateEXPgain(m);
            LOL = LOL +  System.lineSeparator()+ (m.getName() + " died, you gained "+ exp + " EXP.");
            gc.getRandomGoodness(m.getName());
        } else {
            if (m.getBuffImmunityTick()==false){
                int stun = 3 + gc.gcHero().getLevel() - m.getLevel();
                if (stun<2) stun = 2;
                m.setStunnedTick(stun);
                LOL = LOL +  System.lineSeparator()+ (m.getName() + " stunned for "+ (stun-1) + " seconds!");

            }
        }

        } else {
            LOL = m.getName() + " is not affected by the Holy Water at all!";
        }

        return(LOL);
    } ;

}