package hu.AscIIRPG.item;
import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

import java.util.Random;


public class HealthPotion extends Item {

    public HealthPotion(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectOnHero(Hero hero) {
        Random r = new Random();
        int per = r.nextInt(25)+25;
        hero.setHP(Math.round((float) (hero.getHP() + Math.round(gc.maxHP()*per/100.0))));
        if (hero.getHP() > gc.maxHP()) hero.setHP(gc.maxHP());

        gc.gcHero().setPoisonedTick(0);
        gc.gcHero().setSlowedTick(0);
        return ("You were healed by "+ per + "%! Also removed negative buffs.");
    }
    @Override
    public String effectOnEnemies(Monster m){return null;} ;
    @Override
    public String effectWithoutTarget(){return null;} ;
}
