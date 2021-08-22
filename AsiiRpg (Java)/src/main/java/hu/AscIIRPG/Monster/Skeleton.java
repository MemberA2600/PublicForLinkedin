package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

public class Skeleton extends Monster{

    public Skeleton(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
        //new Skeleton("Skeleton", 25, 3, 0.05, 0, 1, false, this.hero)
    }

    @Override
    public boolean firstAbility(){
        return(false);
    };
    @Override
    public boolean secondAbility(){
        return(false);
    };
}
