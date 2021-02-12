package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

public class ScrollOfVision extends Item{
    public ScrollOfVision(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){
        gc.setVision();
        return("The map is revealed!");
    }
    @Override
    public String effectOnHero(Hero hero){return null;} ;
    @Override
    public String effectOnEnemies(Monster m){return null;} ;

}
