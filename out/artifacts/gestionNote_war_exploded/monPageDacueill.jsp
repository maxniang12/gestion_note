<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page d'accueil</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
        justify-content: center; /* Centre le texte horizontalement */
        align-items: center; /* Centre le texte verticalement */
        height: 5vh; /* Assure que le texte soit centré verticalement */
        background-color: #f0f0f0; /* Ajoute une couleur de fond douce */
        width: 65%; /* Ajuste la largeur du div */
        margin: 50px auto 0; /* Ajoute un espace au-dessus du div et centre le div horizontalement */
     }

    .wrapper .main_content .item .container .header .title h1{
        text-align: center;
        justify-content: center;
        align-items: center;
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
            <li><a href="monPageDacueill.jsp" title="home" class="active">
                <span class="icon">
                    <i class="fa-solid fa-house"></i>
                </span>
                <span class="title">Home</span>

            </a></li>
            <li><a href="logingestionnaire.jsp" title="Gestionnaire" class="active">
                <span class="icon">
                    <i class="fa-regular fa-user"></i>
                </span>
                <span class="title">Gestionnaire</span>
            </a></li>
            <li><a href="login.jsp" title="Enseignant" class="active">
                <span class="icon">
                    <i class="fa-solid fa-user-plus"></i>
                </span>
                <span class="title">Enseignant</span>
            </a></li>
            <li><a href="exemple.jsp" class="active">
                <span class="icon">
                    <i class="fa-solid fa-address-book"></i>
                </span>
                <span class="title">contact</span>
            </a></li>
            <li><a href="exemple.jsp" class="active">
                <span class="icon" >
                    <i class="fa-solid fa-id-badge"></i>
                </span>
                <span class="title"> A Propos</span>
            </a></li>

        </ul>

    </div>
    <div class="main_content">
        <div class="item">
            <div class="container">
                <div class="header">
                    <p>Bienvenue<br>dans notre application web </p>
                    <h2>Gestion Notes</h2>

                </div>
                <div class="title">
                    <h1></h1>
                </div>

                <div class="grid-container">
                    <div class="chart">
                        <h2><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="200" heigth="100">
                            <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M192 96a48 48 0 1 0 0-96 48 48 0 1 0 0 96zm-8 384l0-128 16 0 0 128c0 17.7 14.3 32 32 32s32-14.3 32-32l0-288 56 0 64 0 16 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-16 0 0-64 192 0 0 192-192 0 0-32-64 0 0 48c0 26.5 21.5 48 48 48l224 0c26.5 0 48-21.5 48-48l0-224c0-26.5-21.5-48-48-48L368 0c-26.5 0-48 21.5-48 48l0 80-76.9 0-65.9 0c-33.7 0-64.9 17.7-82.3 46.6l-58.3 97c-9.1 15.1-4.2 34.8 10.9 43.9s34.8 4.2 43.9-10.9L120 256.9 120 480c0 17.7 14.3 32 32 32s32-14.3 32-32z"/>
                        </svg></h2>



                        ENSEIGNANT


                    </div>
                    <div class="chart">
                        <h2><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="200" heigth="100">
                            <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M320 32c-8.1 0-16.1 1.4-23.7 4.1L15.8 137.4C6.3 140.9 0 149.9 0 160s6.3 19.1 15.8 22.6l57.9 20.9C57.3 229.3 48 259.8 48 291.9l0 28.1c0 28.4-10.8 57.7-22.3 80.8c-6.5 13-13.9 25.8-22.5 37.6C0 442.7-.9 448.3 .9 453.4s6 8.9 11.2 10.2l64 16c4.2 1.1 8.7 .3 12.4-2s6.3-6.1 7.1-10.4c8.6-42.8 4.3-81.2-2.1-108.7C90.3 344.3 86 329.8 80 316.5l0-24.6c0-30.2 10.2-58.7 27.9-81.5c12.9-15.5 29.6-28 49.2-35.7l157-61.7c8.2-3.2 17.5 .8 20.7 9s-.8 17.5-9 20.7l-157 61.7c-12.4 4.9-23.3 12.4-32.2 21.6l159.6 57.6c7.6 2.7 15.6 4.1 23.7 4.1s16.1-1.4 23.7-4.1L624.2 182.6c9.5-3.4 15.8-12.5 15.8-22.6s-6.3-19.1-15.8-22.6L343.7 36.1C336.1 33.4 328.1 32 320 32zM128 408c0 35.3 86 72 192 72s192-36.7 192-72L496.7 262.6 354.5 314c-11.1 4-22.8 6-34.5 6s-23.5-2-34.5-6L143.3 262.6 128 408z"/>
                        </svg></h2>
                        GESTIONNAIRE
                    </div>
                    <div class="chart">
                        <h2><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="130" heigth="50" >
                            <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M219.3 .5c3.1-.6 6.3-.6 9.4 0l200 40C439.9 42.7 448 52.6 448 64s-8.1 21.3-19.3 23.5L352 102.9l0 57.1c0 70.7-57.3 128-128 128s-128-57.3-128-128l0-57.1L48 93.3l0 65.1 15.7 78.4c.9 4.7-.3 9.6-3.3 13.3s-7.6 5.9-12.4 5.9l-32 0c-4.8 0-9.3-2.1-12.4-5.9s-4.3-8.6-3.3-13.3L16 158.4l0-71.8C6.5 83.3 0 74.3 0 64C0 52.6 8.1 42.7 19.3 40.5l200-40zM111.9 327.7c10.5-3.4 21.8 .4 29.4 8.5l71 75.5c6.3 6.7 17 6.7 23.3 0l71-75.5c7.6-8.1 18.9-11.9 29.4-8.5C401 348.6 448 409.4 448 481.3c0 17-13.8 30.7-30.7 30.7L30.7 512C13.8 512 0 498.2 0 481.3c0-71.9 47-132.7 111.9-153.6z"/>
                        </svg></h2>
                        <!-- Insérer ici le contenu du graphique ou du tableau correspondant -->
                        Les Etudiants
                    </div>
                    <div class="chart">
                        <h2><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="200" height="120">
                            <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path d="M96 0C60.7 0 32 28.7 32 64l0 384c0 35.3 28.7 64 64 64l288 0c35.3 0 64-28.7 64-64l0-384c0-35.3-28.7-64-64-64L96 0zM208 288l64 0c44.2 0 80 35.8 80 80c0 8.8-7.2 16-16 16l-192 0c-8.8 0-16-7.2-16-16c0-44.2 35.8-80 80-80zm-32-96a64 64 0 1 1 128 0 64 64 0 1 1 -128 0zM512 80c0-8.8-7.2-16-16-16s-16 7.2-16 16l0 64c0 8.8 7.2 16 16 16s16-7.2 16-16l0-64zM496 192c-8.8 0-16 7.2-16 16l0 64c0 8.8 7.2 16 16 16s16-7.2 16-16l0-64c0-8.8-7.2-16-16-16zm16 144c0-8.8-7.2-16-16-16s-16 7.2-16 16l0 64c0 8.8 7.2 16 16 16s16-7.2 16-16l0-64z"/>
                        </svg></h2>
                        <!-- Insérer ici le contenu du graphique ou du tableau correspondant -->
                        Contacter et A propos
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
