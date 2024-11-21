<%@ page import="com.maxthiam.beans.Enseignant" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Enseignants Intervenant et Inscrits</title>
    <style>

        h1 {
            color: black;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: black;
            color: #f1ae3f;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>



<h1>Enseignants inscrits à la Formation</h1>
<table>
    <tr>
        <th>Matricule</th>
        <th>Prénoms</th>
        <th>Nom</th>
        <th>Date de Naissance</th>
        <th>Sexe</th>
        <th>Grade</th>
        <th>Spécialité</th>
        <th>Adresse</th>
        <th>Email</th>
        <th>Bureau</th>
        <th>Institution de Rattachement</th>
    </tr>
    <%
        List<Enseignant> enseignantsInscrits = (List<Enseignant>) request.getAttribute("enseignantsInscrits");
        if (enseignantsInscrits != null) {
            for (Enseignant enseignant : enseignantsInscrits) {
    %>
    <tr>
        <td><%= enseignant.getMatricule() %></td>
        <td><%= enseignant.getPrenoms() %></td>
        <td><%= enseignant.getNom() %></td>
        <td><%= enseignant.getDateNaissance() %></td>
        <td><%= enseignant.getSexe() %></td>
        <td><%= enseignant.getGrade() %></td>
        <td><%= enseignant.getSpecialite() %></td>
        <td><%= enseignant.getAdresse() %></td>
        <td><%= enseignant.getAdresseEmail() %></td>
        <td><%= enseignant.getBureau() %></td>
        <td><%= enseignant.getInstitutionRattachement() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="11">Aucun enseignant inscrit trouvé.</td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
