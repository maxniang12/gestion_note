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

@WebServlet("/ModifierFormationServlet")
public class ModifierFormationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String intitule = request.getParameter("intitule");
        String niveau = request.getParameter("niveau");
        String[] modules = request.getParameterValues("modules");

        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            // Mettre à jour les informations de la formation
            String sqlUpdateFormation = "UPDATE Formation SET intitule = ?, niveau = ? WHERE id = ?";
            try (PreparedStatement stmtUpdateFormation = conn.prepareStatement(sqlUpdateFormation)) {
                stmtUpdateFormation.setString(1, intitule);
                stmtUpdateFormation.setString(2, niveau);
                stmtUpdateFormation.setInt(3, Integer.parseInt(id));
                stmtUpdateFormation.executeUpdate();
            }

            // Supprimer les modules associés précédemment
            String sqlDeleteModules = "DELETE FROM Formation_Module WHERE formation_id = ?";
            try (PreparedStatement stmtDeleteModules = conn.prepareStatement(sqlDeleteModules)) {
                stmtDeleteModules.setInt(1, Integer.parseInt(id));
                stmtDeleteModules.executeUpdate();
            }

            // Ajouter les nouveaux modules sélectionnés
            if (modules != null) {
                String sqlInsertModules = "INSERT INTO Formation_Module (formation_id, module_id) VALUES (?, ?)";
                try (PreparedStatement stmtInsertModules = conn.prepareStatement(sqlInsertModules)) {
                    for (String module : modules) {
                        stmtInsertModules.setInt(1, Integer.parseInt(id));
                        stmtInsertModules.setString(2, module);
                        stmtInsertModules.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("ajouterFormation.jsp"); // Rediriger vers la page appropriée après la modification
    }
}


