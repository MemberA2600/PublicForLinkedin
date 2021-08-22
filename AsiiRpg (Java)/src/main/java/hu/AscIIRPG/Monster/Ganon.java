package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.util.Random;

public class Ganon extends Monster{

    public Ganon(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        int damage = gc.calculateD(getDamage(), getLevel(), gc.calculateArmor(), hero.getLevel(), getCriticalChance(), hero.getHP());
        damage = (int) Math.round(damage*1.5);
        hero.setHP(hero.getHP() - damage);
        gc.addToMessage("Ganon uses teleport to trick " + gc.getName() + ", dealing " + damage + " damage!");
        if (hero.getHP()==0) hero.setHP(0);

        return(true);
    };
    @Override
    public boolean secondAbility(){
        if (hero.getBuffImmunityTick() == false && hero.getStunnedTick()== false)
        {
            Random r = new Random();
            int rrr = r.nextInt(15)-hero.getLevel();
            if (rrr<5) rrr=5;
            gc.addToMessage("Ganon uses barriers to stun " + gc.getName() + " for " + (rrr-1) + " turns!");
            hero.setStunnedTick(rrr);
            return (true);
        }
        return(false);
    };
}
