package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

public class LichKing extends Monster{

    public LichKing(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }

    @Override
    public boolean firstAbility(){
        if (gc.getMonsters().size()<3){
            int temp = gc.getMonsters().size();
            while(gc.getMonsters().size() == temp) gc.summon();
            gc.addToMessage("Lich King summons a " + gc.getMonsters().get(gc.getMonsters().size()-1).getName() + "!");
            return (true);
        }
        return(false);
    };
    @Override
    public boolean secondAbility(){
        for (Monster mon : gc.getMonsters()){
            if (mon.getIsDead() == false) continue;

            mon.setDead(false);
            mon.setCurrentHP(mon.getMaxHP());

            gc.addToMessage("Lich King resurrected "+mon.getName() + "!");
            return true;
        }

        return(false);
    };
}
