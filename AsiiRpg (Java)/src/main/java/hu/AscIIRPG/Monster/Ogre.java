package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.util.Random;

public class Ogre extends Monster{

    public Ogre(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        if (hero.getStunnedTick()==true || hero.getBuffImmunityTick()==true) return(false);
        Random r = new Random();
        int temp = this.getLevel()-hero.getLevel();
        if (temp<2) temp = 2;
        int stun = r.nextInt(temp);
        if (stun<2) stun = 2;
        gc.addToMessage(getName() + " uses his club to stomp the ground, stunning " + gc.getName() + " for " + (stun-1) + " turns.");
        hero.setStunnedTick(stun);
        return(true);
    };
    @Override
    public boolean secondAbility(){
        return(false);
    };
}
