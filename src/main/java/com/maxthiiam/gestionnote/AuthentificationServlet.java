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

@WebServlet(name = "AuthentificationServlet", urlPatterns = {"/AuthentificationServlet"})
public class AuthentificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AuthentificationServlet() {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String  USER = "root";
        String PASSWORD= "";

        String username = request.getParameter("username");
        String motPasse = request.getParameter("motPasse");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Driver not found: " + e.getMessage());
            return; // Stop the execution if driver is not found
        }

        try (Connection conn = DriverManager.getConnection(URL,USER,PASSWORD)) {
            String sql = "INSERT INTO Authentification (username, motPasse) VALUES (?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,username);
                stmt.setString(2,motPasse);
                stmt.executeUpdate();

            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        response.sendRedirect("login.jsp");
    }

    }


