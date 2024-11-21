package com.maxthiiam.gestionnote;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "EditerprofilServlet", urlPatterns = {"/EditerprofilServlet"})
public class EditerprofilServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    String user = "root";
    String password = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      /*
        HttpSession session = request.getSession();
        String matricule = (String) session.getAttribute("matricule");  Assuming matricule is stored in session
        if (matricule == null) {
            response.sendRedirect("login.jsp"); Redirect to login if not logged in
            return;
        }

      **/
        String matricule = request.getParameter("matricule");
        String prenoms = request.getParameter("prenoms");
        String nom = request.getParameter("nom");
        String dateNaissance = request.getParameter("dateNaissance");
        String sexe = request.getParameter("sexe");
        String grade = request.getParameter("grade");
        String specialite = request.getParameter("specialite");
        String adresse = request.getParameter("adresse");
        String adresseEmail = request.getParameter("adresseEmail");
        String bureau = request.getParameter("bureau");
        String institutionRattachement = request.getParameter("institutionRattachement");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "UPDATE Enseignant SET prenoms = ?, nom = ?, dateNaissance = ?, sexe = ?, grade = ?, specialite = ?, adresse = ?, adresseEmail = ?, bureau = ?, institutionRattachement = ? WHERE matricule = ? ";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, prenoms);
                stmt.setString(2, nom);
                stmt.setString(3, dateNaissance);
                stmt.setString(4, sexe);
                stmt.setString(5, grade);
                stmt.setString(6, specialite);
                stmt.setString(7, adresse);
                stmt.setString(8, adresseEmail);
                stmt.setString(9, bureau);
                stmt.setString(10, institutionRattachement);
                stmt.setString(11, matricule);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirect to the list of teachers
    }
}
