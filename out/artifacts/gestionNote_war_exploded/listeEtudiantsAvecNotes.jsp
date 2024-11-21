<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Étudiants avec Notes</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

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
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #dddddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #170f01;
            color: #f1ae3f;
            border : 1px solid white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            color: #ffffff;
            background-color: #150f01;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #150f01;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Liste des Étudiants avec Toutes leurs Notes</h1>
    <table>
        <tr>
            <th>INE</th>
            <th>Nom</th>
            <th>Prénoms</th>
            <th>Module</th>
            <th>Note Contrôle Continu</th>
            <th>Note Examen</th>
        </tr>
        <%
            String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
            String user = "root";
            String password = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(url, user, password)) {
                    String sql = "SELECT e.INE, e.nom, e.prenoms, m.intitule, n.noteControleContinu, n.noteExamen " +
                            "FROM Note n " +
                            "JOIN Etudiant e ON n.etudiantId = e.INE " +
                            "JOIN Module m ON n.moduleId = m.code";
                    try (PreparedStatement stmt = conn.prepareStatement(sql);
                         ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            String ine = rs.getString("INE");
                            String nom = rs.getString("nom");
                            String prenoms = rs.getString("prenoms");
                            String module = rs.getString("intitule");
                            float noteControleContinu = rs.getFloat("noteControleContinu");
                            float noteExamen = rs.getFloat("noteExamen");
        %>
        <tr>
            <td><%= ine %></td>
            <td><%= nom %></td>
            <td><%= prenoms %></td>
            <td><%= module %></td>
            <td><%= noteControleContinu %></td>
            <td><%= noteExamen %></td>
        </tr>
        <%
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
    </table>
    <a href="DeliberationServlet">Délibération</a>
    <a href="index.jsp">Retour à l'accueil</a>
</div>
</body>
</html>