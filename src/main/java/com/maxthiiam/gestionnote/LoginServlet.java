package com.maxthiiam.gestionnote;
import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";

        String username = request.getParameter("username");
        String motPasse = request.getParameter("motPasse");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, password);
            String sql = "SELECT * FROM Authentification WHERE username = ? AND motPasse = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, motPasse);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // Redirection vers les taches de  enseignant en cas de succès
                response.sendRedirect("indexenseignant.jsp");
            } else {
                // Redirection vers login.jsp avec un message d'erreur en cas d'échec
                response.sendRedirect("login.jsp?error=Invalid username or password");
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Redirection vers login.jsp avec un message d'erreur en cas d'exception
            response.sendRedirect("login.jsp?error=An error occurred");
        }
    }
}
