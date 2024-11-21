package com.maxthiam.beans;
import java.util.*;

public class Formation {
    private String intitule;
    private String niveau;
    private List<Module> listeModules;

    // Getters
    public String getIntitule() {
        return intitule;
    }

    public String getNiveau() {
        return niveau;
    }

    public List<Module> getListeModules() {
        return listeModules;
    }

    // Setters
    public void setIntitule(String intitule) {
        this.intitule = intitule;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public void setListeModules(List<Module> listeModules) {
        this.listeModules = listeModules;
    }

}
