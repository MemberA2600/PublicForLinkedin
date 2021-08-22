package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.util.Random;

public class Slime extends Monster{

    public Slime(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
        //new Slime("Slime", 70, 2, 0.02, 15, 3, false, this.hero)
    }

    @Override
    public boolean firstAbility(){
        if (hero.getBuffImmunityTick() == true || hero.getSlowedTick() == true) return(false);
        int turn = this.getLevel() - hero.getLevel();
        if (turn <2) turn = 2;
        gc.addToMessage(getName() + " covers "+gc.getName() + " with slime, slowing him down for " + (turn-1) + " turns.");
        hero.setSlowedTick(turn);
        return true;
    };

    @Override
    public boolean secondAbility(){
        return(false);
    };
}
