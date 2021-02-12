package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

import java.util.Random;


public class SnakeBite extends Item{
    public SnakeBite(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){
        return null;
    }
    @Override
    public  String effectOnHero(Hero hero){return null;} ;
    @Override
    public  String effectOnEnemies(Monster m) {
        int maxDamageOnYou = m.getCurrentHP() / 4;
        String LOL = "";
        if (gc.gcHero().getHP()<(int) Math.round(gc.gcHero().getHP()*0.9)){
            LOL = "Not enough health to use this item!";
            gc.gcHero().getInventory().get("Item").add("Snakebite");

        }else if (gc.gcHero().getHP()*0.90<maxDamageOnYou){
            int maxDamageOnMonster = (int)(gc.gcHero().getHP()*4*0.9);
            if (maxDamageOnMonster>m.getCurrentHP()) maxDamageOnMonster = m.getCurrentHP();
            m.setCurrentHP(m.getCurrentHP()-maxDamageOnMonster);
            gc.gcHero().setHP(gc.gcHero().getHP()/10);
            LOL = m.getName() + " takes " + maxDamageOnMonster + " damage and " + gc.getName() + "lost 90% of health.";
            if (m.getCurrentHP()<1) {
                m.setCurrentHP(0);
                m.setDead(true);
                int exp = gc.calculateEXPgain(m);
                LOL = LOL + System.lineSeparator() + (m.getName() + " died, you gained " + exp + " EXP.");
                gc.getRandomGoodness(m.getName());
            } else if (m.getBuffImmunityTick()==false){
                Random r = new Random();
                int poison = r.nextInt(3)+3;
                m.setPoisonedTick(poison);
                LOL = LOL + System.lineSeparator() + (m.getName() + " got poisoned for " + (poison-1) + " turns.");

            }
        } else {
            int temp = gc.gcHero().getHP();
            gc.gcHero().setHP(gc.gcHero().getHP()-maxDamageOnYou);
            m.setCurrentHP(0);
            m.setDead(true);
            int exp = gc.calculateEXPgain(m);
            LOL = gc.getName() + " killed " + m.getName() + ", you gained "+ exp + " EXP. You lost " + (temp-gc.gcHero().getHP()) + " of health.";
            gc.getRandomGoodness(m.getName());

        }
        return (LOL);
    }

}