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

@WebServlet("/EnregistrerServlet")
public class EnregistrerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String URL = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données du formulaire
        String moduleId = request.getParameter("moduleId");
        String etudiantId = request.getParameter("etudiantId");
        String noteCCStr = request.getParameter("noteControleContinu");
        String noteExamStr = request.getParameter("noteExamen");

        if (moduleId == null || moduleId.isEmpty() || etudiantId == null || etudiantId.isEmpty()) {
            response.sendRedirect("recuperatioNotes.jsp?error=Module ID or Student ID is missing");
            return;
        }

        Double noteCC = (noteCCStr != null && !noteCCStr.isEmpty()) ? Double.parseDouble(noteCCStr) : null;
        Double noteExam = (noteExamStr != null && !noteExamStr.isEmpty()) ? Double.parseDouble(noteExamStr) : null;

        // Assurez-vous que les notes sont dans la plage 0-20
        if (noteCC != null && (noteCC < 0 || noteCC > 20)) ;
        if (noteExam != null && (noteExam < 0 || noteExam > 20)) ;

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
            // Préparer une instruction SQL pour insérer les notes
            String insertQuery = "INSERT INTO note (etudiantId ,moduleId,noteControleContinu, noteExamen) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
                pstmt.setString(1, etudiantId);
                pstmt.setString(2, moduleId);
                pstmt.setDouble(3, noteCC != null ? noteCC : 0); // Défaut à 0 si null
                pstmt.setDouble(4, noteExam != null ? noteExam : 0); // Défaut à 0 si null
                pstmt.executeUpdate();
            }

            // Rediriger vers une page de confirmation ou afficher les informations enregistrées
           /*
           *  request.setAttribute("moduleId", moduleId);
            request.setAttribute("etudiantId", etudiantId);
            request.setAttribute("noteCC", noteCC != null ? noteCC : 0);
            request.setAttribute("noteExam", noteExam != null ? noteExam : 0);
            request.getRequestDispatcher("confirmationPage.jsp").forward(request, response);
            */
            response.sendRedirect("listeEtudiantsAvecNotes.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("recuperatioNotes.jsp?error=" + e.getMessage());
        }
    }
}
