package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

public class RaysOfLight extends Item{
    public RaysOfLight(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){return null;}
    @Override
    public  String effectOnHero(Hero hero){
        gc.gcHero().setBuffImmunityTick(6);
        return(gc.getName() + " became immuned to buffs for 5 turns!");
    } ;
    @Override
    public  String effectOnEnemies(Monster m)
    {return null;}
}
