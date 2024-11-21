<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Relevé de Notes</title>
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

        h1, h2 {
            color: #333;
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
            background-color: rgba(197, 195, 195, 0.9);
            color: #170f01;
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
            background-color: #0f0f0f;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        String ine = request.getParameter("ine");
        if (ine == null || ine.isEmpty()) {
            out.println("<h1>ID étudiant manquant</h1>");
            return;
        }

        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                String sqlStudent = "SELECT * FROM Etudiant,Etudiant_Formation,Formation WHERE INE = ? and Etudiant.INE=Etudiant_Formation.etudiant_id and Formation.id=Etudiant_Formation.formation_id";
                try (PreparedStatement stmtStudent = conn.prepareStatement(sqlStudent)) {
                    stmtStudent.setString(1, ine);
                    try (ResultSet rsStudent = stmtStudent.executeQuery()) {
                        if (rsStudent.next()) {
                            String nom = rsStudent.getString("nom");
                            String  Prenoms = rsStudent.getString("prenoms");
                            String intitule = rsStudent.getString("intitule");
    %>
    <h1>Relevé de Notes</h1>
    <p> INE Etudiant: <%=ine%></p>
    <p> Nom : <%= nom %> </p>
    <p> Prenom : <%= Prenoms %> </p>
    <p>Formation : <%= intitule %></p>
    <p>Date de génération : <%= new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %></p>
    <p>Institution : Université Assane SECK de Ziguinchor</p>
    <h2>Notes</h2>
    <table>
        <tr>
            <th>Module</th>
            <th>Nombre de Crédits</th>
            <th>Note</th>
        </tr>
            <%
                            String sqlModules = "SELECT m.intitule, m.nombreCredits, n.noteControleContinu, n.noteExamen " +
                                                "FROM Module m JOIN Note n ON m.code = n.moduleId " +
                                                "WHERE n.etudiantId = ?";
                            try (PreparedStatement stmtModules = conn.prepareStatement(sqlModules)) {
                                stmtModules.setString(1, ine);
                                try (ResultSet rsModules = stmtModules.executeQuery()) {
                                    float totalCredits = 0;
                                    float weightedSum = 0;
                                    while (rsModules.next()) {
                                        String module = rsModules.getString("intitule");
                                        int credits = rsModules.getInt("nombreCredits");
                                        float noteCC = rsModules.getFloat("noteControleContinu");
                                        float noteExamen = rsModules.getFloat("noteExamen");
                                        float moyenneModule = (noteCC + noteExamen) / 2;
                                        weightedSum += moyenneModule * credits;
                                        totalCredits += credits;
    %>
        <tr>
            <td><%= module %></td>
            <td><%= credits %></td>
            <td><%= moyenneModule %></td>
        </tr>
            <%
                                    }
                                    if (totalCredits > 0) {
                                        float moyenneGenerale = weightedSum / totalCredits;
                                        String rang;
                                        if (moyenneGenerale >= 16) rang = "Très Bien";
                                        else if (moyenneGenerale >= 14) rang = "Bien";
                                        else if (moyenneGenerale >= 12) rang = "Assez Bien";
                                        else if (moyenneGenerale >= 10) rang = "Passable";
                                        else rang = "Ajourné";
    %>
        <tr>
            <td colspan="2"><strong>Moyenne Générale</strong></td>
            <td><%= moyenneGenerale %></td>
        </tr>
        <tr>
            <td colspan="2"><strong>Mention</strong></td>
            <td><%= rang %></td>
        </tr>
            <%
                                    } else {
    %>
        <tr>
            <td colspan="3">Aucune note disponible</td>
        </tr>
            <%
                                    }
                                }
                            }
                        } else {
                            out.println("<h2>Étudiant non trouvé</h2>");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Erreur lors de la génération du relevé</h2>");
        }
    %>





</div>


</body>
</html>