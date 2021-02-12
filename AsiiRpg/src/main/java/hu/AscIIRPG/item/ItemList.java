package hu.AscIIRPG.item;

import hu.AscIIRPG.Armor;
import hu.AscIIRPG.GameController;
import hu.AscIIRPG.Hero;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ItemList {
    private List<Item> Items;
    private Hero hero;
    private GameController gc;
    private Item healthPotion;
    private Item scrollOfVision;
    private Key key;
    private Bomb bomb;
    private BookOfKnowledge bookOfKnowledge;
    private SoulEater soulEater;
    private BloodOfOni bloodOfOni;
    private ThunderCrack thunderCrack;
    private RaysOfLight raysOfLight;
    private HolyWater holyWater;
    private SnakeBite snakeBite;
    private PandorasBox pandorasBox;

    private ItemList(){

    }

    public void setThings(Hero hero, GameController gc){
        this.hero=hero;
        this.gc = gc;
        Items = new ArrayList<>();
        healthPotion = new HealthPotion(15, "Health Potion", true, true, false, gc, "Adds a lot to your current health and removes negative buffs");
        Items.add(healthPotion);
        scrollOfVision = new ScrollOfVision(45, "Scroll Of Vision", true, false, false, gc, "Reveals the map");
        Items.add(scrollOfVision);
        key = new Key(10, "Key", true, false, false, gc, "Opens a closed door (except for the door of the boss)");
        Items.add(key);
        bomb = new Bomb(20, "Bomb", true, true, true, gc, "Blows up walls and doors on the map, also a weapon in fights");
        Items.add(bomb);
        bookOfKnowledge = new BookOfKnowledge(25, "Book Of Knowledge", true, true, false, gc, "Gives you extra experience points");
        Items.add(bookOfKnowledge);
        soulEater = new SoulEater(50, "Soul Eater", false, true, true, gc, "Kills an enemy under your level, adding it's HP to yours. Killed enemy won't add EXP or drop item");
        Items.add(soulEater);
        bloodOfOni = new BloodOfOni(35, "Blood Of The Oni", false, true, false, gc, "Makes you go insane, extra speed and critical, but draining you health");
        Items.add(bloodOfOni);
        thunderCrack = new ThunderCrack(25, "Thundercrack", false, true, false, gc, "Deals little damage, also stuns all enemies");
        Items.add(thunderCrack);
        raysOfLight = new RaysOfLight(40, "Rays Of Light", false, true, false, gc, "Adds player buff immunity for 5 turns");
        Items.add(raysOfLight);
        holyWater = new HolyWater(30, "Holy Water", false, true, true, gc, "Super effective against Undead enemies, killing or stunning them");
        Items.add(holyWater);
        snakeBite = new SnakeBite(30, "Snakebite", false, true, true, gc, "Drains you health to deal massive damage on enemy. If monster survives will be poisoned for some turns");
        Items.add(snakeBite);
        pandorasBox = new PandorasBox(15, "Pandora's Box", false, true, false, gc, "Can heal you, damage you, give you a random buff");
        Items.add(pandorasBox);
        hero.setItemList(this);
    }

    public static ItemList getSingle_instance() {
        return single_instance;
    }
    private static ItemList single_instance = null;

    public List<Item> getItems() {
        return Items;
    }

    public static ItemList getInstance () throws IOException {
        if (single_instance == null)
            single_instance = new ItemList();

        return single_instance;
    }

    public Item getItemByName(String name){
        for (Item item : Items){
            if (item.getName().equals(name)){
                return item;
            }
        }
        return null;

    }
}
