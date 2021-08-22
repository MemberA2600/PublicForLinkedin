package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

public class Manticore extends Monster{

    public Manticore(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        if (hero.getSlowedTick()==true){
            return(false);
        }else{
            int num = this.getLevel() - hero.getLevel();
            if (num<2) num=2;

            hero.setPoisonedTick(num);
            gc.addToMessage(getName() + " poisoned " + gc.getName() + " for " + (num-1) + " turns!");
            return(true);
        }
    };
    @Override
    public boolean secondAbility(){
        if (this.getBerzerkTick() == true || this.getCurrentHP()<15) return false;
        this.setBerzerkTick(getLevel()+3);
        gc.addToMessage(getName() + " became berzerker for " +getLevel()+2+ " turns!");

        return(true);
    };
}
