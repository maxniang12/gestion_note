package com.maxthiiam.gestionnote;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeliberationServlet")
public class DeliberationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                String sql = "SELECT e.INE, e.nom, e.prenoms, " +
                        "((n.noteControleContinu * 0.3) + (n.noteExamen * 0.7)) AS moyenne " +
                        "FROM Note n " +
                        "JOIN Etudiant e ON n.etudiantId = e.INE " +
                        "JOIN Module m ON n.moduleId = m.code";
                try (PreparedStatement stmt = conn.prepareStatement(sql);
                     ResultSet rs = stmt.executeQuery()) {

                    Map<String, Float> etudiantMoyennes = new HashMap<>();
                    Map<String, Integer> etudiantModulesCount = new HashMap<>();
                    Map<String, String> etudiantInfos = new HashMap<>();

                    while (rs.next()) {
                        String ine = rs.getString("INE");
                        float moyenne = rs.getFloat("moyenne");

                        // Regrouper les moyennes par étudiant
                        etudiantInfos.putIfAbsent(ine, rs.getString("nom") + " " + rs.getString("prenoms"));
                        etudiantMoyennes.put(ine, etudiantMoyennes.getOrDefault(ine, 0.0f) + moyenne);
                        etudiantModulesCount.put(ine, etudiantModulesCount.getOrDefault(ine, 0) + 1);
                    }

                    List<EtudiantResult> results = new ArrayList<>();
                    int countAdmis = 0;
                    int countTresBien = 0, countBien = 0, countAssezBien = 0, countPassable = 0, countAjourne = 0;

                    for (Map.Entry<String, Float> entry : etudiantMoyennes.entrySet()) {
                        String ine = entry.getKey();
                        float totalMoyenne = entry.getValue();
                        int moduleCount = etudiantModulesCount.get(ine);
                        float moyenneFinale = totalMoyenne / moduleCount;
                        String mention = getMention(moyenneFinale);

                        results.add(new EtudiantResult(ine, etudiantInfos.get(ine), moyenneFinale, mention));

                        if (moyenneFinale >= 10) countAdmis++;
                        switch (mention) {
                            case "Très Bien":
                                countTresBien++;
                                break;
                            case "Bien":
                                countBien++;
                                break;
                            case "Assez Bien":
                                countAssezBien++;
                                break;
                            case "Passable":
                                countPassable++;
                                break;
                            case "Ajourné":
                                countAjourne++;
                                break;
                        }
                    }

                    // Trier les résultats par moyenne
                    results.sort((r1, r2) -> Float.compare(r2.getMoyenne(), r1.getMoyenne()));

                    // Calculer les rangs
                    int rank = 1;
                    for (EtudiantResult result : results) {
                        result.setRank(rank++);
                    }

                    // Taux de réussite
                    int totalEtudiants = results.size();
                    float tauxReussite = (totalEtudiants > 0) ? (float) countAdmis / totalEtudiants * 100 : 0;

                    request.setAttribute("results", results);
                    request.setAttribute("tauxReussite", tauxReussite);
                    request.setAttribute("countTresBien", countTresBien);
                    request.setAttribute("countBien", countBien);
                    request.setAttribute("countAssezBien", countAssezBien);
                    request.setAttribute("countPassable", countPassable);
                    request.setAttribute("countAjourne", countAjourne);
                    request.getRequestDispatcher("deliberation.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Erreur SQL lors de la récupération des données.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Erreur de chargement du pilote de base de données.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    private String getMention(float moyenne) {
        if (moyenne >= 16) return "Très Bien";
        if (moyenne >= 14) return "Bien";
        if (moyenne >= 12) return "Assez Bien";
        if (moyenne >= 10) return "Passable";
        return "Ajourné";
    }

    public static class EtudiantResult {
        private String ine;
        private String nomPrenoms;
        private float moyenne;
        private String mention;
        private int rank;

        public EtudiantResult(String ine, String nomPrenoms, float moyenne, String mention) {
            this.ine = ine;
            this.nomPrenoms = nomPrenoms;
            this.moyenne = moyenne;
            this.mention = mention;
        }

        public String getIne() { return ine; }
        public String getNomPrenoms() { return nomPrenoms; }
        public float getMoyenne() { return moyenne; }
        public String getMention() { return mention; }
        public int getRank() { return rank; }
        public void setRank(int rank) { this.rank = rank; }
    }
}