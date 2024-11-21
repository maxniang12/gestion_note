<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmation d'Enregistrement</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 15px 17px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            color: #ffffff;
            background-color: #0095ff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }

        a:hover {
            background-color: #007bb5;
        }
    </style>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    String user = "root";
    String password = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try (Connection conn = DriverManager.getConnection(url, user, password)) {
        String sql = "SELECT * FROM Note";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
%>

<div class="container">
    <h2>Enregistrement Réussi</h2>
    <p><strong>Module ID:</strong> <%= rs.getString("moduleId") %></p>
    <p><strong>Étudiant ID:</strong> <%= rs.getString("etudiantId") %></p>
    <p><strong>Note CC:</strong> <%= rs.getDouble("noteControleContinu") %></p>
    <p><strong>Note Exam:</strong> <%= rs.getDouble("noteExamen") %></p>
    <a href="listeModules.jsp">Retourner à la liste des Modules</a>
</div>
<%
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

</body>
</html>
