package hu.AscIIRPG;

public class Armor {
    private String name;
    private int protection;
    private int speed;
    private int price;
    private boolean onlyOne;

    public Armor(String name, int protection, int speed, int price, boolean onlyOne){
        this.name = name;
        this.protection = protection;
        this.price = price;
        this.speed = speed;
        this.onlyOne = onlyOne;

    }

    public String getName()
    {
        return(this.name);
    }

    public int getProtection()
    {
        return(this.protection);
    }

    public int getSpeed(){
        return(this.speed);
    }

    public boolean getOnlyOne(){
        return(this.onlyOne);
    }

    public int getPrice() {
        return price;
    }
}
