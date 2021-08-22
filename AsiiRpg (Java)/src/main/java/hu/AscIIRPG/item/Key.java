package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;


public class Key extends Item{
    public Key(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){
        gc.gcHero().getInventory().get("Item").add("Key");
        return ("You don't have to 'use' this item, just enter a door!");

    }
    @Override
    public  String effectOnHero(Hero hero){return null;} ;
    @Override
    public  String effectOnEnemies(Monster m){return null;} ;

}