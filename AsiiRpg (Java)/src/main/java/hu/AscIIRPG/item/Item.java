package hu.AscIIRPG.item;
import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

public abstract class Item {
    protected int price;
    protected String name;
    protected boolean canBeUsedOnMap;
    protected boolean canBeUsedDuringBattle;
    protected boolean needsTarget;
    protected String descripton;
    protected GameController gc;

    public Item(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        this.name = name;
        this.price = price;
        this.canBeUsedDuringBattle = canBeUsedDuringBattle;
        this.canBeUsedOnMap =canBeUsedOnMap;
        this.descripton = descripton;
        this.gc = gc;
        this.needsTarget = needsTarget;
    }

    public boolean ifNeedsTarget(){
        return this.needsTarget;
    }

    public int getPrice() {
        return price;
    }

    public String getName() {
        return name;
    }

    public boolean canBeUsedOnMap(){
        return canBeUsedOnMap;
    }

    public boolean isCanBeUsedDuringBattle(){
        return canBeUsedDuringBattle;
    }

    public abstract String effectOnHero(Hero hero) ;
    public abstract String effectOnEnemies(Monster m) ;
    public abstract String effectWithoutTarget() ;
    public String getDescripton(){
        return this.descripton;
    }
}
