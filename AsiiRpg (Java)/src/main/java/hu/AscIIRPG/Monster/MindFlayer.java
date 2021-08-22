package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

public class MindFlayer extends Monster{

    public MindFlayer(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        if (hero.getStunnedTick()==true){
            return(false);
        }
        int num = this.getLevel()-hero.getLevel();
        if (num<2) num = 2;
        gc.addToMessage(getName() +" uses mind-control on "+gc.getName() +" for " +(num-1)+ " turns.");

        return(true);
    };
    @Override
    public boolean secondAbility(){
        if (this.getCurrentHP() > this.getMaxHP()-20 && this.getCurrentHP()<25){
            for (Monster mon : gc.getMonsters()){
                if (mon.getIsDead() == true) continue;
                if (mon == this || mon.getName().equals("Bat") || mon.getName().equals("Slime") || mon.getName().equals("Skeleton")) continue;
                if (mon.getLevel()>this.getLevel() || mon.getCurrentHP()>this.getMaxHP()) continue;

                gc.addToMessage("Mind Flayer consumes the brain of "+ mon.getName() + ", healing himself by the HP of the victim.");
                this.setCurrentHP(getCurrentHP()+mon.getCurrentHP());
                if (this.getCurrentHP()>this.getMaxHP()) setCurrentHP(getCurrentHP());
                mon.setDead(true);
                mon.setCurrentHP(0);

            }
        }
        return(false);
    };
}
