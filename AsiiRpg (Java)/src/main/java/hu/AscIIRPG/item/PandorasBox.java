package hu.AscIIRPG.item;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;
import hu.AscIIRPG.Monster.Monster;

import java.util.Random;

public class PandorasBox extends Item{
    public PandorasBox(int price, String name, boolean canBeUsedOnMap, boolean canBeUsedDuringBattle, boolean needsTarget, GameController gc, String descripton) {
        super(price, name, canBeUsedOnMap, canBeUsedDuringBattle, needsTarget, gc, descripton);
    }

    @Override
    public String effectWithoutTarget()
        {return null;}

    @Override
    public  String effectOnHero(Hero hero){
        Random r = new Random();
        int chance = r.nextInt(101);
        String LOL = "";
        if (chance<40){
            int toHP = r.nextInt(500)+250;
            int temp = hero.getHP();
            hero.setHP(hero.getHP()+toHP);
            if (hero.getHP()>gc.maxHP()) hero.setHP(gc.maxHP());
            LOL = gc.getName() +" gained " + (hero.getHP()-temp) + " health.";

        } else if (chance<55) {
            int toHP = r.nextInt(150)+100;
            int temp = hero.getHP();
            hero.setHP(hero.getHP()-toHP);
            if (hero.getHP()<0) hero.setHP(0) ;
            LOL = gc.getName() +" lost " + (hero.getHP()-temp) + " health.";
        } else {
            int buffNum = r.nextInt(4);
            int buffTime = r.nextInt(3)+3;
            switch (buffNum){
                case(0):
                    hero.setBerzerkTick(buffTime);
                    LOL = gc.getName() + " became a berzerker for " + (buffTime-1) + " turns!";
                    break;
                case(1):
                    hero.setBuffImmunityTick(buffTime);
                    LOL = gc.getName() + " became immuned for buffs for " + (buffTime-1) + " turns!";
                    break;
                case(2):
                    hero.setPoisonedTick(buffTime);
                    hero.setBuffImmunityTick(0);
                    LOL = gc.getName() + " became poisoned for " + (buffTime-1) + " turns!";
                    break;
                case(3):
                    hero.setSlowedTick(buffTime);
                    hero.setBuffImmunityTick(0);
                    LOL = gc.getName() + " became slowed for " + (buffTime-1) + " turns!";
                    break;
                default:
                    hero.setStunnedTick(buffTime);
                    hero.setBuffImmunityTick(0);
                    LOL = gc.getName() + " became stunned for " + (buffTime-1) + " turns!";
            }

        }

        return(LOL);
    } ;
    @Override
    public  String effectOnEnemies(Monster m){return null;}

}
