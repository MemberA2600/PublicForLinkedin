package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

public class Archvile extends Monster{

    public Archvile(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        for (Monster mon : gc.getMonsters()){
            if (mon.getName().equals("Archvile") || mon.getName().equals("Lich King")) continue;
            if (mon.getIsDead() == false) continue;

            mon.setDead(false);
            mon.setCurrentHP(mon.getMaxHP());

            gc.addToMessage(getName() + " resurrected "+mon.getName() + "!");
            return true;
        }

        return(false);
    };
    @Override
    public boolean secondAbility(){
        return(false);
    };
}
