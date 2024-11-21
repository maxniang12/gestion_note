<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Liste des Étudiants Inscrits de cette Formation</title>
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
            background-color: #f1ae3f;
        }
        h1{
            text-align: center;
            justify-content: center;
        }
    </style>
</head>
<body>
<h1>Liste des Étudiants Inscrits</h1>

<% if (request.getAttribute("formationIntitule") != null) { %>
<h2>Formation: <%= request.getAttribute("formationIntitule") %></h2>
<% } %>

<% if (request.getAttribute("error") != null) { %>
<div style="color: red;">
    <%= request.getAttribute("error") %>
</div>
<% } %>

<table>
    <tr>
        <th>INE</th>
        <th>Prénoms</th>
        <th>Nom</th>
        <th>Date de Naissance</th>
        <th>Sexe</th>
        <th>Adresse</th>
        <th>Email</th>
        <th>Détails</th>
    </tr>
    <%
        ResultSet rs = (ResultSet) request.getAttribute("resultSet");
        if (rs != null) {
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
        <td>
            <form action="ListeFormationsEtudiantServlet" method="get">
                <input type="hidden" name="etudiantId" value="<%= rs.getString("INE") %>">
                <button type="submit">Détails</button>
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>
