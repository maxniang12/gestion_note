<%--
  Created by IntelliJ IDEA.
  User: max
  Date: 2024-08-01
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>
    <title>les taches enseignant</title>

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
            top:0;


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
            margin: 0 10px !important;
            width: 35px;
            height: 35px;
            line-height: 35px !important;
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
        .wrapper .main_content .item .container {

            width: 100%;
            padding: 20px;
            margin: auto;

        }

        .wrapper .main_content .item .container .header {
            text-align: center;
            padding: 20px;
            height: 100%;
            background-color: #fff;
            margin-bottom: 20px;
            border-radius: 5px;
            top:0;

        }

        .wrapper .main_content .item .container .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 200px!important;
        }

        .wrapper .main_content .item .container .grid-container .chart {
            background: linear-gradient(135deg, #b86c01 0%, #ead2b4 100%);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            cursor: pointer;

        }
        .wrapper .main_content .item .container .grid-container .chart:hover{
            background: linear-gradient(135deg, #f1ae3f 0%, #834a02 100%);


        }
        .wrapper .main_content .item .container  .header h2 {

            font-family: "Edu AU VIC WA NT Hand", cursive;
            font-optical-sizing: auto;
            color: #f89500;
            font-weight: 700;
            font-size:3rem;

        }
        .wrapper .main_content .item .container .header p{
            font-size:1rem;
            font-weight: 600;
            margin: 20px;


        }
        .wrapper .main_content .item .container .header .title {
            font-family: 'Georgia', serif; /* Choisis une police élégante */
            text-align: center; /* Centre le texte horizontalement */
            display: flex;
            border-radius: 10px;
            justify-content: center; /* Centre le texte horizontalement */
            align-items: center; /* Centre le texte verticalement */
            height: 5vh; /* Assure que le texte soit centré verticalement */
            background-color: rgb(241, 174, 63); /* Ajoute une couleur de fond douce */
            color: #ffffff;
            width: 60%; /* Ajuste la largeur du div */
            margin: 50px auto 0; /* Ajoute un espace au-dessus du div et centre le div horizontalement */
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
            <li><a href="indexenseignant.jsp" title="home" class="active">
                <span class="icon">
                    <i class="fa-solid fa-house"></i>
                </span>
                <span class="title"> home</span>

            </a></li>
            <li><a href="recuperatioNotes.jsp"  title="Attribution de Note" class="active">
                <span class="icon">
                  <i class="fa-solid fa-marker"></i>
                </span>
                <span class="title">Attribution Note</span>
            </a></li>

            <li><a href="modifierProfil.jsp"  title="editer son profile" class="active">
                <span class="icon">
                   <i class="fa-solid fa-pen-to-square"></i>
                </span>
                <span class="title">Editer Profile</span>
            </a></li>
            <li><a href="listeModules.jsp"  title=" voir les etudiants " class="active">
                <span class="icon" >
                   <i class="fa-solid fa-graduation-cap"></i>
                </span>
                <span class="title">Les Etudiants</span>
            </a></li>

        </ul>

    </div>
    <div class="main_content">
        <div class="item">

            <div class="container">
                <div class="header">
                    <p>Bienvenue <br>dans notre application web </p><br>
                    <h2>Gestion Notes</h2>
                    <div class="title">
                        <h1>Voici les différentes taches Enseignants </h1>
                    </div>

                   <%--


                    --%>

                </div>
                <div class="grid-container">
                    <div class="chart">
                        <h2><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="200" height="100">
                            <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M481 31C445.1-4.8 386.9-4.8 351 31l-15 15L322.9 33C294.8 4.9 249.2 4.9 221.1 33L135 119c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0L255 66.9c9.4-9.4 24.6-9.4 33.9 0L302.1 80 186.3 195.7 316.3 325.7 481 161c35.9-35.9 35.9-94.1 0-129.9zM293.7 348.3L163.7 218.3 99.5 282.5c-48 48-80.8 109.2-94.1 175.8l-5 25c-1.6 7.9 .9 16 6.6 21.7s13.8 8.1 21.7 6.6l25-5c66.6-13.3 127.8-46.1 175.8-94.1l64.2-64.2z"/>
                        </svg></h2>

                       Attribution de note  !!!
                    </div>
                    <div class="chart">
                        <h2><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="200" heigth="100">
                            <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M320 32c-8.1 0-16.1 1.4-23.7 4.1L15.8 137.4C6.3 140.9 0 149.9 0 160s6.3 19.1 15.8 22.6l57.9 20.9C57.3 229.3 48 259.8 48 291.9l0 28.1c0 28.4-10.8 57.7-22.3 80.8c-6.5 13-13.9 25.8-22.5 37.6C0 442.7-.9 448.3 .9 453.4s6 8.9 11.2 10.2l64 16c4.2 1.1 8.7 .3 12.4-2s6.3-6.1 7.1-10.4c8.6-42.8 4.3-81.2-2.1-108.7C90.3 344.3 86 329.8 80 316.5l0-24.6c0-30.2 10.2-58.7 27.9-81.5c12.9-15.5 29.6-28 49.2-35.7l157-61.7c8.2-3.2 17.5 .8 20.7 9s-.8 17.5-9 20.7l-157 61.7c-12.4 4.9-23.3 12.4-32.2 21.6l159.6 57.6c7.6 2.7 15.6 4.1 23.7 4.1s16.1-1.4 23.7-4.1L624.2 182.6c9.5-3.4 15.8-12.5 15.8-22.6s-6.3-19.1-15.8-22.6L343.7 36.1C336.1 33.4 328.1 32 320 32zM128 408c0 35.3 86 72 192 72s192-36.7 192-72L496.7 262.6 354.5 314c-11.1 4-22.8 6-34.5 6s-23.5-2-34.5-6L143.3 262.6 128 408z"/>
                        </svg></h2>
                        Les etudiants !!!
                        <p>Les etudiants qui sont dans le module</p>
                        <p> ou il est le responsable </p>
                    </div>

                    <div class="chart">
                        <h2><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="200" height="100" >
                            <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M249.6 471.5c10.8 3.8 22.4-4.1 22.4-15.5l0-377.4c0-4.2-1.6-8.4-5-11C247.4 52 202.4 32 144 32C93.5 32 46.3 45.3 18.1 56.1C6.8 60.5 0 71.7 0 83.8L0 454.1c0 11.9 12.8 20.2 24.1 16.5C55.6 460.1 105.5 448 144 448c33.9 0 79 14 105.6 23.5zm76.8 0C353 462 398.1 448 432 448c38.5 0 88.4 12.1 119.9 22.6c11.3 3.8 24.1-4.6 24.1-16.5l0-370.3c0-12.1-6.8-23.3-18.1-27.6C529.7 45.3 482.5 32 432 32c-58.4 0-103.4 20-123 35.6c-3.3 2.6-5 6.8-5 11L304 456c0 11.4 11.7 19.3 22.4 15.5z"/>
                        </svg></h2>
                        <p> Module de  l'enseignant!!!</p>
                        <p>Attribution de note dans ce  modules,</p>
                        <P> note de controle continue</P>
                        <P> note de  l'Examen </P>
                    </div>
                    <div class="chart">
                        <h2><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="200" height="150">
                            <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160L0 416c0 53 43 96 96 96l256 0c53 0 96-43 96-96l0-96c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 96c0 17.7-14.3 32-32 32L96 448c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l96 0c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 64z"/>
                        </svg></h2>
                        le Profile de L'Enseignant !!!
                    </div>

                </div>
            </div>

        </div>
        <div class="item">



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
