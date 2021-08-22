package hu.AscIIRPG;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ArmorList {

    private Armor leatherArmor;
    private Armor scaleArmor;
    private Armor lamellarArmor;
    private Armor mailArmor;
    private Armor plateArmor;
    private Armor babreBayan;
    private Armor kavacha;
    private List<Armor> Armors;

    private ArmorList(){
        Armors = new ArrayList<>();
        leatherArmor = new Armor("Leather Armor", 0, 0, 5, false);
        Armors.add(leatherArmor);
        scaleArmor = new Armor("Scale Armor", 2, 0, 10, false);
        Armors.add(scaleArmor);
        lamellarArmor = new Armor("Lamellar Armor", 3, 0, 15, false);
        Armors.add(lamellarArmor);
        mailArmor = new Armor("Mail Armor", 5, -2, 20, false);
        Armors.add(mailArmor);
        plateArmor = new Armor("Plate Armor", 8, -3, 25, false);
        Armors.add(plateArmor);
        babreBayan = new Armor("Babr-e Bayan", 15, 0, 55, true);
        Armors.add(babreBayan);
        kavacha = new Armor("Kavacha", 11, 2, 65, true);
        Armors.add(kavacha);


    }

    public List<Armor> getArmors() {
        return Armors;
    }

    public static ArmorList getSingle_instance() {
        return single_instance;
    }
    private static ArmorList single_instance = null;

    public static ArmorList getInstance () throws IOException {
        if (single_instance == null)
            single_instance = new ArmorList();

        return single_instance;
    }

    public Armor getLeatherArmor() {
        return leatherArmor;
    }

    public Armor getBabreBayan() {
        return babreBayan;
    }

    public Armor getKavacha() {
        return kavacha;
    }

    public Armor getLamellarArmor() {
        return lamellarArmor;
    }

    public Armor getMailArmor() {
        return mailArmor;
    }

    public Armor getPlateArmor() {
        return plateArmor;
    }

    public Armor getScaleArmor() {
        return scaleArmor;
    }

    public Armor getArmorByName(String name){
        for (Armor armor : Armors){
            if (armor.getName().equals(name)){
                return armor;
            }
        }
        return null;

    }
}