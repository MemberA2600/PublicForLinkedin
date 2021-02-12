package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

public class Lich extends Monster{

    public Lich(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        for (Monster mon : gc.getMonsters()){
            if (mon == this || mon.getIsDead() == false) continue;
            if (mon.getName().equals("Bat") || mon.getName().equals("Slime") || mon.getName().equals("Skeleton") || mon.getName().equals("Lich King")) continue;
            gc.addToMessage(getName() + " creates a Skeleton from a corpse.");
            gc.getMonsters().set(gc.getMonsters().indexOf(mon), new Skeleton("Skeleton", 25, 3, 0.05, 0, 1, false, this.hero, this.gc));

        }

        return(false);
    };
    @Override
    public boolean secondAbility(){
        if (hero.getBerzerkTick()==false || hero.getBuffImmunityTick()==false) return (false);
        gc.addToMessage("Lich remove positive buffs of " + gc.getName());
        hero.setBerzerkTick(0);
        hero.setBuffImmunityTick(0);
        return(true);
    };
}
