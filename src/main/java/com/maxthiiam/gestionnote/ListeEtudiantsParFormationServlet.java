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

@WebServlet("/ListeEtudiantsParFormationServlet")
public class ListeEtudiantsParFormationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String formationId = request.getParameter("formationId");

        if (formationId == null || formationId.isEmpty()) {
            request.setAttribute("error", "Le champ formationId est obligatoire.");
            request.getRequestDispatcher("/ajoutformation.jsp").forward(request, response);
            return;
        }

        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "SELECT E.INE, E.prenoms, E.nom, E.dateNaissance, E.sexe, E.adresse, E.adresseEmail " +
                    "FROM Etudiant E " +
                    "INNER JOIN Etudiant_Formation EF ON E.INE = EF.etudiant_id " +
                    "WHERE EF.formation_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(formationId));
                try (ResultSet rs = stmt.executeQuery()) {
                    request.setAttribute("resultSet", rs);
                    request.getRequestDispatcher("/listeEtudiantsInscrits.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Une erreur est survenue lors de la récupération de la liste des étudiants.");
            request.getRequestDispatcher("/ajoutformation.jsp").forward(request, response);
        }
    }
}
