<%-- EtudiantsInscrits.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<html>
<head>
    <title>Étudiants Inscrits</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn {
            display: inline-block;
            margin: 5px;
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>Étudiants Inscrits</h2>
<table>
    <tr>
        <th>INE</th>
        <th>Prénoms</th>
        <th>Nom</th>
        <th>Date de Naissance</th>
        <th>Sexe</th>
        <th>Adresse</th>
        <th>Email</th>
    </tr>
    <%
        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";
        String formationId = request.getParameter("id");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "SELECT e.INE, e.prenoms, e.nom, e.dateNaissance, e.sexe, e.adresse, e.adresseEmail " +
                    "FROM Etudiant e " +
                    "JOIN Etudiant_Formation ef ON e.INE = ef.etudiant_id " +
                    "WHERE ef.formation_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(formationId));
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("INE") %></td>
        <td><%= rs.getString("prenoms") %></td>
        <td><%= rs.getString("nom") %></td>
        <td><%= rs.getString("dateNaissance") %></td>
        <td><%= rs.getString("sexe") %></td>
        <td><%= rs.getString("adresse") %></td>
        <td><%= rs.getString("adresseEmail") %></td>
    </tr>
    <%
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</table>
<br>
<a href="ajouterFormation.jsp?INE=<%= request.getParameter("INE") %>" class="btn">Ajouter une autre formation</a>
</body>
</html>
