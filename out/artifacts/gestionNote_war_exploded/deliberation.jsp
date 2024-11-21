<%@ page import="java.util.List" %>
<%@ page import="com.maxthiiam.gestionnote.DeliberationServlet.EtudiantResult" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
            padding: 20px;
            box-sizing: border-box;
        }

        .container {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2);
            max-width: 1000px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .card {
            background: linear-gradient(135deg, #f1ae3f 0%, #834a02 100%);
            color: #fff;
            border-radius: 10px;
            padding: 20px;
            margin: 10px;
            flex: 1;
            min-width: 150px;
            text-align: center;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            background: linear-gradient(135deg, #b86c01 0%, #ead2b4 100%);
            color: black;
        }

        .card p {
            margin: 0;
            font-size: 1.2em;
            font-weight: 600;
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
    <div class="card-container">
        <div class="card">
            <p>Taux de réussite</p>
            <p><i class="fa-solid fa-gauge fa-spin-pulse"></i></p>
            <p><%= request.getAttribute("tauxReussite") %> %</p>
        </div>
        <div class="card">
            <p>Mentions Très Bien</p>
            <p><i class="fa-solid fa-calculator fa-flip"></i></p>
            <p><%= request.getAttribute("countTresBien") %></p>
        </div>
        <div class="card">
            <p>Mentions Bien</p>
            <p><i class="fa-solid fa-calculator fa-flip"></i></p>
            <p><%= request.getAttribute("countBien") %></p>
        </div>
        <div class="card">
            <p>Mentions Assez Bien</p>
            <p><i class="fa-solid fa-calculator fa-flip"></i></p>
            <p><%= request.getAttribute("countAssezBien") %></p>
        </div>
        <div class="card">
            <p>Mentions Passable</p>
            <p><i class="fa-solid fa-calculator fa-flip"></i></p>
            <p><%= request.getAttribute("countPassable") %></p>
        </div>
        <div class="card">
            <p> Ajournés </p>
            <p><i class="fa-solid fa-calculator fa-flip"></i></p>
            <p><%= request.getAttribute("countAjourne") %></p>
        </div>
    </div>

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
