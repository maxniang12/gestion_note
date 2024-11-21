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

@WebServlet("/ListeFormationsEtudiantServlet")
public class ListeFormationsEtudiantServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String etudiantId = request.getParameter("etudiantId");

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
            String sql = "SELECT f.intitule FROM Formation f " +
                    "JOIN Etudiant_Formation ef ON f.id = ef.formation_id " +
                    "WHERE ef.etudiant_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, etudiantId);
                ResultSet rs = stmt.executeQuery();
                request.setAttribute("resultSet", rs);
                request.getRequestDispatcher("detailsFormationsEtudiant.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de la récupération des formations : " + e.getMessage());
            request.getRequestDispatcher("listeEtudiantsInscrits.jsp").forward(request, response);
        }
    }
}
