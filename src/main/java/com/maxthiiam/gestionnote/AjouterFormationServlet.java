package com.maxthiiam.gestionnote;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AjouterFormationServlet")
public class AjouterFormationServlet extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String intitule = request.getParameter("intitule");
        String niveau = request.getParameter("niveau");
        String[] modules = request.getParameterValues("modules");

        // Diviser les niveaux par la virgule
        String[] niveaux = niveau.split(",");

        // Valider tous les niveaux
        for (String niv : niveaux) {
            if (!isValidNiveau(niv.trim())) {
                request.setAttribute("error", "Niveau invalide : " + niv.trim());
                request.getRequestDispatcher("ajouterFormation.jsp").forward(request, response);
                return;
            }
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
                if (isIntituleExists(conn, intitule)) {
                    // Si l'intitulé existe déjà, mais avec des niveaux différents, ne pas générer une erreur
                }

                // Insérer dans la table Formation pour chaque niveau
                String sqlFormation = "INSERT INTO Formation (intitule, niveau) VALUES (?, ?)";
                try (PreparedStatement stmtFormation = conn.prepareStatement(sqlFormation, PreparedStatement.RETURN_GENERATED_KEYS)) {
                    for (String niv : niveaux) {
                        stmtFormation.setString(1, intitule);
                        stmtFormation.setString(2, niv.trim());
                        stmtFormation.executeUpdate();

                        try (ResultSet generatedKeys = stmtFormation.getGeneratedKeys()) {
                            if (generatedKeys.next()) {
                                int formationId = generatedKeys.getInt(1);

                                // Insérer dans la table Formation_Module
                                String sqlFormationModule = "INSERT INTO Formation_Module (formation_id, module_id) VALUES (?, ?)";
                                try (PreparedStatement stmtFormationModule = conn.prepareStatement(sqlFormationModule)) {
                                    for (String moduleId : modules) {
                                        stmtFormationModule.setInt(1, formationId);
                                        stmtFormationModule.setString(2, moduleId);
                                        stmtFormationModule.executeUpdate();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("ajouterFormation.jsp");
    }

    private boolean isIntituleExists(Connection conn, String intitule) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Formation WHERE intitule = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, intitule);
            try (ResultSet rs = stmt.executeQuery()) {
                rs.next();
                return rs.getInt(1) > 0;
            }
        }
    }

    private boolean isValidNiveau(String niveau) {
        // Liste des niveaux valides
        String[] niveauxValides = {"L1", "L2", "L3", "M1", "M2", "D1", "D2", "D3"};
        for (String validNiveau : niveauxValides) {
            if (validNiveau.equals(niveau.trim())) {
                return true;
            }
        }
        return false;
    }
}
