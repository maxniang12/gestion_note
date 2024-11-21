package com.maxthiiam.gestionnote;

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

@WebServlet("/DesinscrireEtudiantFormationServlet")
public class DesinscrireEtudiantFormationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String formationId = request.getParameter("formationId");
        String etudiantId = request.getParameter("etudiantId");

        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur de chargement du pilote JDBC.");
            request.getRequestDispatcher("ajouterFormation.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sqlDelete = "DELETE FROM Etudiant_Formation WHERE etudiant_id = ? AND formation_id = ?";
            try (PreparedStatement stmtDelete = conn.prepareStatement(sqlDelete)) {
                stmtDelete.setString(1, etudiantId);
                stmtDelete.setString(2, formationId);
                stmtDelete.executeUpdate();
            }

            String sqlSelectFormation = "SELECT intitule FROM Formation WHERE id = ?";
            try (PreparedStatement stmtSelectFormation = conn.prepareStatement(sqlSelectFormation)) {
                stmtSelectFormation.setString(1, formationId);
                ResultSet rsFormation = stmtSelectFormation.executeQuery();
                if (rsFormation.next()) {
                    request.setAttribute("formationIntitule", rsFormation.getString("intitule"));
                }
            }

            String sqlSelect = "SELECT e.INE, e.prenoms, e.nom, e.dateNaissance, e.sexe, e.adresse, e.adresseEmail " +
                    "FROM Etudiant e " +
                    "JOIN Etudiant_Formation ef ON e.INE = ef.etudiant_id " +
                    "WHERE ef.formation_id = ?";
            try (PreparedStatement stmtSelect = conn.prepareStatement(sqlSelect)) {
                stmtSelect.setString(1, formationId);
                ResultSet rs = stmtSelect.executeQuery();
                request.setAttribute("resultSet", rs);
                request.getRequestDispatcher("listeEtudiantsInscrits.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la désinscription de l'étudiant : " + e.getMessage());
            request.getRequestDispatcher("ajouterFormation.jsp").forward(request, response);
        }
    }
}
