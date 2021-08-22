package hu.AscIIRPG;

public class Weapon{
    private String name;
    private int damage;
    private int speed;
    private double criticalChance;
    private int price;
    private boolean onlyOne;

    public Weapon(String name, int damage, int speed, double criticalChance, int price, boolean one){
        this.name = name;
        this.damage = damage;
        this.speed = speed;
        this.criticalChance = criticalChance;
        this.price = price;
        this.onlyOne = one;
    }
    public boolean getOnlyOne(){return onlyOne; }
    public String getName(){
        return this.name;
    }
    public int getDamage(){
        return this.damage;
    }
    public int getSpeed(){
        return this.speed;
    }
    public double getCriticalChance(){
        return this.criticalChance;
    }
    public int getPrice(){
        return this.price;
    }

}
