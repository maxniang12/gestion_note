package com.maxthiam.beans;

import java.util.ArrayList;
import java.util.List;

public class Etudiant {
    private String INE;
    private String prenoms;
    private String nom;
    private String dateNaissance;
    private String sexe;
    private String adresse;
    private String adresseEmail;
    private List<Note> notes;

    // Getters
    public String getINE() {
        return INE;
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

    public String getAdresse() {
        return adresse;
    }

    public String getAdresseEmail() {
        return adresseEmail;
    }

    public List<Note> getNotes() {
        return notes;
    }

    // Setters
    public void setINE(String ine) {
        this.INE = ine;
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

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public void setAdresseEmail(String adresseEmail) {
        this.adresseEmail = adresseEmail;
    }

    public void setNotes(List<Note> notes) {
        this.notes = notes;
    }

    // Constructeur par défaut
    public Etudiant() {}

    // Constructeur avec tous les champs
    public Etudiant(String INE, String prenoms, String nom, String dateNaissance, String sexe, String adresse, String adresseEmail) {
        this.INE = INE;
        this.prenoms = prenoms;
        this.nom = nom;
        this.dateNaissance = dateNaissance;
        this.sexe = sexe;
        this.adresse = adresse;
        this.adresseEmail = adresseEmail;
    }

    // Méthode utilitaire pour ajouter une note
    public void ajouterNote(Note note) {
        if (this.notes == null) {
            this.notes = new ArrayList<>();
        }
        this.notes.add(note);
    }

    // Méthode pour obtenir une note pour un module spécifique
    public Note getNoteForModule(String moduleId) {
        if (notes != null) {
            for (Note note : notes) {
                if (note.getModuleId().equals(moduleId)) {
                    return note;
                }
            }
        }
        return null; // Retourner null si aucune note n'est trouvée pour le module donné
    }

    // Méthode utilitaire pour afficher les informations de l'étudiant
    @Override
    public String toString() {
        return "Etudiant{" +
                "INE='" + INE + '\'' +
                ", prenoms='" + prenoms + '\'' +
                ", nom='" + nom + '\'' +
                ", dateNaissance='" + dateNaissance + '\'' +
                ", sexe='" + sexe + '\'' +
                ", adresse='" + adresse + '\'' +
                ", adresseEmail='" + adresseEmail + '\'' +
                ", notes=" + notes +
                '}';
    }
}
