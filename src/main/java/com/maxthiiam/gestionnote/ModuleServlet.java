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
import java.sql.SQLException;
import java.lang.*;

@WebServlet(name = "ModuleServlet", urlPatterns = {"/ModuleServlet"})
public class ModuleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String URL = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        String code = request.getParameter("code");
        String intitule = request.getParameter("intitule");
        int volumeHoraire = Integer.parseInt(request.getParameter("volumeHoraire"));
        double coefficient = Double.parseDouble(request.getParameter("coefficient"));
        int nombreCredits = Integer.parseInt(request.getParameter("nombreCredits"));
        String responsable = request.getParameter("responsable");

        // Charger le driver JDBC
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur de chargement du driver JDBC");
            return;
        }

        // Établir la connexion à la base de données
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            // Préparer la requête SQL
            String sql = "INSERT INTO Module (code, intitule, volumeHoraire, coefficient, nombreCredits, responsable) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, code);
                stmt.setString(2, intitule);
                stmt.setInt(3, volumeHoraire);
                stmt.setDouble(4, coefficient);
                stmt.setInt(5, nombreCredits);
                stmt.setString(6, responsable);

                // Exécuter la requête
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de l'insertion dans la base de données");
            return;
        }

        // Rediriger vers une page de confirmation ou la liste des modules
        response.sendRedirect("listeModules.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gérer les requêtes GET si nécessaire
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET non supporté");
    }
}
