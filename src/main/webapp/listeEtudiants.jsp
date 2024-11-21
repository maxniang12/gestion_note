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
    <title>Liste des Étudiants</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>


    <style>
        *{
            margin: 0;
            list-style: none;
            padding: 0;
            text-decoration: none;
            box-sizing: border-box;
            font-family: 'Montserrat',sans-serif;
        }
        body{
            background: rgba(255, 255, 255, 0.9);
            text-decoration: none;
        }
        .wrapper{
            margin: 10px;
            height: 60px;

        }
        .wrapper .top_navbar{
            width: calc(100% - 20px);
            height: 60px;
            display: flex;
            position: fixed;
            top: 0;


        }
        .wrapper .top_navbar .hamburger{
            width: 70px;
            height: 100%;
            background: #f1ae3f;
            padding: 15px 17px;
            border-top-left-radius: 20px;
            cursor: pointer;

        }
        .wrapper .top_navbar .hamburger div{
            width: 35px;
            height: 4px;
            background: #170f01;
            margin: 5px 0;
            border-radius: 5px;


        }
        .wrapper .top_navbar .top_menu{
            width: calc(100% - 70px);
            background: rgba(16, 11, 1, 0.99);
            height: 100%;
            border-bottom-right-radius: 20px ;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 2px rgb(227, 147, 17);

        }
        .wrapper .top_navbar .top_menu .logo{
            color: #f1ae3f;
            font-size: 30px;
            font-weight: 700;
            letter-spacing: 3px;
            text-align: center;
            align-items: center;

        }
        .wrapper .top_navbar .top_menu ul{
            display: flex;

        }
        .wrapper .top_navbar .top_menu ul li a{
            display: block;
            margin: 0 10px;
            width: 35px;
            height: 35px;
            line-height: 35px;
            border: 1px solid #f1ae3f;
            text-align: center;
            border-radius: 50%;
            color: #f1ae3f;

        }
        .wrapper .top_navbar .top_menu ul li a:hover{
            background: #f1ae3f;
            color: #fff;

        }
        .wrapper .sidebar{
            position: fixed;
            top: 60px;
            left: 10px;
            background: #f1ae3f;
            width: 230px;
            height:calc(100% - 80px);
            border-bottom-left-radius: 20px;
            transition: all 0.3s ease;

        }
        .wrapper .sidebar ul li a{
            display: block;
            padding: 20px;
            position: relative;
            margin-bottom: 1px;
            color: #170f01;
            white-space: nowrap;
        }

        .wrapper .sidebar ul li a:before{
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 3px;
            height: 100%;
            background: rgba(35, 22, 1, 0.99);
            display: none;

        }

        .wrapper .sidebar  ul li a span.icon{
            margin-right: 10px;
            display: inline-block;
        }
        .wrapper .sidebar ul li a span.title{
            display: inline-block;

        }
        .wrapper .sidebar ul li a:hover
        {

            background: #daa858;
            color: #170f01;
        }
        .wrapper .sidebar ul li a:hover:before
        {
            display: block;
        }

        .wrapper .main_content{
            width: calc(100% - 200px);
            margin-top: 70px;
            margin-left: 200px;
            padding: 15px;
            transition: all 0.3s ease;

        }
        .wrapper .main_content .item{
            margin-bottom: 10px;
            padding: 15px;
            line-height: 22px;
        }
        .wrapper.collapse .sidebar{
            width: 70px;

        }
        .wrapper.collapse .sidebar ul li a{
            text-align: center;
        }
        .wrapper.collapse .sidebar ul li a span.icon{
            margin: 0;
        }
        .wrapper.collapse .sidebar ul li a span.title{
            display: none;
        }
        .wrapper.collapse .main_content{
            width: calc(100% - 70px);
            margin-left: 70px;
        }

    </style>

    <style>


        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #170f01;
            border: 2px solid white;
            color: #f1ae3f;
        }

        .btn a, .modifier a{
            color: white;
        }

        .modifier {
            display: inline-block;
            margin: 5px;
            padding: 5px 10px;
            background-color: rgb(26, 140, 5);
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
            text-align: center;
            border-radius: 6px;

        }

        .btn  {
            display: inline-block;
            margin: 5px;
            padding: 5px 10px;
            background-color: rgb(255, 21, 0);
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
            text-align: center;
            border-radius: 6px;
        }
        .ajouterbtn {
            display: inline-block;
            margin: 5px;
            padding: 5px 10px;
            background-color: rgb(23, 15, 1);
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
            text-align: center;
            border-radius: 6px;

        }
        .ajouterbtn:hover{
            background-color: #f1ae3f;
        }

        .btn:hover {
            background-color: #ff1500;
        }
        .modifier:hover{
            background-color: rgb(26, 140, 5);

        }

        .form-inline {
            display: inline;
        }
        h2{
            padding: 10px 20px;
            border: transparent;
            border-radius: 25px;
            background-color: rgb(23, 15, 1);
            color: #f1ae3f;
            font-size: 1.2rem;
            font-weight: 700;
            text-align: center;
        }
    </style>

</head>
<body>
<div class="wrapper collapse">
    <div class="top_navbar">
        <div class="hamburger">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <div class="top_menu">
            <div class="logo">
                <marquee>GESTION NOTES</marquee>
            </div>
            <ul>
                <li><a href="monPageDacueill.jsp" title="home"><i class="fa-solid fa-house"></i></a></li>
                <li><a href="logingestionnaire.jsp" title="Gestionnaire"><i class="fa-regular fa-user"></i></a></li>
                <li><a href="login.jsp" title="Enseignant"><i class="fa-solid fa-user-plus"></i></a></li>
                <li><a href="exemple.jsp"><i class="fa-solid fa-address-book"></i></a></li>
            </ul>

        </div>
    </div>
    <div class="sidebar">
        <ul>
            <li><a href="index.jsp" title="home" class="active">
                <span class="icon">
                    <i class="fa-solid fa-house"></i>
                </span>
                <span class="title"> home</span>

            </a></li>
            <li><a href="inscriptionEnseignant.jsp"  title="Inscription d'enseignant" class="active">
                <span class="icon">
                   <i class="fa-solid fa-user-pen"></i>
                </span>
                <span class="title">Inscrire Enseignant</span>
            </a></li>
            <li><a href="InscrireEtudiant.jsp" title="inscription etudiant" class="active">
                <span class="icon">
                  <i class="fa-solid fa-user-pen fa-bounce"></i>
                </span>
                <span class="title">Inscrire Etudiant</span>
            </a></li>
            <li><a href="creerModule.jsp"  title="creation de Module" class="active">
                <span class="icon">
                   <i class="fa-solid fa-book fa-bounce"></i>
                </span>
                <span class="title">Creation Module</span>
            </a></li>
            <li><a href="ajouterFormation.jsp"  title=" LesFormations" class="active">
                <span class="icon" >
                    <i class="fa-solid fa-book-open-reader fa-beat"></i>
                </span>
                <span class="title">Les Formations</span>
            </a></li>
            <li><a href="listeModules.jsp"  title="Liste des modules" class="active">
                <span class="icon">
                   <i class="fa-solid fa-book-open"></i>
                </span>
                <span class="title">Les Modules</span>
            </a></li>
            <li><a href="listeEnseignant.jsp"  title="liste des  Enseignants " class="active">
                <span class="icon">
                  <i class="fa-solid fa-people-line"></i>
                </span>
                <span class="title">Les Enseignants</span>
            </a></li>
            <li><a href="listeEtudiants.jsp"  title="liste des  Etudiants " class="active">
                <span class="icon">
                  <i class="fa-solid fa-user-graduate"></i>
                </span>
                <span class="title">Les Etudiants</span>
            </a></li>
            <li><a href="listeEtudiantsAvecNotes.jsp"  title="liste des  Etudiants avec  leurs  notes " class="active">
                <span class="icon">
                  <i class="fa-solid fa-award"></i>
                </span>
                <span class="title">Les Etudiants<br>Avec Notes</span>
            </a></li>

        </ul>

    </div>
    <div class="main_content">
        <div class="item">

        </div>
        <div class="item">

            <div class="container">

                <h2>Liste des Etudiants</h2>
                <table border="1">
                    <tr>
                        <th>INE</th>
                        <th>Prénoms</th>
                        <th>Nom</th>
                        <th>Date de Naissance</th>
                        <th>Sexe</th>
                        <th>Adresse</th>
                        <th>Email</th>
                        <th>Actions</th>

                    </tr>

                    <%
                        String url = "jdbc:mysql://localhost:3306/gestionnote?serverTimezone=GMT";
                        String user = "root";
                        String password = "";
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        }
                        try (Connection conn = DriverManager.getConnection(url, user, password)) {
                            String sql = "SELECT * FROM Etudiant";
                            try (PreparedStatement stmt = conn.prepareStatement(sql);
                                 ResultSet rs = stmt.executeQuery()) {

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
                            <a href="modifierEtudiant.jsp?INE=<%= rs.getString("INE") %>" class="modifier" title="modifier etudiant"><i class="fa-solid fa-file-pen fa-beat"></i></a>
                            <form action="SupprimerEtudiantServlet" method="post" style="display:inline;">
                                <input type="hidden" name="INE" value="<%= rs.getString("INE") %>">
                                <button type="submit" class="btn btn-delete" title="supprimer etudiant"><i class="fa-solid fa-trash-can fa-beat-fade"></i></button>
                            </form>
                        </td>
                    </tr>
                    <%
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </table>
                <br>
                <a href="InscrireEtudiant.jsp" class="ajouterbtn">Ajouter un autre</a>



            </div>

        </div>

    </div>

</div>

<script>
    $(document).ready(function (){
        $(".hamburger").click(function (){
            $(".wrapper").toggleClass("collapse")

        });

    });
</script>







<%--

--%>

</body>
</html>
