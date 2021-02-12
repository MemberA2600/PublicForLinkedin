package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

public class BloodOfOni extends Item{
    public BloodOfOni(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){return null;}
    @Override
    public  String effectOnHero(Hero hero){
        gc.gcHero().setBerzerkTick(6);
        return(gc.getName() + " became berzerk for 3 turns!");
    } ;
    @Override
    public  String effectOnEnemies(Monster m)
    {return null;}
}
