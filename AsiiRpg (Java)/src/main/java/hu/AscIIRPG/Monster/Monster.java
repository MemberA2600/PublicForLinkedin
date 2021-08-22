package hu.AscIIRPG.Monster;
import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.util.Currency;
import java.util.Random;

public abstract class Monster {
    private String name;
    private int level;
    private int damage;
    private double criticalChance;
    private int armor;
    private int speed;
    private boolean isABoss;
    private int MaxHP;
    private int currentHP;
    protected Hero hero;
    private boolean isDead;
    private Integer slowedTick;
    private Integer stunnedTick;
    private Integer poisonedTick;
    private Integer berzerkTick;
    private Integer buffImmunityTick;
    protected GameController gc;
    private String identity;

    public Monster(String name, int HP, int damage, double criticalChance, int armor, int speed, boolean isABoss, Hero hero, GameController gc) {
        this.gc = gc;
        this.hero = hero;
        this.name = name;
        this.identity = name;
        this.isDead = false;
        this.isABoss = isABoss;
        this.armor = armor;
        this.speed = speed;
        this.damage = damage;
        this.criticalChance = criticalChance;
        Random r = new Random();
        if (isABoss == false) {
            int min = hero.getLevel() - 4;
            if (min < 1) min = 1;
            int max = hero.getLevel() + 1;
            if (max > 10) max = 10;
            this.level = r.nextInt(max - min) + min;
        } else {
            int min = hero.getLevel()+1;
            if (min<6) min = 6;
            int max = hero.getLevel() + 4;
            if (max<min) max = min+1;

            this.level = r.nextInt(max - min) + min;
        }
        this.MaxHP = HP;
        this.currentHP = getMaxHP();

        slowedTick = 0;
        stunnedTick = 0;
        poisonedTick = 0;
        berzerkTick = 0;
        buffImmunityTick = 0;
    }

    public void Immunity() {
        slowedTick = 0;
        stunnedTick = 0;
        poisonedTick = 0;
        berzerkTick = 0;
    }


    public boolean getSlowedTick() {
        if (this.slowedTick == 0) return false;
        return true;
    }

    public boolean getStunnedTick() {
        if (this.stunnedTick == 0) return false;
        return true;
    }

    public boolean getPoisonedTick() {
        if (this.poisonedTick == 0) return false;
        return true;
    }

    public boolean getBerzerkTick() {
        if (this.berzerkTick == 0) return false;
        return true;
    }

    public boolean getBuffImmunityTick() {
        if (this.buffImmunityTick == 0) return false;
        return true;
    }

    public void decSlowedTick() {
        this.slowedTick--;
    }

    public void decPoisonedTick() {
        this.poisonedTick--;
    }

    public void decBerzerkTick() {
        if (this.currentHP < 10) {
            berzerkTick = 0;
        } else {
            berzerkTick--;
        }
    }

    public void decBuffImmunityTick() {
        this.buffImmunityTick--;
    }

    public void decStunnedTick() {
        this.stunnedTick--;
    }

    public void setStunnedTick(Integer stunnedTick) {
        this.stunnedTick = stunnedTick;
    }

    public void setBuffImmunityTick(Integer buffImmunityTick) {
        this.buffImmunityTick = buffImmunityTick;
    }

    public void setBerzerkTick(Integer berzerkTick) {
        this.berzerkTick = berzerkTick;
    }

    public void setPoisonedTick(Integer poisonedTick) {
        this.poisonedTick = poisonedTick;
    }

    public void setSlowedTick(Integer slowedTick) {
        this.slowedTick = slowedTick;
    }

    public boolean getIsDead() {
        return isDead;
    }

    public int getLevel() {
        return this.level;
    }

    private double calculator(double value, double multi) {
        return (value * ((double) (level * 1.03) * multi));
    }

    public int getMaxHP() {
        return ((int) Math.round(calculator((double) this.MaxHP, 0.9)));
    }

    public int getDamage() {
        return ((int) Math.round(calculator((double) this.damage, 0.9)));
    }

    public int getArmor() {
        return ((int) Math.round(calculator((double) this.armor + (this.level - 1) * 0.1, 0.60)));
    }

    public int getSpeed() {
        double num = 1.05;

        if (getSlowedTick() == true) {
            num -= 0.95;
        } else if (getBerzerkTick() == true) {
            num += 0.55;

        }

        return ((int) Math.round(calculator((double) this.speed, num)));
    }

    public double getCriticalChance() {
        if (getBerzerkTick() == true) {
            double temp = this.criticalChance + 0.50;
            if (temp > 1.0) temp = 1.0;
            return (temp);


        } else {
            return (this.criticalChance);
        }
    }

    public String getName() {
        return (this.name);
    }

    public boolean isABoss() {
        return (this.isABoss);
    }

    public int getCurrentHP() {
        return currentHP;
    }

    public abstract boolean firstAbility();

    public abstract boolean secondAbility();

    public void setCurrentHP(int currentHP) {
        this.currentHP = currentHP;
    }

    public void setDead(boolean dead) {
        isDead = dead;
    }

    public void setMaxHP(int maxHP) {
        MaxHP = maxHP;
        this.currentHP = maxHP;
    }

    public void setDamage(int damage) {
        this.damage = damage;
    }

    public void setArmor(int armor) {
        this.armor = armor;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }


    public int[] addDataToShapeShifter() {
        int[] things = new int[4];
        things[0] = this.MaxHP;
        things[1] = this.damage;
        things[2] = this.armor;
        things[3] = this.speed;

        return things;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

}