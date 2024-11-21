package com.maxthiam.beans;
import java.util.*;

public class Module {
    private String code;
    private String intitule;
    private int volumeHoraire;
    private double coefficient;
    private int nombreCredits;
    private Enseignant responsable;

    // Getters
    public String getCode() {
        return code;
    }

    public String getIntitule() {
        return intitule;
    }

    public int getVolumeHoraire() {
        return volumeHoraire;
    }

    public double getCoefficient() {
        return coefficient;
    }

    public int getNombreCredits() {
        return nombreCredits;
    }

    public Enseignant getResponsable() {
        return responsable;
    }

    // Setters
    public void setCode(String code) {
        this.code = code;
    }

    public void setIntitule(String intitule) {
        this.intitule = intitule;
    }

    public void setVolumeHoraire(int volumeHoraire) {
        this.volumeHoraire = volumeHoraire;
    }

    public void setCoefficient(double coefficient) {
        this.coefficient = coefficient;
    }

    public void setNombreCredits(int nombreCredits) {
        this.nombreCredits = nombreCredits;
    }

    public void setResponsable(Enseignant responsable) {
        this.responsable = responsable;
    }
}
