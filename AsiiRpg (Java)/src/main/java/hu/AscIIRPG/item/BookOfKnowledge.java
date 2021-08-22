package hu.AscIIRPG.item;
import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

public class BookOfKnowledge extends Item {

    public BookOfKnowledge(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectOnHero(Hero hero) {
        int temp = hero.getLevel()*25;
        hero.setEXP(hero.getEXP()+temp);
        return ("You gained "+temp+" EXP!");
    }
    @Override
    public String effectOnEnemies(Monster m){return null;} ;
    @Override
    public String effectWithoutTarget(){return null;} ;
}
