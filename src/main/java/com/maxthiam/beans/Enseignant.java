package com.maxthiam.beans;
import java.util.*;

public class Enseignant {

    private String matricule;
    private String prenoms;
    private String nom;
    private String dateNaissance;
    private String sexe;
    private String grade;
    private String specialite;
    private String adresse;
    private String adresseEmail;
    private String bureau;
    private String institutionRattachement;
    private List<Etudiant> etudiants;


    // Getters
    public String getMatricule() {
        return matricule;
    }

    public String getPrenoms() {
        return prenoms;
    }

    public String getNom() {
        return nom;
    }

    public String getDateNaissance() {
        return dateNaissance;
    }

    public String getSexe() {
        return sexe;
    }

    public String getGrade() {
        return grade;
    }

    public String getSpecialite() {
        return specialite;
    }

    public String getAdresse() {
        return adresse;
    }

    public String getAdresseEmail() {
        return adresseEmail;
    }

    public String getBureau() {
        return bureau;
    }

    public String getInstitutionRattachement() {
        return institutionRattachement;
    }

    // Setters
    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public void setPrenoms(String prenoms) {
        this.prenoms = prenoms;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setDateNaissance(String dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public void setSpecialite(String specialite) {
        this.specialite = specialite;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public void setAdresseEmail(String adresseEmail) {
        this.adresseEmail = adresseEmail;
    }

    public void setBureau(String bureau) {
        this.bureau = bureau;
    }

    public void setInstitutionRattachement(String institutionRattachement) {
        this.institutionRattachement = institutionRattachement;
    }

    public List<Etudiant> getEtudiants() {
        return etudiants;
    }

    public void setEtudiants(List<Etudiant> etudiants) {
        this.etudiants = etudiants;
    }
}