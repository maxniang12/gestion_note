package com.maxthiiam.gestionnote;

import com.maxthiam.beans.Enseignant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ListeDesEnseignantsParFormationServlet")
public class ListeDesEnseignantsParFormationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String formationId = request.getParameter("formationId");
        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";

        List<Enseignant> enseignantsIntervenant = new ArrayList<>();
        List<Enseignant> enseignantsInscrits = new ArrayList<>();

        try {
            // Chargement du driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Driver JDBC non trouvé", e);
        }

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            // Récupération des modules de la formation
            List<String> modules = new ArrayList<>();
            String sqlModules = "SELECT m.intitule " +
                    "FROM Module m " +
                    "JOIN Formation_Module fm ON m.code = fm.module_id " +
                    "WHERE fm.formation_id = ?";
            try (PreparedStatement stmtModules = conn.prepareStatement(sqlModules)) {
                stmtModules.setString(1, formationId);
                try (ResultSet rsModules = stmtModules.executeQuery()) {
                    while (rsModules.next()) {
                        modules.add(rsModules.getString("intitule"));
                    }
                }
            }

            // Récupération des enseignants intervenant dans la formation
            String sqlEnseignantsIntervenant = "SELECT e.matricule, e.prenoms, e.nom, e.dateNaissance, e.sexe, e.grade, e.specialite, e.adresse, e.adresseEmail, e.bureau, e.institutionRattachement " +
                    "FROM Enseignant e " +
                    "JOIN formation_enseignant fe ON e.matricule = fe.enseignant_code " +
                    "WHERE fe.formation_id = ?";
            try (PreparedStatement stmtIntervenant = conn.prepareStatement(sqlEnseignantsIntervenant)) {
                stmtIntervenant.setString(1, formationId);
                try (ResultSet rsIntervenant = stmtIntervenant.executeQuery()) {
                    while (rsIntervenant.next()) {
                        Enseignant enseignant = new Enseignant();
                        enseignant.setMatricule(rsIntervenant.getString("matricule"));
                        enseignant.setPrenoms(rsIntervenant.getString("prenoms"));
                        enseignant.setNom(rsIntervenant.getString("nom"));
                        enseignant.setDateNaissance(rsIntervenant.getDate("dateNaissance").toString());
                        enseignant.setSexe(rsIntervenant.getString("sexe"));
                        enseignant.setGrade(rsIntervenant.getString("grade"));
                        enseignant.setSpecialite(rsIntervenant.getString("specialite"));
                        enseignant.setAdresse(rsIntervenant.getString("adresse"));
                        enseignant.setAdresseEmail(rsIntervenant.getString("adresseEmail"));
                        enseignant.setBureau(rsIntervenant.getString("bureau"));
                        enseignant.setInstitutionRattachement(rsIntervenant.getString("institutionRattachement"));
                        enseignantsIntervenant.add(enseignant);
                    }
                }
            }

            // Récupération des enseignants inscrits dans la formation
            String sqlEnseignantsInscrits = "SELECT e.matricule, e.prenoms, e.nom, e.dateNaissance, e.sexe, e.grade, e.specialite, e.adresse, e.adresseEmail, e.bureau, e.institutionRattachement " +
                    "FROM Enseignant e " +
                    "WHERE e.specialite IN (";
            for (int i = 0; i < modules.size(); i++) {
                sqlEnseignantsInscrits += "?";
                if (i < modules.size() - 1) {
                    sqlEnseignantsInscrits += ", ";
                }
            }
            sqlEnseignantsInscrits += ")";
            try (PreparedStatement stmtInscrits = conn.prepareStatement(sqlEnseignantsInscrits)) {
                for (int i = 0; i < modules.size(); i++) {
                    stmtInscrits.setString(i + 1, modules.get(i));
                }
                try (ResultSet rsInscrits = stmtInscrits.executeQuery()) {
                    while (rsInscrits.next()) {
                        Enseignant enseignant = new Enseignant();
                        enseignant.setMatricule(rsInscrits.getString("matricule"));
                        enseignant.setPrenoms(rsInscrits.getString("prenoms"));
                        enseignant.setNom(rsInscrits.getString("nom"));
                        enseignant.setDateNaissance(rsInscrits.getDate("dateNaissance").toString());
                        enseignant.setSexe(rsInscrits.getString("sexe"));
                        enseignant.setGrade(rsInscrits.getString("grade"));
                        enseignant.setSpecialite(rsInscrits.getString("specialite"));
                        enseignant.setAdresse(rsInscrits.getString("adresse"));
                        enseignant.setAdresseEmail(rsInscrits.getString("adresseEmail"));
                        enseignant.setBureau(rsInscrits.getString("bureau"));
                        enseignant.setInstitutionRattachement(rsInscrits.getString("institutionRattachement"));
                        enseignantsInscrits.add(enseignant);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Erreur lors de l'accès à la base de données", e);
        }

        request.setAttribute("enseignantsIntervenant", enseignantsIntervenant);
        request.setAttribute("enseignantsInscrits", enseignantsInscrits);
        request.getRequestDispatcher("listeEnseignantIntervenantAuneFormation.jsp").forward(request, response);
    }
}
