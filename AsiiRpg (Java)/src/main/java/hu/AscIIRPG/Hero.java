package hu.AscIIRPG;

import hu.AscIIRPG.item.ItemList;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Hero
{
    private Integer HP;
    private Integer level;
    private Integer EXP;
    private Integer money;
    private Double criticalChance;
    private Integer[] position;
    private Map<String, List<String>> inventory;
    private WeaponList weaponList;
    private Weapon currentWeapon;
    private ArmorList armorList;
    private Armor currentArmor;
    private ItemList itemList;
    private Integer slowedTick;
    private Integer stunnedTick;
    private Integer poisonedTick;
    private Integer berzerkTick;
    private Integer buffImmunityTick;

    private Hero(WeaponList weaponList, ArmorList armorList, ItemList itemList)
    {
        setToDefault();
        position = new Integer[2];
        inventory = new HashMap<>();
        this.weaponList = weaponList;
        this.armorList = armorList;
        this.itemList = itemList;
        this.currentWeapon = weaponList.getClub();
        this.currentArmor = armorList.getLeatherArmor();
        inventory.put("Weapon", new ArrayList<>());
        inventory.put("Armor", new ArrayList<>());
        inventory.put("Item", new ArrayList<>());

    }

    public void setToDefault(){
        HP = 150;
        level = 1;
        EXP = 0;
        money = 0;
        criticalChance = 0.05;
        buffImmunityTick = 0;
        Immunity();
    }

    public void Immunity(){
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
        return true;    }

    public boolean getPoisonedTick() {
        if (this.poisonedTick == 0) return false;
        return true;    }

    public boolean getBerzerkTick() {
        if (this.berzerkTick == 0) {
            return false;
        }
        return true;    }

    public boolean getBuffImmunityTick() {
        if (this.buffImmunityTick == 0) return false;
        return true;    }

    public void decSlowedTick() {
        this.slowedTick--;
    }

    public void decPoisonedTick() {
        this.poisonedTick--;
    }

    public void decBerzerkTick() {
        if (this.HP<10) {
            berzerkTick = 0;
        } else {
        this.berzerkTick--;
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

    public ArmorList getArmorList() {
        return armorList;
    }

    public WeaponList getWeaponList() {
        return weaponList;
    }

    public ItemList getItemList(){return itemList;}

    public Map<String, List<String>> getInventory() {
        return inventory;
    }

    public static Hero getSingle_instance() {
        return single_instance;
    }

    public Integer getHP(){
        return HP;
    }

    public Integer getLevel(){
        return level;
    }

    public Integer getEXP(){
        return EXP;
    }

    public Integer getMoney(){
        return money;
    }

    public Double getCriticalChance(){
        if (getBerzerkTick() == true) {
            double temp = this.criticalChance + 0.50;
            if (temp>1.0) temp = 1.0;
            return (temp);
        } else {
            return (this.criticalChance);}

    }

    public Integer[] getPosition(){
        return position;
    }

    public void setPosition(int x, int y){
        this.position[0] = x;
        this.position[1] = y;

    }

    public Armor getCurrentArmor() {
        return currentArmor;
    }

    public Weapon getCurrentWeapon() {
        return currentWeapon;
    }

    public void setHP(Integer data)
    {
        this.HP = data;
    }

    public void setLevel(Integer data)
    {
        this.level = data;
    }

    public void setEXP(Integer data)
    {
        this.EXP = data;
    }

    public void setMoney(Integer data)
    {
        this.money = data;
    }

    public void setCriticalChance(Double data)
    {
        this.criticalChance = data;
    }

    public void setCurrentArmor(Armor currentArmor) {
        this.currentArmor = currentArmor;
    }

    public void setCurrentWeapon(Weapon currentWeapon) {
        this.currentWeapon = currentWeapon;
    }

    private static Hero single_instance = null;

    public static Hero getInstance(WeaponList weaponList, ArmorList armorList, ItemList itemList) throws IOException {
        if (single_instance == null)
            single_instance = new Hero(weaponList, armorList, itemList);

        return single_instance;
    }

    public void setItemList(ItemList itemList) {
        this.itemList = itemList;
    }
}
