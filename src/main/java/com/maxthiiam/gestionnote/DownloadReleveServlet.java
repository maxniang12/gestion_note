package com.maxthiiam.gestionnote;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date; // Assurez-vous que cette importation est présente
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.UnitValue;
import com.itextpdf.kernel.pdf.PdfDocument;

@WebServlet("/DownloadReleveServlet")
public class DownloadReleveServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=releve_notes.pdf");

        try {
            String ine = request.getParameter("ine");
            if (ine == null || ine.isEmpty()) {
                throw new ServletException("INE manquant ou invalide.");
            }

            String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
            String user = "root";
            String password = "";

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                // Récupération des informations de l'étudiant
                String sqlStudent = "SELECT * FROM Etudiant,Etudiant_Formation,Formation WHERE INE = ? and Etudiant.INE=Etudiant_Formation.etudiant_id and Formation.id=Etudiant_Formation.formation_id";
                try (PreparedStatement stmtStudent = conn.prepareStatement(sqlStudent)) {
                    stmtStudent.setString(1, ine);
                    try (ResultSet rsStudent = stmtStudent.executeQuery()) {
                        if (rsStudent.next()) {
                            String nom = rsStudent.getString("nom");
                            String prenoms = rsStudent.getString("prenoms");
                            String formation = rsStudent.getString("intitule");

                            // Création du PDF
                            PdfDocument pdfDoc = new PdfDocument(new PdfWriter(response.getOutputStream()));
                            Document document = new Document(pdfDoc);

                            document.add(new Paragraph("Relevé de Notes"));
                            document.add(new Paragraph("INE Etudiant: " + ine));
                            document.add(new Paragraph("Nom: " + nom));
                            document.add(new Paragraph("Prenoms: " + prenoms));
                            document.add(new Paragraph("Formation: " + formation));

                            // Date de génération du relevé
                            Date currentDate = new Date();
                            String formattedDate = new SimpleDateFormat("dd/MM/yyyy").format(currentDate);
                            document.add(new Paragraph("Date de génération: " + formattedDate));

                            document.add(new Paragraph("Institution : Université Assane SECK de Ziguinchor"));

                            // Ajout des notes sous forme de tableau
                            float[] columnWidths = {4, 4, 2};
                            Table table = new Table(UnitValue.createPercentArray(columnWidths));

                            table.addCell("Module");
                            table.addCell("Nombre de Crédits");
                            table.addCell("Note");

                            String sqlModules = "SELECT m.intitule, m.nombreCredits, n.noteControleContinu, n.noteExamen " +
                                    "FROM Module m JOIN Note n ON m.code = n.moduleId " +
                                    "WHERE n.etudiantId = ?";
                            try (PreparedStatement stmtModules = conn.prepareStatement(sqlModules)) {
                                stmtModules.setString(1, ine);
                                try (ResultSet rsModules = stmtModules.executeQuery()) {
                                    while (rsModules.next()) {
                                        String module = rsModules.getString("intitule");
                                        int credits = rsModules.getInt("nombreCredits");
                                        float noteCC = rsModules.getFloat("noteControleContinu");
                                        float noteExamen = rsModules.getFloat("noteExamen");
                                        float moyenneModule = (noteCC + noteExamen) / 2;

                                        table.addCell(module);
                                        table.addCell(String.valueOf(credits));
                                        table.addCell(String.format("%.2f", moyenneModule));
                                    }
                                }
                            }

                            document.add(table);
                            document.close();
                        } else {
                            throw new ServletException("Étudiant non trouvé pour l'INE: " + ine);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
