package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

public class SoulEater extends Item{
    public SoulEater(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget(){return null;}
    @Override
    public  String effectOnHero(Hero hero){return null;} ;
    @Override
    public  String effectOnEnemies(Monster m)
    {
        if (m.getLevel()>gc.gcHero().getLevel() || m.isABoss() == true){
            gc.gcHero().getInventory().get("Item").add("Soul Eater");
            return(m.getName()+ " is too strong to be killed with this item!");

        } else {
            gc.gcHero().setHP(gc.gcHero().getHP()+m.getCurrentHP());
            if (gc.gcHero().getHP()>gc.maxHP()) gc.gcHero().setHP(gc.maxHP());
            m.setCurrentHP(0);
            m.setDead(true);
            return (gc.getName() + " turned " + m.getName() +" into ashes! (this won't give any EXP)");
        }
    }
}
