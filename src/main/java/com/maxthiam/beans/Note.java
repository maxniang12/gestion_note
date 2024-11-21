package com.maxthiam.beans;

public class Note {

    private int noteId;
    private String etudiantId; // L'identifiant de l'étudiant
    private String moduleId;   // L'identifiant du module
    private Double noteControleContinu; // Note du contrôle continu
    private Double noteExamen; // Note de l'examen

    // Constructeur par défaut
    public Note() {}

    // Constructeur complet
    public Note(int noteId, String etudiantId, String moduleId, Double noteControleContinu, Double noteExamen) {
        this.noteId = noteId;
        this.etudiantId = etudiantId;
        this.moduleId = moduleId;
        this.noteControleContinu = noteControleContinu;
        this.noteExamen = noteExamen;
    }

    // Getters et setters
    public int getNoteId() { return noteId; }
    public void setNoteId(int noteId) { this.noteId = noteId; }

    public String getEtudiantId() { return etudiantId; }
    public void setEtudiantId(String etudiantId) { this.etudiantId = etudiantId; }

    public String getModuleId() { return moduleId; }
    public void setModuleId(String moduleId) { this.moduleId = moduleId; }

    public Double getNoteControleContinu() { return noteControleContinu; }
    public void setNoteControleContinu(Double noteControleContinu) { this.noteControleContinu = noteControleContinu; }

    public Double getNoteExamen() { return noteExamen; }
    public void setNoteExamen(Double noteExamen) { this.noteExamen = noteExamen; }
}
