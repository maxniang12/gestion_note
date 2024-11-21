<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter et Gérer les Formations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic">
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

       .container {
           max-width: 4500px;
           max-height: 2000px;
           background: #fff;
           padding: 50px;
           margin: auto;

           display: flex;
           flex-direction:row;
           justify-content:space-evenly;

           /*
            display: flex;
            flex-direction:row;
            justify-content:space-evenly;
            padding: 12px;
            */
        }
        .form-container {
            width:30%;
        }
        .table-container {
            width: 55%;
        }
        form {
            width: 100%;
            margin: auto;
        }
        .form-group {
            margin: 15px 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        button {
            width: 150px;
            padding: 10px 20px;
            border: transparent;
            border-radius: 25px;
            background-color: rgba(35, 22, 1, 0.99);
            color: #ffffff;
            font-size: 1.2rem;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            margin: 5px auto;
        }
        .btn-a button{
            width:5px;
            padding: 10px 20px;
            border: transparent;
            border-radius: 25px;
            background-color: rgba(35, 22, 1, 0.99);
            color: #ffffff;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            margin: 5px auto;

        }

        button:hover {
            background-color: #f1ae3f;
        }
       .btn-a button:hover{
           background-color: #f1ae3f;

       }

        h1, h2 {
            padding: 10px 20px;
            border: transparent;
            border-radius: 25px;
            background-color: rgb(23, 15, 1);
            color: #f1ae3f;
            font-size: 1.2rem;
            font-weight: 700;
            text-align: center;
        }
        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, td {
            border: 2px solid black;
        }
        th, td {
            padding: 10px;
            text-align:center;
        }
        th {
            background-color: rgba(18, 12, 1, 0.99);
            color: #f1ae3f;
            border: 2px solid white;
        }
        .actions a , .les-a a {
            margin-right: 10px;
            padding: 5px 10px;
            color: white;
            text-decoration: none;
            border-radius: 2px;
        }
        a{
            color: white;
        }


        .actions .modifier {
            background-color: #4CAF50; /* Green */
        }
        .actions .modifier:hover {
            background-color: #45a049;
        }
        .actions .supprimer {
            background-color: #f44336; /* Red */
        }
        .actions .supprimer:hover {
            background-color: #d32f2f;
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
                <div class="form-container">
                    <h1>Ajouter une Formation</h1>

                    <% if (request.getAttribute("error") != null) { %>
                    <div style="color: red;">
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                    <form action="AjouterFormationServlet" method="post">
                        <div class="form-group">
                            <label for="intitule">Intitulé :</label>
                            <input type="text" id="intitule" name="intitule" required>
                        </div>
                        <div class="form-group">
                            <label for="niveau">Niveau :</label>
                            <select id="niveau" name="niveau" required>
                                <%-- Liste des niveaux possibles --%>
                                <option value="">Sélectionnez un niveau</option>
                                <option value="L1">L1</option>
                                <option value="L2">L2</option>
                                <option value="L3">L3</option>
                                <option value="M1">M1</option>
                                <option value="M2">M2</option>
                                <option value="D1">D1</option>
                                <option value="D2">D2</option>
                                <option value="D3">D3</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="modules">Modules :</label>
                            <div id="modules">
                                <%-- Options for modules will be populated dynamically from the database --%>
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
                                        String sql = "SELECT code, intitule FROM Module";
                                        try (PreparedStatement stmt = conn.prepareStatement(sql);
                                             ResultSet rs = stmt.executeQuery()) {
                                            while (rs.next()) {
                                                String moduleCode = rs.getString("code");
                                                String moduleIntitule = rs.getString("intitule");
                                %>
                                <div>
                                    <input type="checkbox" id="module_<%=moduleCode%>" name="modules" value="<%=moduleCode%>">
                                    <label for="module_<%=moduleCode%>"><%=moduleIntitule%></label>
                                </div>
                                <%
                                            }
                                        }
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </div>
                        </div>
                        <button type="submit">Ajouter</button>
                    </form>
                </div>

                <div class="table-container">
                    <h2>Liste des Formations</h2>
                    <table>
                        <tr>
                            <th>Intitulé</th>
                            <th>Niveau</th>
                            <th>Modules</th>
                            <th>Actions</th>
                            <th>Inscrire Etudiant de cette formation</th>
                            <th>Désinscrire Etudiant de cette formation</th>
                            <th>Voir Étudiants de cette formation</th>
                            <th>Voir les enseignants des differentes formations</th>
                        </tr>
                        <%
                            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                                String sql = "SELECT f.id, f.intitule, f.niveau, GROUP_CONCAT(m.intitule SEPARATOR ', ') AS modules " +
                                        "FROM Formation f " +
                                        "LEFT JOIN Formation_Module fm ON f.id = fm.formation_id " +
                                        "LEFT JOIN Module m ON fm.module_id = m.code " +
                                        "GROUP BY f.id, f.intitule, f.niveau";
                                try (PreparedStatement stmt = conn.prepareStatement(sql);
                                     ResultSet rs = stmt.executeQuery()) {
                                    while (rs.next()) {
                                        int id = rs.getInt("id");
                                        String intitule = rs.getString("intitule");
                                        String niveau = rs.getString("niveau");
                                        String modules = rs.getString("modules") != null ? rs.getString("modules") : "Aucun module";
                        %>
                        <tr>
                            <td><%= intitule %></td>
                            <td><%= niveau %></td>
                            <td><%= modules %></td>
                            <td class="actions">
                                <a href="ModifierFormation.jsp?id=<%= id %>" class="modifier" title="modifier une formation"><i class="fa-solid fa-file-pen fa-beat"></i></a><br><br>
                                <a href="SupprimerFormationServlet?id=<%= id %>" class="supprimer" title="supprimer une formation"><i class="fa-solid fa-trash-can fa-beat-fade"></i></a>
                            </td>
                            <td>
                                <form class="form-inline" action="InscrireEtudiantFormationServlet" method="post">
                                    <input type="hidden" name="formationId" value="<%= id %>">
                                    <input type="text" name="etudiantId" placeholder="INE de l'Étudiant" required>
                                    <button type="submit">Inscrire</button>
                                </form>
                            </td>
                            <td>
                                <form class="form-inline" action="DesinscrireEtudiantFormationServlet" method="post">
                                    <input type="hidden" name="formationId" value="<%= id %>">
                                    <input type="text" name="etudiantId" placeholder="INE de l'Étudiant" required>
                                    <button type="submit">Désinscrire</button>
                                </form>
                            </td>
                            <td>
                               <button class="btn-a"> <a href="ListeEtudiantsParFormationServlet?formationId=<%= id %>" title="les etudiants de formation" class="les-a"><%--<i class="fa-solid fa-user-graduate"></i>--%>voir</a></button>
                            </td>
                            <td>
                               <button class="btn-a"> <a href="ListeDesEnseignantsParFormationServlet?formationId=<%= id %>" title="les enseignants de formation " class="les-a"><%--<i class="fa-solid fa-person-chalkboard"></i>--%>voir</a></button>
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
                </div>
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

</body>
</html>