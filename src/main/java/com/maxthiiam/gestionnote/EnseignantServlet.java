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
import java.io.PrintWriter;
import com.maxthiam.beans.Enseignant;



@WebServlet(name ="EnseignantServlet", urlPatterns = {"/EnseignantServlet"})
public class EnseignantServlet  extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    String user = "root";
    String password = "";



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<html>");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<html>");
        String matricule = request.getParameter("matricule");
        String nom = request.getParameter("nom");
        String prenoms = request.getParameter("prenoms");
        String adresse = request.getParameter("adresse");
        String adresseEmail = request.getParameter("adresseEmail");
        String bureau = request.getParameter("bureau");
        String specialite = request.getParameter("specialite");
        String dateNaissance = request.getParameter("dateNaissance");
        String sexe = request.getParameter("sexe");
        String grade = request.getParameter("grade");
        String institutionRattachement= request.getParameter("institutionRattachement");
        try{
            Class.forName("com.mysql.jdbc.Driver");

        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(url, user,password)) {
            String sql = "INSERT INTO Enseignant (matricule, prenoms, nom, dateNaissance, sexe, grade, specialite, adresse, adresseEmail, bureau, institutionRattachement) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, matricule);
                stmt.setString(2, prenoms);
                stmt.setString(3, nom);
                stmt.setString(4, dateNaissance);
                stmt.setString(5, sexe);
                stmt.setString(6, grade);
                stmt.setString(7, specialite);
                stmt.setString(8, adresse);
                stmt.setString(9, adresseEmail);
                stmt.setString(10, bureau);
                stmt.setString(11, institutionRattachement);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("listeEnseignant.jsp");





    }
}
