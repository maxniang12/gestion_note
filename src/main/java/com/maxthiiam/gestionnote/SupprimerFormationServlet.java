package com.maxthiiam.gestionnote;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SupprimerFormationServlet")
public class SupprimerFormationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";
        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            // Début de la transaction
            conn.setAutoCommit(false);

            // Suppression des enregistrements dans Formation_Module
            String sqlDeleteFormationModule = "DELETE FROM Formation_Module WHERE formation_id = ?";
            try (PreparedStatement stmtDeleteFormationModule = conn.prepareStatement(sqlDeleteFormationModule)) {
                stmtDeleteFormationModule.setInt(1, Integer.parseInt(id));
                stmtDeleteFormationModule.executeUpdate();
            }

            // Suppression de la formation dans Formation
            String sqlDeleteFormation = "DELETE FROM Formation WHERE id = ?";
            try (PreparedStatement stmtDeleteFormation = conn.prepareStatement(sqlDeleteFormation)) {
                stmtDeleteFormation.setInt(1, Integer.parseInt(id));
                stmtDeleteFormation.executeUpdate();
            }

            // Commit de la transaction
            conn.commit();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // En cas d'erreur, annuler la transaction
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
        } finally {
            // Remettre l'auto-commit à true et fermer la connexion
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        response.sendRedirect("ajouterFormation.jsp");
    }
}