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
import java.util.Enumeration;

@WebServlet("/NoteServlet")
public class NoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String URL = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID du module
        String moduleId = request.getParameter("moduleId");

        if (moduleId == null || moduleId.isEmpty()) {
            response.sendRedirect("errorPage.jsp?error=Module ID is missing");
            return;
        }

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
            // Préparer une instruction SQL pour mettre à jour les notes
            String updateQuery = "UPDATE notes SET noteCC = ?, noteExam = ? WHERE ine = ? AND module_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
                Enumeration<String> parameterNames = request.getParameterNames();

                // Parcourir les paramètres du formulaire
                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();

                    if (paramName.startsWith("noteCC_")) {
                        String ine = paramName.substring("noteCC_".length());
                        String noteCCStr = request.getParameter(paramName);
                        String noteExamStr = request.getParameter("noteExam_" + ine);

                        // Convertir les notes en double avec vérification
                        Double noteCC = (noteCCStr != null && !noteCCStr.isEmpty()) ? Double.parseDouble(noteCCStr) : null;
                        Double noteExam = (noteExamStr != null && !noteExamStr.isEmpty()) ? Double.parseDouble(noteExamStr) : null;

                        // Assurez-vous que les notes sont dans la plage 0-20
                        if (noteCC != null && (noteCC < 0 || noteCC > 20)) ;
                        if (noteExam != null && (noteExam < 0 || noteExam > 20)) ;

                        // Mettre à jour les notes dans la base de données
                        pstmt.setDouble(1, noteCC != null ? noteCC : 0); // Défaut à 0 si null
                        pstmt.setDouble(2, noteExam != null ? noteExam : 0); // Défaut à 0 si null
                        pstmt.setString(3, ine);
                        pstmt.setString(4, moduleId);

                        pstmt.addBatch();
                    }
                }

                // Exécuter les mises à jour en lot
                pstmt.executeBatch();
            }

            // Rediriger vers la page de confirmation ou une autre page
            response.sendRedirect("confirmationPage.jsp?moduleId=" + moduleId)  ;
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("listeEtudiantsParModule.jsp?error=" + e.getMessage());
        }
    }
}
