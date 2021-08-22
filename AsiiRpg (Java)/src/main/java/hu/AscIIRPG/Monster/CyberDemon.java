package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.util.Random;

public class CyberDemon extends Monster{

    public CyberDemon(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        Random r = new Random();
        int damage =  r.nextInt(150)+200-hero.getLevel()*4+this.getLevel()*5;
        if (damage<200) damage = 200;
        hero.setHP(hero.getHP()-damage);
        gc.addToMessage("Cyberdemon uses homing missile, causing " + damage + " damage!");
        if (hero.getHP()==0) hero.setHP(0);

        return(true);
    };
    @Override
    public boolean secondAbility(){
        return(false);
    };
}
