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

@WebServlet("/ListeEtudiantsInscritsServlet")
public class ListeEtudiantsInscritsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String formationId = request.getParameter("formationId");

        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur de chargement du pilote JDBC.");
            request.getRequestDispatcher("listeEtudiantsInscrits.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "SELECT e.INE, e.prenoms, e.nom, e.dateNaissance, e.sexe, e.adresse, e.adresseEmail " +
                    "FROM Etudiant e " +
                    "INNER JOIN Etudiant_Formation ef ON e.INE = ef.etudiant_id " +
                    "WHERE ef.formation_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, formationId);
                ResultSet rs = stmt.executeQuery();
                request.setAttribute("resultSet", rs);
                request.getRequestDispatcher("listeEtudiantsInscrits.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la récupération de la liste des étudiants : " + e.getMessage());
            request.getRequestDispatcher("listeEtudiantsInscrits.jsp").forward(request, response);
        }
    }
}
