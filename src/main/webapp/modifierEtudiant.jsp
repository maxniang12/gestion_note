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
    <title>Modifier Étudiant</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f4f4f4, #e0e0e0);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        section {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .form-box {
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 17px rgba(0, 0, 0, 7);
            max-width: 500px;
            width: 100%;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .form-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        h2 {
            font-size: 2.5rem;
            color: #333;
            text-align: center;
            margin-bottom: 25px;
        }

        .input-box {
            margin-bottom: 20px;
            position: relative;
        }

        .input-box label {
            display: block;
            font-size: 1rem;
            color: #333;
            margin-bottom: 5px;
        }

        .input-box input,
        .input-box select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            color: #333;
        }

        .input-box input:focus,
        .input-box select:focus {
            border-color: #0095ff;
            outline: none;
        }

        .input-box select {
            appearance: none;
            background: url('data:image/svg+xml;charset=US-ASCII,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 4 5\'%3E%3Cpath fill=\'%23000000\' d=\'M2 0L0 2h4zm0 5L0 3h4z\'/%3E%3C/svg%3E') no-repeat right 10px center;
            background-size: 10px;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 25px;
            background-color: #0095ff;
            color: #ffffff;
            font-size: 1.2rem;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #0095ff;
            transform: scale(1.05);
        }
    </style>
</head>

<body>
<%
    String ine = request.getParameter("INE");
    String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
    String user = "root";
    String password = "";
    String prenoms = "", nom = "", dateNaissance = "", sexe = "", adresse = "", adresseEmail = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try (Connection conn = DriverManager.getConnection(url, user, password)) {
        String sql = "SELECT * FROM Etudiant WHERE INE = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, ine);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    prenoms = rs.getString("prenoms");
                    nom = rs.getString("nom");
                    dateNaissance = rs.getString("dateNaissance");
                    sexe = rs.getString("sexe");
                    adresse = rs.getString("adresse");
                    adresseEmail = rs.getString("adresseEmail");
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<section>
    <div class="form-box">
        <h2>Modifier Étudiant</h2>
        <form action="ModifierEtudiantServlet" method="post">
            <input type="hidden" name="INE" value="<%= ine %>">
            <div class="input-box">
                <label for="prenoms">Prénoms:</label>
                <input type="text" name="prenoms" id="prenoms" value="<%= prenoms %>">
            </div>
            <div class="input-box">
                <label for="nom">Nom:</label>
                <input type="text" name="nom" id="nom" value="<%= nom %>">
            </div>
            <div class="input-box">
                <label for="dateNaissance">Date de Naissance:</label>
                <input type="text" name="dateNaissance" id="dateNaissance" value="<%= dateNaissance %>">
            </div>
            <div class="input-box">
                <label for="sexe">Sexe:</label>
                <input type="text" name="sexe" id="sexe" value="<%= sexe %>">
            </div>
            <div class="input-box">
                <label for="adresse">Adresse:</label>
                <input type="text" name="adresse" id="adresse" value="<%= adresse %>">
            </div>
            <div class="input-box">
                <label for="adresseEmail">Email:</label>
                <input type="text" name="adresseEmail" id="adresseEmail" value="<%= adresseEmail %>">
            </div>
            <button type="submit">Modifier</button>
        </form>
    </div>
</section>

</body>
</html>
</html>
