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

@WebServlet(name = "SupprimerEtudiantServlet", urlPatterns = {"/SupprimerEtudiantServlet"})
public class SupprimerEtudiantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    String user = "root";
    String password = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ine = request.getParameter("INE");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "DELETE FROM Etudiant WHERE INE = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, ine);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("listeEtudiants.jsp");
    }
}
