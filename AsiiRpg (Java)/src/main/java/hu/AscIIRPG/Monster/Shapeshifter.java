package hu.AscIIRPG.Monster;

import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Shapeshifter extends Monster{

    public Shapeshifter(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc){
        super(name, HP, damage, criticalChance, armor, speed, isABoss, hero, gc);
    }
    @Override
    public boolean firstAbility(){
        Map<String, List<Integer>> combined = new HashMap<>();

        //Own stuff
        combined.put("self", new ArrayList<>());
        combined.get("self").add(this.getCurrentHP());
        combined.get("self").add(this.getDamage());
        combined.get("self").add(this.getArmor());
        combined.get("self").add(this.getSpeed());

        //Monsters

        for (Monster mon : gc.getMonsters()){
            if (mon.getName().equals(getIdentity())) continue;
            String name = "";
            if (combined.containsKey(mon.getName())){
                name = mon.getName() + "_1";
                if (combined.containsKey(mon.getName() + "_1")) name = mon.getName() + "_2";
            } else {
                name = mon.getName();
            }

            int[] things = mon.addDataToShapeShifter();

            combined.put(name, new ArrayList<>());
            combined.get(name).add(things[0]);
            combined.get(name).add(things[1]);
            combined.get(name).add(things[2]);
            combined.get(name).add(things[3]);

        }

        String largestName = "";
        int tempSum = 0 ;
        int tempSumSave = 0 ;


        for (String mon : combined.keySet()){
            tempSum = combined.get(mon).get(0) + combined.get(mon).get(1)*10 + combined.get(mon).get(2)*10+combined.get(mon).get(3)*10;
            if (tempSumSave<tempSum){
                tempSumSave = tempSum;
                largestName = mon;
            }
        }
        String name = "";
        if (largestName == "self"){
            return(false);
        } else {
            name = largestName.replace("_1", "").replace("_2", "");
            int num = (int) Math.round(getCurrentHP()/getMaxHP());
            this.setMaxHP(combined.get(largestName).get(0));
            this.setCurrentHP(combined.get(largestName).get(0)*num);

            this.setDamage(combined.get(largestName).get(1));
            this.setArmor(combined.get(largestName).get(2));
            this.setSpeed(combined.get(largestName).get(3));

            gc.addToMessage("Shapeshifter copies "+name + "!");

        }
        setIdentity(name);
        return(true);
    };
    @Override
    public boolean secondAbility(){
        switch(getIdentity()){
            case("Slime"):
                Slime test1 = new Slime("Shapeshifter", 70, 2, 0.02, 15, 4, false, this.hero, this.gc);
                return(test1.firstAbility());
            case("Ghoul"):
                Ghoul test2 = new Ghoul("Shapeshifter", 35, 6, 0.1, 0, 5, false, this.hero, this.gc);
                return(test2.firstAbility());
            case("Ogre"):
                Ogre test3 = new Ogre("Shapeshifter", 130, 16, 0.20, 2, 3, false, this.hero, this.gc);
                return(test3.firstAbility());
            case("Manticore"):
                Manticore test4 = new Manticore("Shapeshifter", 220, 30, 0.21, 7, 4, false, this.hero, this.gc);
                return(test4.firstAbility());
            case("MindFlayer"):
                MindFlayer test5 = new MindFlayer("Shapeshifter", 290, 22, 0.60, 3, 7, false, this.hero, this.gc);
                return(test5.firstAbility());
            case("Lich"):
                Lich test6 = new Lich("Shapeshifter", 180, 20, 0.35, 3, 8, false, this.hero, this.gc);
                return(test6.firstAbility());
            case("Dragonling"):
                Dragonling test7= new Dragonling("Shapeshifter", 400, 25, 0.35, 14, 6, false, this.hero, this.gc);
                return(test7.secondAbility());
            case("Archvile"):
                Archvile test8 = new Archvile("Shapeshifter", 320, 18, 0.40, 1, 10, false, this.hero, this.gc);
                return(test8.firstAbility());
            default:
                return (false);
        }
    };
}
