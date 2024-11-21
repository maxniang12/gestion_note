<%--
  Created by IntelliJ IDEA.
  User: max
  Date: 2024-07-18
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<html>
<head>
    <title>Modifier Enseignant</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: auto;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            margin: 10px 0 5px;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    String matricule = request.getParameter("matricule");
    String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    String user = "root";
    String password = "";
    String prenoms = "", nom = "", dateNaissance = "", sexe = "", grade = "", specialite = "", adresse = "", adresseEmail = "", bureau = "", institutionRattachement = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try (Connection conn = DriverManager.getConnection(url, user, password)) {
        String sql = "SELECT * FROM Enseignant WHERE matricule = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricule);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    prenoms = rs.getString("prenoms");
                    nom = rs.getString("nom");
                    dateNaissance = rs.getString("dateNaissance");
                    sexe = rs.getString("sexe");
                    grade = rs.getString("grade");
                    specialite = rs.getString("specialite");
                    adresse = rs.getString("adresse");
                    adresseEmail = rs.getString("adresseEmail");
                    bureau = rs.getString("bureau");
                    institutionRattachement = rs.getString("institutionRattachement");
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<div class="form-container">
    <h2>Modifier Enseignant</h2>
    <form action="ModifierEnseignantServlet" method="post">
        <input type="hidden" name="matricule" value="<%= matricule %>">
        <label for="prenoms">Prénoms:</label>
        <input type="text" id="prenoms" name="prenoms" value="<%= prenoms %>">

        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" value="<%= nom %>">

        <label for="dateNaissance">Date de Naissance:</label>
        <input type="date" id="dateNaissance" name="dateNaissance" value="<%= dateNaissance %>">

        <label for="sexe">Sexe:</label>
        <input type="text" id="sexe" name="sexe" value="<%= sexe %>">

        <label for="grade">Grade:</label>
        <input type="text" id="grade" name="grade" value="<%= grade %>">

        <label for="specialite">Spécialité:</label>
        <input type="text" id="specialite" name="specialite" value="<%= specialite %>">

        <label for="adresse">Adresse:</label>
        <input type="text" id="adresse" name="adresse" value="<%= adresse %>">

        <label for="adresseEmail">Email:</label>
        <input type="email" id="adresseEmail" name="adresseEmail" value="<%= adresseEmail %>">

        <label for="bureau">Bureau:</label>
        <input type="text" id="bureau" name="bureau" value="<%= bureau %>">

        <label for="institutionRattachement">Institution de Rattachement:</label>
        <input type="text" id="institutionRattachement" name="institutionRattachement" value="<%= institutionRattachement %>">

        <button type="submit">Mettre à jour</button>
    </form>
</div>

</body>
</html>
