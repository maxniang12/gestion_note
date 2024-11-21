<%@ page import="java.util.List" %>
<%@ page import="com.maxthiiam.gestionnote.DeliberationServlet.EtudiantResult" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Résultats de Délibération</title>
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

        h2 {
            color: #333;
            margin-top: 20px;
            margin-bottom: 10px;
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
            background-color: #f1ae3f;
            color: white;
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

        .btn {
            padding: 5px 10px;
            color: #ffffff;
            background-color: #f1ae3f;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #150f01;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Résultats de Délibération</h1>

    <h2>Statistiques</h2>
    <p>Taux de réussite : <%= request.getAttribute("tauxReussite") %> %</p>
    <p>Nombre de mentions Très Bien : <%= request.getAttribute("countTresBien") %></p>
    <p>Nombre de mentions Bien : <%= request.getAttribute("countBien") %></p>
    <p>Nombre de mentions Assez Bien : <%= request.getAttribute("countAssezBien") %></p>
    <p>Nombre de mentions Passable : <%= request.getAttribute("countPassable") %></p>
    <p>Nombre de mentions Ajourné : <%= request.getAttribute("countAjourne") %></p>

    <h2>Résultats des étudiants</h2>
    <table>
        <tr>
            <th>INE</th>
            <th>Nom et Prénoms</th>
            <th>Moyenne</th>
            <th>Mention</th>
            <th>Génération de Relevé</th> <!-- Nouvelle colonne -->
        </tr>
        <%
            List<EtudiantResult> results = (List<EtudiantResult>) request.getAttribute("results");
            if (results != null) {
                for (EtudiantResult result : results) {
        %>
        <tr>
            <td><%= result.getIne() %></td>
            <td><%= result.getNomPrenoms() %></td>
            <td><%= result.getMoyenne() %></td>
            <td><%= result.getMention() %></td>
            <td><a class="btn" href="releve.jsp?ine=<%= result.getIne() %>">Relevé</a></td> <!-- Lien vers le relevé -->
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5">Aucun résultat disponible</td>
        </tr>
        <%
            }
        %>
    </table>

    <a href="index.jsp">Retour à l'accueil</a>
</div>
</body>
</html>