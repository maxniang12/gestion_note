<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"> </script>
    <title>Login</title>
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

        .wrapper .main_content .item .container{
            max-width: 700px;
            max-height: 900px;
            background: #fff;
            padding: 50px;
            margin: auto;
            border-radius: 5px;
            box-shadow: 0 0 10px rgb(216, 156, 55);
        }
        .wrapper .main_content .item .container h2 {
            text-align: center;
            color: rgba(35, 22, 1, 0.99);
        }
        .wrapper .main_content .item .container .form-group {
            margin-bottom: 15px;
        }
        .wrapper .main_content .item .container .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .wrapper .main_content .item .container .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: rgba(227, 227, 227, 0.9);
            outline: none;
        }
        .wrapper .main_content .item .container .form-group input[type="submit"] {
            background-color: rgba(35, 22, 1, 0.99);
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .wrapper .main_content .item .container .form-group input[type="submit"]:hover {
            background-color: #f1ae3f;
        }
        .wrapper .main_content .item .container .form-group a:hover{



        }
    </style>
<%--
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 400px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group input[type="submit"] {
            background-color: #5cb85c;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .error {
            color: red;
            font-size: 0.9em;
            text-align: center;
        }
    </style>
--%>
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
            <li><a href="" class="active">
                <span class="icon">
                    <i class="fa-solid fa-address-book"></i>
                </span>
                <span class="title">contact</span>
            </a></li>
            <li><a href="#" class="active">
                <span class="icon" >
                    <i class="fa-solid fa-id-badge"></i>
                </span>
                <span class="title"> A Propos</span>
            </a></li>

        </ul>

    </div>
    <div class="main_content">
        <div class="item">


        </div>
        <div class="item">

            <div class="container">
                <h2>Login</h2>
                <form action="LoginServlet" method="post">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="motPasse">Password:</label>
                        <input type="password" id="motPasse" name="motPasse" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="connecter">
                    </div>

                    <div class="form-group">
                        <a href="loginenseignant.jsp"  title="incrivez-vous">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="50" height="20">
                                <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path fill="#f1ae3f" d="M217.9 105.9L340.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L217.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1L32 320c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM352 416l64 0c17.7 0 32-14.3 32-32l0-256c0-17.7-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32l64 0c53 0 96 43 96 96l0 256c0 53-43 96-96 96l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32z"/>
                        </svg></a>
                    </div>


                </form>

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
<div class="container">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="motPasse">Password:</label>
            <input type="password" id="motPasse" name="motPasse" required>
        </div>
        <div class="form-group">
            <input type="submit" value="connecter">
        </div>

        <div class="form-group">
            <a href="loginenseignant.jsp"> creer un coompte </a>
        </div>


    </form>

</div>
--%>
</body>
</html>
