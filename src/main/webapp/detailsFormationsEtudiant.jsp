<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Détails des Formations de l'Étudiant</title>
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
<h1>Détails des Formations de l'Étudiant</h1>

<% if (request.getAttribute("error") != null) { %>
<div style="color: red;">
    <%= request.getAttribute("error") %>
</div>
<% } %>

<table>
    <tr>
        <th>Formation</th>
    </tr>
    <%
        ResultSet rs = (ResultSet) request.getAttribute("resultSet");
        if (rs != null) {
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("intitule") %></td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>
