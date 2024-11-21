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

@WebServlet(name = "ModifierEtudiantServlet", urlPatterns = {"/ModifierEtudiantServlet"})
public class ModifierEtudiantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    String user = "root";
    String password = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ine = request.getParameter("INE");
        String prenoms = request.getParameter("prenoms");
        String nom = request.getParameter("nom");
        String dateNaissance = request.getParameter("dateNaissance");
        String sexe = request.getParameter("sexe");
        String adresse = request.getParameter("adresse");
        String adresseEmail = request.getParameter("adresseEmail");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "UPDATE Etudiant SET prenoms = ?, nom = ?, dateNaissance = ?, sexe = ?, adresse = ?, adresseEmail = ? WHERE INE = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, prenoms);
                stmt.setString(2, nom);
                stmt.setString(3, dateNaissance);
                stmt.setString(4, sexe);
                stmt.setString(5, adresse);
                stmt.setString(6, adresseEmail);
                stmt.setString(7, ine);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("listeEtudiant.jsp");
    }
}
