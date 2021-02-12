package hu.AscIIRPG;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WeaponList {
    private Weapon club;
    private Weapon sword;
    private Weapon handAxe;
    private Weapon battleAxe;
    private Weapon dagger;
    private Weapon glaive;
    private Weapon morningStar;
    private Weapon scythe;
    private Weapon spear;
    private Weapon saber;
    private Weapon excalibur;
    private Weapon mjolnir;
    private Weapon tombogiri;
    private List<Weapon> Weapons;

    public static WeaponList getSingle_instance() {
        return single_instance;
    }
    private static WeaponList single_instance = null;

    private WeaponList(){
        Weapons = new ArrayList<>();

        club= new Weapon("Club", 0, 0, 0.0, 5 , false);
        Weapons.add(club);
        sword = new Weapon("Sword", 7, -1, 0.1, 10 , false);
        Weapons.add(sword);
        handAxe = new Weapon("Handaxe", 10, 2, 0.15, 20 , false);
        Weapons.add(handAxe);
        battleAxe = new Weapon("Battleaxe", 22, -3, 0.35, 40 , false);
        Weapons.add(battleAxe);
        dagger = new Weapon("Dagger", 9, 2, 0.2, 15 , false);
        Weapons.add(dagger);
        glaive = new Weapon("Glaive", 16, 4, 0.15, 50 , false);
        Weapons.add(glaive);
        morningStar = new Weapon("Morningstar", 7, 1, 0.05, 10 , false);
        Weapons.add(morningStar);
        scythe = new Weapon("Scythe", 25, -3, 0.45, 50 , false);
        Weapons.add(scythe);
        spear = new Weapon("Spear", 17, 2, 0.25, 40 , false);
        Weapons.add(spear);
        saber = new Weapon("Saber", 29, 1, 0.2, 45 , false);
        Weapons.add(saber);
        excalibur = new Weapon("Excalibur", 55, 4, 0.55, 100 , true);
        Weapons.add(excalibur);
        mjolnir = new Weapon("Mjölnir", 68, 8, 0.75, 225 , true);
        Weapons.add(mjolnir);
        tombogiri = new Weapon("Tombogiri", 34, 12, 0.35, 150 , true);
        Weapons.add(tombogiri);
    }

    public List<Weapon> getWeapons() {
        return Weapons;
    }

    public static WeaponList getInstance () throws IOException {
        if (single_instance == null)
            single_instance = new WeaponList();

        return single_instance;
    }

    public Weapon getClub(){
        return club;
    }
    public Weapon getSword(){
        return sword;
    }
    public Weapon getHandAxe(){
        return handAxe;
    }
    public Weapon getBattleAxe(){
        return battleAxe;
    }
    public Weapon getDagger(){
        return dagger;
    }
    public Weapon getGlaive(){
        return glaive;
    }
    public Weapon getMorningStar(){
        return morningStar;
    }
    public Weapon getScythe(){
        return scythe;
    }
    public Weapon getSpear(){
        return spear;
    }
    public Weapon getSaber(){
        return saber;
    }
    public Weapon getExcalibur(){
        return excalibur;
    }
    public Weapon getMjolnir(){
        return mjolnir;
    }
    public Weapon getTombogiri(){
        return tombogiri;
    }

    public Weapon getWeaponByName(String name){
        for (Weapon weapon : Weapons){
            if (weapon.getName().equals(name)){
                return weapon;
            }
        }
        return null;

    }

}
