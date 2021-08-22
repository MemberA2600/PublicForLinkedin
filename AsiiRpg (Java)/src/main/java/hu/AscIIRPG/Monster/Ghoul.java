package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.util.Random;

public class Ghoul extends Monster{

    public Ghoul(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        if (this.getCurrentHP() > this.getMaxHP()-10 && this.getCurrentHP()<15) return (false);
        boolean isAnyDead = false;
        for (Monster mon : gc.getMonsters()){
            if (mon.getIsDead() == true && mon.getName().equals("Slime")==false && mon.getName().equals("Bat")==false) isAnyDead = true;
        }
        if (isAnyDead == false) return(false);
        Random r = new Random();
        int restore = r.nextInt(this.getLevel()*15)+5;
        gc.addToMessage(getName() + " restores " + restore + " health by eating from a corpse.");
        this.setCurrentHP(this.getCurrentHP()+restore);
        if (this.getCurrentHP()>this.getMaxHP()) setCurrentHP(this.getMaxHP());
        return true;
    };
    @Override
    public boolean secondAbility(){
        return(false);
    };
}
