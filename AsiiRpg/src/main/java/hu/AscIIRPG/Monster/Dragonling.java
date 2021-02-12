package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.util.Random;

public class Dragonling extends Monster{

    public Dragonling(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        if (this.getCurrentHP()<40) {
            gc.addToMessage("Dragonling becomes firestorm, sacrificing itself and damaging everyone.");
            this.setCurrentHP(0);
            this.setDead(true);
            Random r = new Random();
            int damage = r.nextInt(this.getLevel()*5)+15;
            hero.setHP(hero.getHP()-damage);
            for (Monster mon : gc.getMonsters()) {
                if (mon == this) continue;
                damage = r.nextInt(this.getLevel()*5)+15;
                mon.setCurrentHP(mon.getCurrentHP()-damage);
                if (mon.getCurrentHP()<1)
                {
                    mon.setDead(true);
                    gc.addToMessage(mon.getName() + " died.");
                }

            }
            return(true);
        }
        return(false);
    };
    @Override
    public boolean secondAbility(){
        if (this.getBerzerkTick() == true || this.getCurrentHP()<15) return false;
        this.setBerzerkTick(getLevel()+3);
        gc.addToMessage(getName() + " became berzerker for " +getLevel()+2+ " turns!");

        return(true);
    };
}
